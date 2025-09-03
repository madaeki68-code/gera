-- Vena Pictures Mock Data for Supabase (Fixed UUID Format)
-- This script inserts sample data into the database tables

-- Sample Packages
INSERT INTO packages (id, name, price, category, physical_items, digital_items, processing_time, photographers, videographers) VALUES
('01234567-89ab-cdef-0123-456789abcdef', 'Paket Pernikahan Silver', 12000000.00, 'Pernikahan', 
'[{"name": "Album Cetak Eksklusif 20x30cm 20 Halaman", "price": 850000}, {"name": "Cetak Foto 16R + Bingkai Minimalis (2pcs)", "price": 400000}]',
'{"Semua file foto (JPG) hasil seleksi", "1 Video highlight (3-5 menit)"}',
'30 hari kerja', '2 Fotografer', '1 Videografer'),

('11234567-89ab-cdef-0123-456789abcdef', 'Paket Pernikahan Gold', 25000000.00, 'Pernikahan',
'[{"name": "Album Cetak Premium 25x30cm 30 Halaman", "price": 1500000}, {"name": "Cetak Foto 20R + Bingkai Premium (2pcs)", "price": 750000}, {"name": "Box Kayu Eksklusif + Flashdisk 64GB", "price": 500000}]',
'{"Semua file foto (JPG) tanpa seleksi", "1 Video sinematik (5-7 menit)", "Video Teaser 1 menit untuk sosmed"}',
'45 hari kerja', '2 Fotografer', '2 Videografer'),

('21234567-89ab-cdef-0123-456789abcdef', 'Paket Acara Korporat', 8000000.00, 'Korporat',
'[]',
'{"Dokumentasi foto (JPG)", "1 Video dokumentasi (10-15 menit)"}',
'14 hari kerja', '1 Fotografer', '1 Videografer'),

('31234567-89ab-cdef-0123-456789abcdef', 'Paket Lamaran', 5000000.00, 'Lamaran',
'[]',
'{"Semua file foto (JPG) hasil seleksi", "1 Video highlight (1-2 menit)"}',
'14 hari kerja', '1 Fotografer', NULL),

('41234567-89ab-cdef-0123-456789abcdef', 'Paket Prewedding', 6500000.00, 'Prewedding',
'[{"name": "Cetak Foto Kanvas 40x60cm", "price": 600000}]',
'{"50 foto edit high-resolution", "1 video sinematik 1 menit"}',
'21 hari kerja', '1 Fotografer', '1 Videografer'),

('51234567-89ab-cdef-0123-456789abcdef', 'Sesi Foto Keluarga', 3500000.00, 'Keluarga',
'[{"name": "Cetak Foto 10R + Bingkai (5pcs)", "price": 350000}]',
'{"25 foto edit high-resolution"}',
'10 hari kerja', '1 Fotografer', NULL);

-- Sample Add-ons
INSERT INTO add_ons (id, name, price) VALUES
('61234567-89ab-cdef-0123-456789abcdef', 'Same Day Edit Video', 2500000.00),
('71234567-89ab-cdef-0123-456789abcdef', 'Aerial Drone Shot', 1500000.00),
('81234567-89ab-cdef-0123-456789abcdef', 'Jasa MUA Profesional', 1000000.00),
('91234567-89ab-cdef-0123-456789abcdef', 'Album Tambahan untuk Orang Tua', 1200000.00);

