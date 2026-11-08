# Absensi Siswa — Laravel + Filament

Sistem **CRUD Absensi Siswa** untuk mengelola data kelas, siswa, jadwal/jam pelajaran, dan kehadiran harian. Menggunakan **dua panel Filament terpisah** (Admin & Guru) — tidak disatukan, **tanpa JavaScript/API custom** (server-rendered via Filament/Livewire bawaan). Proyek **tidak menyertakan data dummy** di source; database lokal dapat berisi data contoh yang bisa diganti data real.

| Komponen | Versi / Keterangan |
|---|---|
| Framework | Laravel 11 |
| Admin Panel | Filament v3 (panel `admin`, `/admin`) |
| Panel Guru | Filament v3 (panel `guru`, `/guru`, terpisah) |
| Database | MySQL / MariaDB (`absensi_siswa`) |
| PHP | 8.2+ |

## Panel (Terpisah)

| Panel | URL | Akses | Fungsi |
|---|---|---|---|
| Admin | `http://localhost:8000/admin` | role `admin` | Kelola master (jurusan, kelas, siswa), jam/jadwal pelajaran, absensi penuh |
| Guru | `http://localhost:8000/guru` | role `guru` (admin juga bisa) | **Backend guru terpisah**: lihat siswa & jadwal, **catat/edit absensi** (tanpa kelola master) |

Implementasi: `app/Providers/Filament/AdminPanelProvider.php`, `app/Providers/Filament/GuruPanelProvider.php`; resource guru di `app/Filament/Guru/Resources/*` (namespace terpisah, tidak memakai resource admin). Akses panel dibatasi lewat `users.role` + `FilamentUser::canAccessPanel` di `app/Models/User.php`.

## Fitur Utama (Admin)

### 1. Data Master — Jurusan (SMK/umum)
- Kelola jurusan: kode jurusan (opsional, unik), nama jurusan, keterangan.
- Tabel menampilkan jumlah kelas per jurusan.
- Contoh SMK: RPL, TKJ, AKL, DKV, dsb. (input manual, tanpa data dummy).
- Aksi: lihat, tambah, ubah, hapus.

### 2. Data Master — Kelas
- Kelola kelas: nama kelas (unik), **jurusan** (opsional), tingkat, wali kelas.
- Tabel menampilkan jurusan dan jumlah siswa per kelas.
- Filter: jurusan.
- Aksi: lihat, tambah, ubah, hapus.

### 3. Data Master — Siswa
- Kelola siswa: **NIS (unik)**, nama, jenis kelamin (L/P), kelas, no. telepon, alamat.
- Relasi ke kelas (dapat dikosongkan).
- Filter: kelas, jenis kelamin. Pencarian: NIS, nama.

### 4. Akademik — Jam Pelajaran
- Kelola slot jam pelajaran: jam ke- (unik), nama/keterangan, waktu mulai–selesai, penanda **istirahat**.
- Urut default: jam ke-. Filter: istirahat/jam pelajaran.
- Aksi: lihat, tambah, ubah, hapus.

### 5. Akademik — Jadwal Pelajaran
- Kelola jadwal per kelas: kelas, hari (Senin–Minggu), jam pelajaran, mata pelajaran, guru, ruang, catatan.
- **Unik per kombinasi**: kelas + hari + jam pelajaran (mencegah bentrok slot).
- Filter: kelas, hari. Menampilkan rentang waktu dari jam pelajaran.
- Aksi: lihat, tambah, ubah, hapus.

### 6. Absensi
- Catat kehadiran per siswa per tanggal (**unik: 1 siswa = 1 record per tanggal**).
- Status: `Hadir`, `Izin`, `Sakit`, `Alfa` (badge warna).
- Field: tanggal, jam masuk, catatan.
- Filter: status, siswa, rentang tanggal. Urut default: tanggal terbaru.

## Fitur Panel Guru (Terpisah)
- **Absensi**: catat & edit absensi (tanpa hapus massal).
- **Siswa**: lihat daftar (read-only).
- **Jadwal Pelajaran**: lihat jadwal (read-only).
- Tidak ada JS/API custom; seluruh interaksi lewat komponen Filament/Livewire server-side bawaan.

## Struktur Data

