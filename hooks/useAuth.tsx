import { createContext, useContext, useEffect, useState, ReactNode } from 'react'
import { User as SupabaseUser } from '@supabase/supabase-js'
import { auth } from '../services/supabase'
import { database } from '../services/database'
import type { User } from '../types'

interface AuthContextType {
  user: User | null
  supabaseUser: SupabaseUser | null
  isAuthenticated: boolean
  isLoading: boolean
  signIn: (email: string, password: string) => Promise<{ error: any }>
  signOut: () => Promise<void>
  loadAppData: () => Promise<void>
}

const AuthContext = createContext<AuthContextType>({
  user: null,
  supabaseUser: null,
  isAuthenticated: false,
  isLoading: true,
  signIn: async () => ({ error: null }),
  signOut: async () => {},
  loadAppData: async () => {}
})

export const useAuth = () => {
  const context = useContext(AuthContext)
  if (!context) {
    throw new Error('useAuth must be used within an AuthProvider')
  }
  return context
}

interface AuthProviderProps {
  children: ReactNode
}

export const AuthProvider = ({ children }: AuthProviderProps) => {
  const [user, setUser] = useState<User | null>(null)
  const [supabaseUser, setSupabaseUser] = useState<SupabaseUser | null>(null)
  const [isLoading, setIsLoading] = useState(true)

  const loadAppData = async () => {
    try {
      console.log('🔄 Loading app data from Supabase...')
      const data = await database.loadAppData()
      
      // Update localStorage with fresh data from Supabase
      if (data) {
        const dataMapping = {
          'vena-profile': data.profile,
          'vena-clients': data.clients,
          'vena-projects': data.projects,
          'vena-teamMembers': data.teamMembers,
          'vena-transactions': data.transactions,
          'vena-packages': data.packages,
          'vena-addOns': data.addOns,
          'vena-pockets': data.pockets,
          'vena-cards': data.cards,
          'vena-leads': data.leads,
          'vena-assets': data.assets,
          'vena-contracts': data.contracts,
          'vena-clientFeedback': data.clientFeedback,
          'vena-notifications': data.notifications,
          'vena-socialMediaPosts': data.socialMediaPosts,
          'vena-promoCodes': data.promoCodes,
          'vena-sops': data.sops,
          'vena-teamProjectPayments': data.teamProjectPayments,
          'vena-teamPaymentRecords': data.teamPaymentRecords,
          'vena-rewardLedgerEntries': data.rewardLedgerEntries
        }

        Object.entries(dataMapping).forEach(([key, value]) => {
          localStorage.setItem(key, JSON.stringify(value || []))
        })
      }
      
      console.log('✅ App data loaded and synced to localStorage')
      // Force page reload to use new data
      window.location.reload()
    } catch (error) {
      console.error('❌ Error loading app data:', error)
    }
  }

  useEffect(() => {
    // Get initial user
    auth.getCurrentUser().then(({ data: { user } }) => {
      setSupabaseUser(user)
      if (user) {
        // Convert Supabase user to app User format
        const appUser: User = {
          id: user.id,
          email: user.email || '',
          password: '', // We don't store passwords in the client
          fullName: user.user_metadata?.full_name || user.email?.split('@')[0] || '',
          companyName: user.user_metadata?.company_name || '',
          role: 'Admin', // Set as Admin for now
          permissions: []
        }
        setUser(appUser)
        loadAppData() // Load data when user is authenticated
      }
      setIsLoading(false)
    })

    // Listen for auth state changes
    const { data: { subscription } } = auth.onAuthStateChange(async (event, session) => {
      if (session?.user) {
        setSupabaseUser(session.user)
        const appUser: User = {
          id: session.user.id,
          email: session.user.email || '',
          password: '',
          fullName: session.user.user_metadata?.full_name || session.user.email?.split('@')[0] || '',
          companyName: session.user.user_metadata?.company_name || '',
          role: 'Admin', // Set as Admin for now
          permissions: []
        }
        setUser(appUser)
        
        if (event === 'SIGNED_IN') {
          await loadAppData() // Load data on sign in
        }
      } else {
        setUser(null)
        setSupabaseUser(null)
        // Clear localStorage on logout
        Object.keys(localStorage).forEach(key => {
          if (key.startsWith('vena-')) {
            localStorage.removeItem(key)
          }
        })
      }
      setIsLoading(false)
    })

    return () => subscription.unsubscribe()
  }, [])

  const signIn = async (email: string, password: string) => {
    setIsLoading(true)
    const { error } = await auth.signIn(email, password)
    setIsLoading(false)
    return { error }
  }

  const signOut = async () => {
    setIsLoading(true)
    await auth.signOut()
    setUser(null)
    setSupabaseUser(null)
    setIsLoading(false)
  }

  const value = {
    user,
    supabaseUser,
    isAuthenticated: !!user,
    isLoading,
    signIn,
    signOut,
    loadAppData
  }

  return (
    <AuthContext.Provider value={value}>
      {children}
    </AuthContext.Provider>
  )
}