-- Sample Clients
INSERT INTO clients (id, name, email, phone, whatsapp, since, instagram, status, client_type, last_contact, portal_access_id) VALUES
('a1234567-89ab-cdef-0123-456789abcdef', 'Sarah & Ahmad', 'sarah.ahmad@email.com', '081234567890', '081234567890', '2024-01-15', '@sarahahmad', 'Active', 'Premium', '2024-01-20', 'CLIENT_SARAH_AHMAD'),
('b1234567-89ab-cdef-0123-456789abcdef', 'PT Maju Bersama', 'info@majubersama.co.id', '0216789012', '081987654321', '2024-02-10', '@majubersama', 'Active', 'Corporate', '2024-02-15', 'CLIENT_MAJU_BERSAMA'),
('c1234567-89ab-cdef-0123-456789abcdef', 'Maya & Rudi', 'maya.rudi@gmail.com', '081555666777', '081555666777', '2024-03-05', '@mayarudi2024', 'Active', 'Regular', '2024-03-10', 'CLIENT_MAYA_RUDI'),
('d1234567-89ab-cdef-0123-456789abcdef', 'Keluarga Santoso', 'pak.santoso@yahoo.com', '081333444555', '081333444555', '2024-01-25', NULL, 'Active', 'Regular', '2024-01-30', 'CLIENT_SANTOSO');

-- Sample Team Members (Fixed UUID format)
INSERT INTO team_members (id, name, role, email, phone, standard_fee, no_rek, reward_balance, rating, portal_access_id) VALUES
('e1234567-89ab-cdef-0123-456789abcdef', 'Budi Cahaya', 'Photographer', 'budi.cahaya@vena.pictures', '081111222333', 800000.00, '1234567890', 150000.00, 4.8, 'FREELANCER_BUDI'),
('f1234567-89ab-cdef-0123-456789abcdef', 'Sari Visual', 'Videographer', 'sari.visual@vena.pictures', '081444555666', 1000000.00, '0987654321', 200000.00, 4.9, 'FREELANCER_SARI'),
('01234567-89ab-cdef-0123-456789abcdea', 'Dedi Editor', 'Editor', 'dedi.editor@vena.pictures', '081777888999', 600000.00, '1122334455', 100000.00, 4.7, 'FREELANCER_DEDI'),
('01234567-89ab-cdef-0123-456789abcdeb', 'Rina Asisten', 'Assistant', 'rina.asisten@vena.pictures', '081666777888', 400000.00, '5566778899', 75000.00, 4.6, 'FREELANCER_RINA');

-- Sample Financial Pockets (Fixed UUID format)
INSERT INTO financial_pockets (id, name, description, icon, type, amount, goal_amount, source_card_id) VALUES
('01234567-89ab-cdef-0123-456789abcdec', 'Dana Operasional', 'Dana untuk kebutuhan operasional sehari-hari', '💼', 'operational', 15000000.00, NULL, NULL),
('01234567-89ab-cdef-0123-456789abcded', 'Dana Darurat', 'Dana cadangan untuk situasi darurat', '🚨', 'emergency', 10000000.00, 20000000.00, NULL),
('01234567-89ab-cdef-0123-456789abcdee', 'Investasi Peralatan', 'Dana untuk membeli peralatan baru', '📷', 'investment', 5000000.00, 30000000.00, NULL),
('01234567-89ab-cdef-0123-456789abcdef', 'Bonus Tim', 'Dana untuk bonus kinerja tim', '🎉', 'bonus', 3000000.00, 10000000.00, NULL);

-- Sample Cards (Fixed UUID format)
INSERT INTO cards (id, card_holder_name, bank_name, card_type, last_four_digits, expiry_date, balance, color_gradient) VALUES
('01234567-89ab-cdef-0123-456789abcde0', 'Andi Vena', 'Bank BCA', 'Debit', '1234', '2027-12-31', 25000000.00, 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)'),
('01234567-89ab-cdef-0123-456789abcde1', 'Vena Pictures', 'Bank Mandiri', 'Credit', '5678', '2026-08-31', 15000000.00, 'linear-gradient(135deg, #f093fb 0%, #f5576c 100%)'),
('01234567-89ab-cdef-0123-456789abcde2', 'Andi Vena', 'Bank BNI', 'Debit', '9012', '2028-03-31', 8000000.00, 'linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)');