| Tabel | Kolom penting |
|---|---|
| `users` | `name`, `email`, `role` (`admin`/`guru`), `password` |
| `majors` | `code` (nullable, unique), `name`, `description` |
| `school_classes` | `name` (unique), `major_id` (FK -> majors, null on delete), `grade_level`, `homeroom_teacher` |
| `students` | `nis` (unique), `name`, `gender` (L/P), `school_class_id` (FK, null on delete), `phone`, `address` |
| `lesson_hours` | `session_number` (unique), `name`, `start_time`, `end_time`, `is_break` |
| `lesson_schedules` | `school_class_id` (FK), `day_of_week`, `lesson_hour_id` (FK), `subject_name`, `teacher_name`, `room`, `note`, **unique(`school_class_id`,`day_of_week`,`lesson_hour_id`)** |
| `attendances` | `student_id` (FK, cascade delete), `date`, `status` (hadir/izin/sakit/alfa), `check_in_time`, `note`, **unique(`student_id`,`date`)** |

## Persiapan Lingkungan

- PHP **8.2+** dengan ekstensi umum Laravel + `pdo_mysql`.
- **Ekstensi `intl`** direkomendasikan untuk Filament (aktifkan `extension=intl` di `php.ini`).
- Composer **2.x**.
- MySQL/MariaDB berjalan (contoh: XAMPP).

## Instalasi (Windows / XAMPP)

```powershell
cd "C:\Users\ACER NITRO\Documents\crud-filament"
composer install
```

Jika `.env` belum ada:

```powershell
copy .env.example .env
php artisan key:generate
```

Konfigurasi `.env`:

```env
APP_NAME="Absensi Siswa"
APP_LOCALE=id
APP_TIMEZONE=Asia/Jakarta

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=absensi_siswa
DB_USERNAME=root
DB_PASSWORD=
DB_COLLATION=utf8mb4_unicode_ci
```

> `DB_COLLATION=utf8mb4_unicode_ci` dipakai agar kompatibel dengan MySQL/MariaDB XAMPP (beberapa instalasi tidak mendukung `utf8mb4_0900_ai_ci`).

Buat database dan migrasi:

```powershell
C:\xampp\mysql\bin\mysql.exe -u root -e "CREATE DATABASE IF NOT EXISTS absensi_siswa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
php artisan migrate
```

Buat user panel Filament:

```powershell
php artisan make:filament-user
```

> Pastikan kolom `users.role` terisi (`admin` atau `guru`) agar akses panel sesuai.

## Menjalankan Aplikasi

```powershell
php artisan serve
```

- Panel Admin: **http://localhost:8000/admin/login**
- Panel Guru: **http://localhost:8000/guru/login** (terpisah)

## Kredensial (Lokal)

| Panel | Email | Password | Role |
|---|---|---|---|
| Admin | `admin@example.com` | `password` | `admin` |
| Guru | `guru@example.com` | `password` | `guru` |

**Penting:** ganti password setelah login. Jangan gunakan kredensial default di server/produksi.

## Struktur Kode Relevan

```text
app/
  Models/
    User.php                    # role + FilamentUser::canAccessPanel
    Major.php, SchoolClass.php, Student.php
    LessonHour.php, LessonSchedule.php, Attendance.php
  Filament/
    Resources/                  # panel Admin (penuh)
    Guru/
      Resources/                # panel Guru terpisah (absensi, siswa, jadwal read-only)
  Providers/Filament/
    AdminPanelProvider.php      # /admin
    GuruPanelProvider.php       # /guru
database/migrations/
  *_add_role_to_users_table.php
  *_create_majors_table.php
  *_create_school_classes_table.php
  *_add_major_id_to_school_classes_table.php
  *_create_students_table.php
  *_create_lesson_hours_table.php
  *_create_lesson_schedules_table.php
  *_create_attendances_table.php
config/database.php             # default collation MySQL kompatibel
```

## Catatan Teknis

- **Tanpa JS/API custom**: panel memakai interaksi server-side Filament/Livewire bawaan (tidak ada endpoint/API frontend buatan sendiri).
- **Pemisahan panel**: resource guru berada di namespace `App\Filament\Guru\*` dan tidak disatukan dengan resource admin.

## Perintah Berguna

```powershell
php artisan migrate:status    # cek status migrasi
php artisan route:list --path=admin
php artisan route:list --path=guru
php artisan optimize:clear    # bersihkan cache
composer audit                # tinjau advisori keamanan dependensi
php artisan test              # jalankan test
```

## Catatan Keamanan & Dependensi

- Composer 2.10+ dapat memblokir instalasi paket yang memiliki *security advisory*. Selalu tinjau dengan `composer audit` dan perbarui ke rilis aman yang tersedia.
- Kredensial default hanya untuk pengembangan lokal.
- `.env` berisi konfigurasi sensitif — jangan commit ke repository publik.

## Lisensi

Digunakan untuk kebutuhan pengembangan/internal. Laravel berlisensi [MIT](https://opensource.org/licenses/MIT).
