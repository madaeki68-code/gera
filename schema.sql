-- Vena Pictures Database Schema for Supabase
-- Enable Row Level Security and necessary extensions

-- Enable necessary extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Profiles table (Main vendor profile)
CREATE TABLE IF NOT EXISTS profiles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    admin_user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    full_name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    company_name TEXT NOT NULL,
    website TEXT,
    address TEXT NOT NULL,
    bank_account TEXT NOT NULL,
    authorized_signer TEXT NOT NULL,
    id_number TEXT,
    bio TEXT NOT NULL,
    income_categories TEXT[] DEFAULT '{}',
    expense_categories TEXT[] DEFAULT '{}',
    project_types TEXT[] DEFAULT '{}',
    event_types TEXT[] DEFAULT '{}',
    asset_categories TEXT[] DEFAULT '{}',
    sop_categories TEXT[] DEFAULT '{}',
    package_categories TEXT[] DEFAULT '{}',
    project_status_config JSONB DEFAULT '[]',
    notification_settings JSONB DEFAULT '{}',
    security_settings JSONB DEFAULT '{}',
    briefing_template TEXT DEFAULT '',
    terms_and_conditions TEXT,
    contract_template TEXT,
    logo_url TEXT,
    brand_color TEXT DEFAULT '#3b82f6',
    public_page_config JSONB DEFAULT '{}',
    package_share_template TEXT,
    booking_form_template TEXT,
    chat_templates JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Clients table