-- Sample Projects (Fixed UUID format)
INSERT INTO projects (id, project_name, client_name, client_id, project_type, package_name, package_id, date, deadline_date, location, progress, status, total_cost, amount_paid, payment_status, team) VALUES
('01234567-89ab-cdef-0123-456789abcde3', 'Pernikahan Sarah & Ahmad', 'Sarah & Ahmad', 'a1234567-89ab-cdef-0123-456789abcdef', 'Pernikahan', 'Paket Pernikahan Gold', '11234567-89ab-cdef-0123-456789abcdef', '2024-06-15', '2024-07-30', 'Ballroom Hotel Grand Indonesia', 60, 'Editing', 25000000.00, 12500000.00, 'Partial', '{"photographer": "Budi Cahaya", "videographer": "Sari Visual", "editor": "Dedi Editor"}'),

('01234567-89ab-cdef-0123-456789abcde4', 'Event Launching PT Maju Bersama', 'PT Maju Bersama', 'b1234567-89ab-cdef-0123-456789abcdef', 'Korporat', 'Paket Acara Korporat', '21234567-89ab-cdef-0123-456789abcdef', '2024-04-20', '2024-05-04', 'Jakarta Convention Center', 100, 'Selesai', 8000000.00, 8000000.00, 'Paid', '{"photographer": "Budi Cahaya", "videographer": "Sari Visual"}'),

('01234567-89ab-cdef-0123-456789abcde5', 'Lamaran Maya & Rudi', 'Maya & Rudi', 'c1234567-89ab-cdef-0123-456789abcdef', 'Lamaran', 'Paket Lamaran', '31234567-89ab-cdef-0123-456789abcdef', '2024-05-10', '2024-05-24', 'Taman Suropati', 30, 'Persiapan', 5000000.00, 2500000.00, 'Partial', '{"photographer": "Budi Cahaya"}'),

('01234567-89ab-cdef-0123-456789abcde6', 'Foto Keluarga Santoso', 'Keluarga Santoso', 'd1234567-89ab-cdef-0123-456789abcdef', 'Keluarga', 'Sesi Foto Keluarga', '51234567-89ab-cdef-0123-456789abcdef', '2024-03-25', '2024-04-04', 'Studio Vena Pictures', 80, 'Cetak', 3500000.00, 3500000.00, 'Paid', '{"photographer": "Budi Cahaya"}');

-- Sample Transactions (Fixed UUID format)
INSERT INTO transactions (id, date, description, amount, type, project_id, category, method, card_id) VALUES
('01234567-89ab-cdef-0123-456789abcde7', '2024-01-15', 'DP Pernikahan Sarah & Ahmad', 12500000.00, 'income', '01234567-89ab-cdef-0123-456789abcde3', 'DP Proyek', 'Transfer Bank', '01234567-89ab-cdef-0123-456789abcde0'),
('01234567-89ab-cdef-0123-456789abcde8', '2024-02-20', 'Pelunasan Event PT Maju Bersama', 8000000.00, 'income', '01234567-89ab-cdef-0123-456789abcde4', 'Pelunasan Proyek', 'Transfer Bank', '01234567-89ab-cdef-0123-456789abcde0'),
('01234567-89ab-cdef-0123-456789abcde9', '2024-01-20', 'Fee Fotografer - Budi Cahaya', 800000.00, 'expense', '01234567-89ab-cdef-0123-456789abcde3', 'Gaji Freelancer', 'Transfer Bank', '01234567-89ab-cdef-0123-456789abcde0'),
('01234567-89ab-cdef-0123-456789abcdfa', '2024-02-25', 'Transportasi Lokasi Shooting', 500000.00, 'expense', '01234567-89ab-cdef-0123-456789abcde3', 'Transportasi', 'Cash', NULL),
('01234567-89ab-cdef-0123-456789abcdfb', '2024-03-01', 'Sewa Lensa 85mm f/1.4', 1500000.00, 'expense', NULL, 'Peralatan', 'Debit Card', '01234567-89ab-cdef-0123-456789abcde1');

