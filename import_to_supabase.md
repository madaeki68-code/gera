# Import Vena Pictures Database ke Supabase

Saya telah membuat schema SQL dan data mock untuk aplikasi Vena Pictures. Berikut langkah-langkah untuk mengimportnya ke Supabase:

## File yang Dibuat

1. **`schema.sql`** - Berisi struktur database lengkap dengan:
   - Semua tabel yang diperlukan (profiles, clients, projects, transactions, dll.)
   - Index untuk performa yang optimal
   - Row Level Security (RLS) policies
   - Triggers untuk auto-update timestamps

2. **`seed_data.sql`** - Berisi data mock yang realistis:
   - 6 paket layanan (pernikahan, korporat, lamaran, dll.)
   - 4 add-on services
   - 4 klien sample
   - 4 anggota tim freelancer
   - 4 proyek dengan berbagai status
   - 4 financial pockets
   - 3 kartu/rekening
   - 5 transaksi keuangan
   - 4 leads potensial
   - 6 aset peralatan
   - 1 profil vendor utama (Vena Pictures)

## Cara Import ke Supabase

### 1. Buka Supabase Dashboard
- Masuk ke https://supabase.com
- Pilih project Anda
- Go to SQL Editor

### 2. Import Schema
- Copy seluruh isi file `schema.sql`
- Paste ke SQL Editor
- Klik "Run" untuk membuat semua tabel dan struktur database

### 3. Import Data Mock
- Copy seluruh isi file `seed_data.sql`
- Paste ke SQL Editor  
- Klik "Run" untuk mengisi database dengan data sample

### 4. Update Admin User ID (Opsional)
Jika Anda sudah punya user admin di Supabase Auth, update profile admin:

```sql
UPDATE profiles 
SET admin_user_id = 'your-actual-auth-user-id' 
WHERE email = 'admin@vena.pictures';
```

## Verifikasi Import

Setelah import berhasil, Anda bisa cek dengan query:

```sql
-- Cek jumlah data di setiap tabel
SELECT 'profiles' as table_name, COUNT(*) as count FROM profiles
UNION ALL
SELECT 'clients', COUNT(*) FROM clients
UNION ALL  
SELECT 'packages', COUNT(*) FROM packages
UNION ALL
SELECT 'projects', COUNT(*) FROM projects
UNION ALL
SELECT 'transactions', COUNT(*) FROM transactions;
```

## Login Data untuk Testing

Setelah setup selesai, Anda bisa login dengan:
- **Admin**: admin@vena.pictures / password: admin
- **Member**: member@vena.pictures / password: member

## Fitur Database yang Sudah Disiapkan

✅ Row Level Security (RLS) aktif
✅ Auto-updating timestamps
✅ Proper foreign key relationships  
✅ Indexed untuk performa optimal
✅ JSON fields untuk data kompleks
✅ UUID primary keys
✅ Sample data yang realistis

Database sudah siap digunakan dengan aplikasi React Anda!