CREATE TABLE IF NOT EXISTS clients (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    whatsapp TEXT,
    since DATE NOT NULL,
    instagram TEXT,
    status TEXT NOT NULL DEFAULT 'Active',
    client_type TEXT NOT NULL,
    last_contact DATE NOT NULL,
    portal_access_id TEXT UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Team Members table
CREATE TABLE IF NOT EXISTS team_members (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    role TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    standard_fee NUMERIC(12,2) NOT NULL DEFAULT 0,
    no_rek TEXT,
    reward_balance NUMERIC(12,2) DEFAULT 0,
    rating NUMERIC(3,2) DEFAULT 0,
    performance_notes JSONB DEFAULT '{}',
    portal_access_id TEXT UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Packages table
CREATE TABLE IF NOT EXISTS packages (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    price NUMERIC(12,2) NOT NULL,
    category TEXT NOT NULL,
    physical_items JSONB DEFAULT '[]',
    digital_items TEXT[] DEFAULT '{}',
    processing_time TEXT NOT NULL,
    default_printing_cost NUMERIC(12,2),
    default_transport_cost NUMERIC(12,2),
    photographers TEXT,
    videographers TEXT,
    cover_image_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Add-ons table
CREATE TABLE IF NOT EXISTS add_ons (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    price NUMERIC(12,2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Projects table
CREATE TABLE IF NOT EXISTS projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_name TEXT NOT NULL,
    client_name TEXT NOT NULL,
    client_id UUID REFERENCES clients(id) ON DELETE CASCADE,
    project_type TEXT NOT NULL,
    package_name TEXT NOT NULL,
    package_id UUID REFERENCES packages(id),
    add_ons JSONB DEFAULT '[]',
    date DATE NOT NULL,
    deadline_date DATE,
    location TEXT NOT NULL,
    progress INTEGER DEFAULT 0,
    status TEXT NOT NULL DEFAULT 'Persiapan',
    active_sub_statuses TEXT[],
    total_cost NUMERIC(12,2) NOT NULL,
    amount_paid NUMERIC(12,2) DEFAULT 0,
    payment_status TEXT NOT NULL DEFAULT 'Unpaid',
    team JSONB DEFAULT '{}',
    notes TEXT,
    accommodation TEXT,
    drive_link TEXT,
    client_drive_link TEXT,
    final_drive_link TEXT,
    start_time TIME,
    end_time TIME,
    image TEXT,
    revisions JSONB,
    promo_code_id UUID,
    discount_amount NUMERIC(12,2),
    shipping_details TEXT,
    dp_proof_url TEXT,
    printing_details JSONB,
    printing_cost NUMERIC(12,2),
    transport_cost NUMERIC(12,2),
    is_editing_confirmed_by_client BOOLEAN,
    is_printing_confirmed_by_client BOOLEAN,
    is_delivery_confirmed_by_client BOOLEAN,
    confirmed_sub_statuses TEXT[],
    client_sub_status_notes JSONB,
    sub_status_confirmation_sent_at JSONB,
    completed_digital_items TEXT[],
    invoice_signature TEXT,
    custom_sub_statuses JSONB,
    booking_status TEXT,
    rejection_reason TEXT,
    chat_history JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Financial Pockets table
CREATE TABLE IF NOT EXISTS financial_pockets (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    icon TEXT NOT NULL,
    type TEXT NOT NULL,
    amount NUMERIC(12,2) DEFAULT 0,
    goal_amount NUMERIC(12,2),
    lock_end_date DATE,
    members JSONB,
    source_card_id UUID,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Cards table
CREATE TABLE IF NOT EXISTS cards (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    card_holder_name TEXT NOT NULL,
    bank_name TEXT NOT NULL,
    card_type TEXT NOT NULL,
    last_four_digits TEXT NOT NULL,
    expiry_date DATE,
    balance NUMERIC(12,2) DEFAULT 0,
    color_gradient TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Transactions table
CREATE TABLE IF NOT EXISTS transactions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    date DATE NOT NULL,
    description TEXT NOT NULL,
    amount NUMERIC(12,2) NOT NULL,
    type TEXT NOT NULL,
    project_id UUID REFERENCES projects(id),
    category TEXT NOT NULL,
    method TEXT NOT NULL,
    pocket_id UUID REFERENCES financial_pockets(id),
    card_id UUID REFERENCES cards(id),
    printing_item_id TEXT,
    vendor_signature TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Leads table
CREATE TABLE IF NOT EXISTS leads (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    contact_channel TEXT NOT NULL,
    location TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'New',
    date DATE NOT NULL,
    notes TEXT,
    whatsapp TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Assets table
CREATE TABLE IF NOT EXISTS assets (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    category TEXT NOT NULL,
    purchase_date DATE NOT NULL,
    purchase_price NUMERIC(12,2) NOT NULL,
    serial_number TEXT,
    status TEXT NOT NULL DEFAULT 'Active',
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Contracts table
CREATE TABLE IF NOT EXISTS contracts (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    contract_number TEXT UNIQUE NOT NULL,
    client_id UUID REFERENCES clients(id) ON DELETE CASCADE,
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE,
    signing_date DATE NOT NULL,
    signing_location TEXT NOT NULL,
    client_name_1 TEXT NOT NULL,
    client_address_1 TEXT NOT NULL,
    client_phone_1 TEXT NOT NULL,
    client_name_2 TEXT,
    client_address_2 TEXT,
    client_phone_2 TEXT,
    shooting_duration TEXT NOT NULL,
    guaranteed_photos TEXT NOT NULL,
    album_details TEXT NOT NULL,
    digital_files_format TEXT NOT NULL,
    other_items TEXT NOT NULL,
    personnel_count TEXT NOT NULL,
    delivery_timeframe TEXT NOT NULL,
    dp_date DATE NOT NULL,
    final_payment_date DATE NOT NULL,
    cancellation_policy TEXT NOT NULL,
    jurisdiction TEXT NOT NULL,
    vendor_signature TEXT,
    client_signature TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_clients_email ON clients(email);
CREATE INDEX IF NOT EXISTS idx_projects_client_id ON projects(client_id);
CREATE INDEX IF NOT EXISTS idx_projects_date ON projects(date);
CREATE INDEX IF NOT EXISTS idx_transactions_project_id ON transactions(project_id);
CREATE INDEX IF NOT EXISTS idx_transactions_date ON transactions(date);
CREATE INDEX IF NOT EXISTS idx_leads_status ON leads(status);

-- Enable Row Level Security
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE clients ENABLE ROW LEVEL SECURITY;
ALTER TABLE team_members ENABLE ROW LEVEL SECURITY;
ALTER TABLE packages ENABLE ROW LEVEL SECURITY;
ALTER TABLE add_ons ENABLE ROW LEVEL SECURITY;
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE financial_pockets ENABLE ROW LEVEL SECURITY;
ALTER TABLE cards ENABLE ROW LEVEL SECURITY;
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;
ALTER TABLE leads ENABLE ROW LEVEL SECURITY;
ALTER TABLE assets ENABLE ROW LEVEL SECURITY;
ALTER TABLE contracts ENABLE ROW LEVEL SECURITY;

-- Create RLS policies (allow all operations for authenticated users for now)
-- You can customize these based on your security requirements

CREATE POLICY "Allow authenticated users" ON profiles
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow authenticated users" ON clients
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow authenticated users" ON team_members
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow authenticated users" ON packages
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow authenticated users" ON add_ons
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow authenticated users" ON projects
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow authenticated users" ON financial_pockets
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow authenticated users" ON cards
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow authenticated users" ON transactions
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow authenticated users" ON leads
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow authenticated users" ON assets
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

CREATE POLICY "Allow authenticated users" ON contracts
    FOR ALL TO authenticated USING (true) WITH CHECK (true);

-- Create triggers for updated_at columns
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON profiles FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_clients_updated_at BEFORE UPDATE ON clients FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_team_members_updated_at BEFORE UPDATE ON team_members FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_packages_updated_at BEFORE UPDATE ON packages FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_add_ons_updated_at BEFORE UPDATE ON add_ons FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_projects_updated_at BEFORE UPDATE ON projects FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_financial_pockets_updated_at BEFORE UPDATE ON financial_pockets FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_cards_updated_at BEFORE UPDATE ON cards FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_transactions_updated_at BEFORE UPDATE ON transactions FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_leads_updated_at BEFORE UPDATE ON leads FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_assets_updated_at BEFORE UPDATE ON assets FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_contracts_updated_at BEFORE UPDATE ON contracts FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();