-- Sample Leads (Fixed UUID format)
INSERT INTO leads (id, name, contact_channel, location, status, date, notes, whatsapp) VALUES
('01234567-89ab-cdef-0123-456789abcdfc', 'Dinda & Fajar', 'Instagram', 'Bandung', 'Hot Lead', '2024-03-15', 'Tertarik paket prewedding, budget 6-7 juta', '081123456789'),
('01234567-89ab-cdef-0123-456789abcdfd', 'CV Sukses Mandiri', 'Referral', 'Surabaya', 'New', '2024-03-20', 'Butuh dokumentasi annual meeting', '081987654321'),
('01234567-89ab-cdef-0123-456789abcdfe', 'Keluarga Wijaya', 'WhatsApp', 'Jakarta', 'Follow Up', '2024-03-18', 'Ulang tahun ke-50, minta quotation foto keluarga', '081555777999'),
('01234567-89ab-cdef-0123-456789abcdff', 'Rini & Alex', 'Website', 'Depok', 'Qualified', '2024-03-22', 'Pernikahan Desember 2024, budget 20-25 juta', '081444666888');

-- Sample Assets (Fixed UUID format)
INSERT INTO assets (id, name, category, purchase_date, purchase_price, serial_number, status, notes) VALUES
('01234567-89ab-cdef-0123-456789abce00', 'Canon EOS R5', 'Kamera', '2023-01-15', 65000000.00, 'CN001234567890', 'Active', 'Kamera utama untuk wedding'),
('01234567-89ab-cdef-0123-456789abce01', 'Sony A7 IV', 'Kamera', '2023-03-20', 45000000.00, 'SN987654321012', 'Active', 'Kamera backup dan video'),
('01234567-89ab-cdef-0123-456789abce02', 'Canon RF 24-70mm f/2.8L', 'Lensa', '2023-01-15', 25000000.00, 'RF001122334455', 'Active', 'Lensa utama portrait'),
('01234567-89ab-cdef-0123-456789abce03', 'MacBook Pro M2 Max', 'Komputer', '2023-06-10', 45000000.00, 'MBP2023001234', 'Active', 'Untuk editing foto dan video'),
('01234567-89ab-cdef-0123-456789abce04', 'DJI Mini 3 Pro', 'Drone', '2023-08-05', 12000000.00, 'DJI001234567', 'Active', 'Untuk aerial shot'),
('01234567-89ab-cdef-0123-456789abce05', 'Godox AD200 Pro', 'Lighting', '2023-02-28', 4500000.00, 'GX200001234', 'Active', 'Flash portable untuk outdoor');

