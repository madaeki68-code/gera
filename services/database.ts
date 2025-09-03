import { supabase } from './supabase'
import type { Database } from '../types/database'

type Tables = Database['public']['Tables']

// Database service functions
export const database = {
  // Get all data for the app
  loadAppData: async () => {
    try {
      console.log('🔄 Loading data from Supabase...')
      
      const [
        profilesRes,
        clientsRes,
        projectsRes,
        teamMembersRes,
        transactionsRes,
        packagesRes,
        addOnsRes,
        pocketsRes,
        cardsRes,
        leadsRes,
        assetsRes,
        contractsRes,
        feedbackRes,
        notificationsRes,
        socialPostsRes,
        promoCodesRes,
        sopsRes,
        teamProjectPaymentsRes,
        teamPaymentRecordsRes,
        rewardLedgerRes
      ] = await Promise.all([
        supabase.from('profiles').select('*').limit(1).single(),
        supabase.from('clients').select('*'),
        supabase.from('projects').select('*'),
        supabase.from('team_members').select('*'),
        supabase.from('transactions').select('*'),
        supabase.from('packages').select('*'),
        supabase.from('add_ons').select('*'),
        supabase.from('financial_pockets').select('*'),
        supabase.from('cards').select('*'),
        supabase.from('leads').select('*'),
        supabase.from('assets').select('*'),
        supabase.from('contracts').select('*'),
        supabase.from('client_feedback').select('*'),
        supabase.from('notifications').select('*'),
        supabase.from('social_media_posts').select('*'),
        supabase.from('promo_codes').select('*'),
        supabase.from('sops').select('*'),
        supabase.from('team_project_payments').select('*'),
        supabase.from('team_payment_records').select('*'),
        supabase.from('reward_ledger_entries').select('*')
      ])

      // Log any errors
      const errors = [
        profilesRes.error,
        clientsRes.error,
        projectsRes.error,
        teamMembersRes.error,
        transactionsRes.error,
        packagesRes.error,
        addOnsRes.error,
        pocketsRes.error,
        cardsRes.error,
        leadsRes.error,
        assetsRes.error,
        contractsRes.error,
        feedbackRes.error,
        notificationsRes.error,
        socialPostsRes.error,
        promoCodesRes.error,
        sopsRes.error,
        teamProjectPaymentsRes.error,
        teamPaymentRecordsRes.error,
        rewardLedgerRes.error
      ].filter(Boolean)

      if (errors.length > 0) {
        console.error('❌ Database errors:', errors)
      }

      const result = {
        profile: profilesRes.data || null,
        clients: clientsRes.data || [],
        projects: projectsRes.data || [],
        teamMembers: teamMembersRes.data || [],
        transactions: transactionsRes.data || [],
        packages: packagesRes.data || [],
        addOns: addOnsRes.data || [],
        pockets: pocketsRes.data || [],
        cards: cardsRes.data || [],
        leads: leadsRes.data || [],
        assets: assetsRes.data || [],
        contracts: contractsRes.data || [],
        clientFeedback: feedbackRes.data || [],
        notifications: notificationsRes.data || [],
        socialMediaPosts: socialPostsRes.data || [],
        promoCodes: promoCodesRes.data || [],
        sops: sopsRes.data || [],
        teamProjectPayments: teamProjectPaymentsRes.data || [],
        teamPaymentRecords: teamPaymentRecordsRes.data || [],
        rewardLedgerEntries: rewardLedgerRes.data || []
      }

      console.log('✅ Data loaded from Supabase:', {
        profile: !!result.profile,
        clients: result.clients.length,
        projects: result.projects.length,
        teamMembers: result.teamMembers.length,
        transactions: result.transactions.length,
        packages: result.packages.length,
        addOns: result.addOns.length,
        pockets: result.pockets.length,
        cards: result.cards.length,
        leads: result.leads.length,
        assets: result.assets.length,
        contracts: result.contracts.length,
        clientFeedback: result.clientFeedback.length,
        notifications: result.notifications.length,
        socialMediaPosts: result.socialMediaPosts.length,
        promoCodes: result.promoCodes.length,
        sops: result.sops.length,
        teamProjectPayments: result.teamProjectPayments.length,
        teamPaymentRecords: result.teamPaymentRecords.length,
        rewardLedgerEntries: result.rewardLedgerEntries.length
      })

      return result
    } catch (error) {
      console.error('❌ Error loading app data:', error)
      throw error
    }
  },

  // Individual table helpers
  profiles: {
    get: () => supabase.from('profiles').select('*').limit(1).single(),
    update: (id: string, data: Partial<Tables['profiles']['Update']>) => 
      supabase.from('profiles').update(data).eq('id', id),
  },

  clients: {
    getAll: () => supabase.from('clients').select('*'),
    create: (data: Tables['clients']['Insert']) => 
      supabase.from('clients').insert(data).select().single(),
    update: (id: string, data: Partial<Tables['clients']['Update']>) => 
      supabase.from('clients').update(data).eq('id', id),
    delete: (id: string) => supabase.from('clients').delete().eq('id', id),
  },

  projects: {
    getAll: () => supabase.from('projects').select('*'),
    create: (data: Tables['projects']['Insert']) => 
      supabase.from('projects').insert(data).select().single(),
    update: (id: string, data: Partial<Tables['projects']['Update']>) => 
      supabase.from('projects').update(data).eq('id', id),
    delete: (id: string) => supabase.from('projects').delete().eq('id', id),
  },

  teamMembers: {
    getAll: () => supabase.from('team_members').select('*'),
    create: (data: Tables['team_members']['Insert']) => 
      supabase.from('team_members').insert(data).select().single(),
    update: (id: string, data: Partial<Tables['team_members']['Update']>) => 
      supabase.from('team_members').update(data).eq('id', id),
    delete: (id: string) => supabase.from('team_members').delete().eq('id', id),
  },

  transactions: {
    getAll: () => supabase.from('transactions').select('*'),
    create: (data: Tables['transactions']['Insert']) => 
      supabase.from('transactions').insert(data).select().single(),
    update: (id: string, data: Partial<Tables['transactions']['Update']>) => 
      supabase.from('transactions').update(data).eq('id', id),
    delete: (id: string) => supabase.from('transactions').delete().eq('id', id),
  },

  packages: {
    getAll: () => supabase.from('packages').select('*'),
    create: (data: Tables['packages']['Insert']) => 
      supabase.from('packages').insert(data).select().single(),
    update: (id: string, data: Partial<Tables['packages']['Update']>) => 
      supabase.from('packages').update(data).eq('id', id),
    delete: (id: string) => supabase.from('packages').delete().eq('id', id),
  },

  // Add other table helpers as needed...
}