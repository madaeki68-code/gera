-- Update Admin User ID dengan UUID yang benar
-- Jalankan script ini setelah import schema.sql dan seed_data.sql

UPDATE profiles 
SET admin_user_id = '419473fd-d3d2-4e6b-b32c-ba400380eca0'
WHERE email = 'admin@vena.pictures';

-- Verifikasi update berhasil
SELECT id, full_name, email, admin_user_id 
FROM profiles 
WHERE email = 'admin@vena.pictures';