-- Sample Profile (Main Vendor Profile) (Fixed UUID format)
INSERT INTO profiles (
    id, 
    admin_user_id, 
    full_name, 
    email, 
    phone, 
    company_name, 
    website, 
    address, 
    bank_account, 
    authorized_signer, 
    id_number, 
    bio,
    income_categories,
    expense_categories,
    project_types,
    event_types,
    asset_categories,
    sop_categories,
    package_categories,
    project_status_config,
    notification_settings,
    security_settings,
    briefing_template,
    terms_and_conditions,
    brand_color,
    public_page_config,
    package_share_template,
    booking_form_template
) VALUES (
    '01234567-89ab-cdef-0123-456789abce06',
    '419473fd-d3d2-4e6b-b32c-ba400380eca0', -- Auth user ID untuk admin@vena.pictures
    'Andi Vena',
    'admin@vena.pictures',
    '081288889999',
    'Vena Pictures',
    'https://venapictures.com',
    'Jl. Kreatif No. 10, Jakarta Pusat',
    'BCA - 9876543210 a/n Vena Pictures',
    'Andi Vena',
    '3171234567890002',
    'Mengabadikan momen dengan sentuhan sinematik. Spesialis pernikahan dan prewedding di Vena Pictures.',
    '{"DP Proyek", "Pelunasan Proyek", "Penjualan Cetak", "Sewa Alat", "Modal", "Penjualan Add-on"}',
    '{"Gaji Freelancer", "Transportasi", "Akomodasi", "Konsumsi", "Peralatan", "Marketing", "Operasional Kantor", "Sewa Tempat", "Cetak Album", "Penarikan Hadiah Freelancer", "Transfer Internal", "Penutupan Anggaran", "Biaya Produksi Lain"}',
    '{"Pernikahan", "Lamaran", "Prewedding", "Korporat", "Ulang Tahun", "Produk", "Keluarga"}',
    '{"Meeting Klien", "Survey Lokasi", "Libur", "Workshop", "Acara Internal", "Lainnya"}',
    '{"Kamera", "Lensa", "Lighting", "Komputer", "Drone", "Aksesoris", "Lainnya"}',
    '{"Pernikahan", "Korporat", "Umum", "Editing", "Prewedding"}',
    '{"Pernikahan", "Lamaran", "Prewedding", "Korporat", "Ulang Tahun", "Produk", "Keluarga"}',
    '[
        {"id": "status_1", "name": "Persiapan", "color": "#6366f1", "subStatuses": [{"name": "Briefing Internal", "note": "Rapat tim internal untuk membahas konsep."}, {"name": "Survey Lokasi", "note": "Kunjungan ke lokasi acara jika diperlukan."}], "note": "Tahap awal persiapan proyek."},
        {"id": "status_2", "name": "Dikonfirmasi", "color": "#3b82f6", "subStatuses": [{"name": "Pembayaran DP", "note": "Menunggu konfirmasi pembayaran DP dari klien."}, {"name": "Penjadwalan Tim", "note": "Mengalokasikan freelancer untuk proyek."}], "note": "Proyek telah dikonfirmasi oleh klien."},
        {"id": "status_3", "name": "Editing", "color": "#8b5cf6", "subStatuses": [{"name": "Seleksi Foto", "note": "Proses pemilihan foto terbaik oleh tim atau klien."}, {"name": "Color Grading Video", "note": "Penyesuaian warna pada video."}, {"name": "Music Scoring", "note": "Pemilihan musik latar untuk video."}], "note": "Proses pasca-produksi."},
        {"id": "status_4", "name": "Revisi", "color": "#14b8a6", "subStatuses": [], "note": "Tahap revisi berdasarkan masukan klien."},
        {"id": "status_5", "name": "Cetak", "color": "#f97316", "subStatuses": [{"name": "Approval Desain Album", "note": "Menunggu persetujuan final desain album dari klien."}, {"name": "Proses Cetak", "note": "Album dan foto sedang dalam proses pencetakan."}, {"name": "QC Album", "note": "Pemeriksaan kualitas hasil cetakan."}], "note": "Proses pencetakan output fisik."},
        {"id": "status_6", "name": "Dikirim", "color": "#06b6d4", "subStatuses": [], "note": "Hasil akhir telah dikirim ke klien."},
        {"id": "status_7", "name": "Selesai", "color": "#10b981", "subStatuses": [], "note": "Proyek telah selesai dan semua pembayaran lunas."},
        {"id": "status_8", "name": "Dibatalkan", "color": "#ef4444", "subStatuses": [], "note": "Proyek dibatalkan oleh klien atau vendor."}
    ]',
    '{"newProject": true, "paymentConfirmation": true, "deadlineReminder": true}',
    '{"twoFactorEnabled": false}',
    'Halo {clientName}! 👋\n\nTerima kasih telah mempercayakan {projectType} Anda kepada Vena Pictures. Kami sangat antusias untuk mengabadikan momen berharga ini!\n\n📝 **Detail Proyek:**\n- Nama Acara: {projectName}\n- Tanggal: {date}\n- Lokasi: {location}\n- Paket: {packageName}\n- Tim: {team}\n\n📋 **Yang Perlu Dipersiapkan:**\n1. Rundown acara (jika ada)\n2. Daftar moment penting yang wajib diabadikan\n3. Preferensi style foto/video\n4. Kontak person di lokasi\n\n📞 **Kontak Darurat:**\nAndi Vena: 081288889999\n\nMohon konfirmasi jika ada perubahan atau pertanyaan. Mari kita ciptakan hasil yang luar biasa! ✨\n\nSalam hangat,\nVena Pictures Team',
    '📜 **Syarat & Ketentuan Umum**\n- Harga yang tertera dapat berubah sewaktu-waktu sebelum adanya kesepakatan.\n\n💰 **Pembayaran**\n- Pemesanan dianggap sah setelah pembayaran Uang Muka (DP) sebesar 50% dari total biaya.\n- Pelunasan wajib dilakukan paling lambat 3 (tiga) hari sebelum tanggal acara.\n\n⏱ **Pembatalan & Perubahan Jadwal**\n- Uang Muka (DP) yang telah dibayarkan tidak dapat dikembalikan (non-refundable) jika terjadi pembatalan dari pihak klien.\n- Perubahan jadwal dapat dilakukan maksimal 1 (satu) kali dengan konfirmasi selambat-lambatnya 14 hari sebelum tanggal acara, tergantung ketersediaan tim.\n\n📦 **Hasil Akhir**\n- Waktu pengerjaan hasil akhir (foto & video) adalah sesuai dengan yang tertera pada detail paket, dihitung setelah semua materi dan data dari klien kami terima.\n- Hak cipta hasil foto dan video tetap menjadi milik Vendor. Klien mendapatkan hak guna pribadi dan non-komersial.\n- Vendor berhak menggunakan hasil foto dan video untuk keperluan portofolio dan promosi dengan seizin klien.',
    '#3b82f6',
    '{"template": "classic", "title": "Galeri & Paket Layanan Kami", "introduction": "Jelajahi portofolio kami dan temukan paket yang sempurna untuk acara Anda.", "galleryImages": []}',
    '🎉 **{packageName}** - Rp {price:,}\n\n✨ **Paket Lengkap Untuk {category}**\n\n📸 **Yang Anda Dapatkan:**\n{digitalItems}\n\n📦 **Bonus Cetak:**\n{physicalItems}\n\n⏰ **Estimasi Pengerjaan:** {processingTime}\n👥 **Tim:** {photographers}{videographers}\n\n💬 *"Mengabadikan momen berharga dengan sentuhan profesional dan hasil berkualitas tinggi"*\n\n📞 **Tertarik? Hubungi Kami:**\nWhatsApp: 081288889999\nEmail: admin@vena.pictures\n\n#VenaPictures #Photographer #Videographer #{category}',
    '📝 **Form Booking - Vena Pictures**\n\nTerima kasih atas kepercayaan Anda! Mohon lengkapi informasi berikut untuk proses booking:\n\n👤 **Informasi Klien:**\n- Nama Lengkap:\n- Email:\n- No. WhatsApp:\n- Instagram (opsional):\n\n🎊 **Detail Acara:**\n- Jenis Acara:\n- Tanggal Acara:\n- Waktu Mulai:\n- Lokasi:\n- Estimasi Durasi:\n\n📋 **Kebutuhan Khusus:**\n- Paket yang Diminati:\n- Moment Penting yang Wajib Diabadikan:\n- Preferensi Style (Natural/Candid/Formal):\n- Permintaan Tambahan:\n\n💰 **Budget Range:** Rp _____ - Rp _____\n\n📞 Setelah submit, tim kami akan menghubungi Anda dalam 24 jam untuk konfirmasi dan diskusi detail lebih lanjut.\n\n✨ *Mari wujudkan dokumentasi acara impian Anda bersama Vena Pictures!*'
);