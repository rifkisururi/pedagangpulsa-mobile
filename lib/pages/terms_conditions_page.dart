import 'package:flutter/material.dart';

class TermsConditionsPage extends StatefulWidget {
  const TermsConditionsPage({super.key});

  @override
  State<TermsConditionsPage> createState() => _TermsConditionsPageState();
}

class _TermsConditionsPageState extends State<TermsConditionsPage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Syarat & Ketentuan'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Tab Bar
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: _buildTab('Syarat & Ketentuan', 0),
                ),
                Expanded(
                  child: _buildTab('Kebijakan Privasi', 1),
                ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: _selectedTab == 0 ? _buildTermsContent() : _buildPrivacyContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = _selectedTab == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.blue : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.blue : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  Widget _buildTermsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('1. Ketentuan Umum'),
        _buildSectionContent(
          'Dengan menggunakan aplikasi Pedagang Pulsa, Anda menyetujui untuk terikat dengan syarat dan ketentuan yang berlaku. '
          'Aplikasi ini disediakan untuk membantu pedagang pulsa dalam mengelola transaksi dengan mudah dan efisien.',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('2. Penggunaan Layanan'),
        _buildSectionContent(
          'Pengguna bertanggung jawab untuk:\n'
          '• Menjaga kerahasiaan informasi akun\n'
          '• Menggunakan layanan sesuai dengan hukum yang berlaku\n'
          '• Tidak menyalahgunakan sistem atau melakukan tindakan yang merugikan\n'
          '• Memastikan saldo mencukupi sebelum melakukan transaksi',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('3. Transaksi'),
        _buildSectionContent(
          'Setiap transaksi yang dilakukan melalui aplikasi ini bersifat final. '
          'Pengguna wajib memverifikasi detail transaksi sebelum melakukan konfirmasi. '
          'Kami tidak bertanggung jawab atas kesalahan input yang dilakukan oleh pengguna.',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('4. Pembatalan dan Pengembalian Dana'),
        _buildSectionContent(
          'Pembatalan transaksi hanya dapat dilakukan dalam kondisi tertentu:\n'
          '• Transaksi gagal karena kesalahan sistem\n'
          '• Nomor tujuan tidak valid atau tidak aktif\n'
          '• Kesalahan teknis yang dapat dibuktikan\n\n'
          'Pengembalian dana (refund) akan diproses maksimal 3x24 jam kerja setelah verifikasi.',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('5. Keamanan'),
        _buildSectionContent(
          'Kami berkomitmen untuk menjaga keamanan data pengguna. Namun, pengguna juga bertanggung jawab untuk:\n'
          '• Menggunakan password yang kuat\n'
          '• Tidak membagikan informasi login kepada pihak lain\n'
          '• Melaporkan aktivitas mencurigakan segera\n'
          '• Logout setelah selesai menggunakan aplikasi',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('6. Biaya Layanan'),
        _buildSectionContent(
          'Setiap transaksi dikenakan biaya administrasi yang telah ditampilkan di aplikasi. '
          'Biaya ini dapat berubah sewaktu-waktu tanpa pemberitahuan terlebih dahulu.',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('7. Pembaruan Ketentuan'),
        _buildSectionContent(
          'Kami berhak untuk memperbarui syarat dan ketentuan ini kapan saja. '
          'Pengguna akan diberitahu tentang perubahan penting melalui aplikasi atau email.',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('8. Kontak'),
        _buildSectionContent(
          'Jika Anda memiliki pertanyaan tentang syarat dan ketentuan ini, silakan hubungi kami melalui:\n\n'
          'Email: support@pedagangpulsa.com\n'
          'WhatsApp: +62 812-3456-7890\n'
          'Jam Operasional: Senin - Jumat, 09:00 - 17:00 WIB',
        ),
        const SizedBox(height: 32),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue.shade700),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Terakhir diperbarui: 30 Oktober 2025',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPrivacyContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('1. Informasi yang Kami Kumpulkan'),
        _buildSectionContent(
          'Kami mengumpulkan informasi yang Anda berikan saat:\n'
          '• Mendaftar akun (nama, email, nomor telepon)\n'
          '• Melakukan transaksi (nomor tujuan, nominal, waktu)\n'
          '• Menggunakan aplikasi (log aktivitas, preferensi)\n'
          '• Menghubungi layanan pelanggan',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('2. Penggunaan Informasi'),
        _buildSectionContent(
          'Informasi yang dikumpulkan digunakan untuk:\n'
          '• Memproses transaksi Anda\n'
          '• Meningkatkan layanan dan pengalaman pengguna\n'
          '• Mengirimkan notifikasi transaksi\n'
          '• Mencegah penipuan dan penyalahgunaan\n'
          '• Mematuhi kewajiban hukum',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('3. Keamanan Data'),
        _buildSectionContent(
          'Kami menggunakan teknologi enkripsi dan protokol keamanan standar industri untuk melindungi data Anda. '
          'Data sensitif seperti password disimpan dalam bentuk terenkripsi.',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('4. Berbagi Informasi'),
        _buildSectionContent(
          'Kami tidak akan menjual atau menyewakan informasi pribadi Anda kepada pihak ketiga. '
          'Informasi hanya dibagikan kepada:\n'
          '• Provider layanan untuk memproses transaksi\n'
          '• Pihak berwenang jika diwajibkan oleh hukum\n'
          '• Partner bisnis dengan persetujuan Anda',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('5. Cookies dan Teknologi Pelacakan'),
        _buildSectionContent(
          'Aplikasi ini menggunakan cookies dan teknologi serupa untuk:\n'
          '• Menyimpan preferensi Anda\n'
          '• Menganalisis penggunaan aplikasi\n'
          '• Meningkatkan performa aplikasi\n\n'
          'Anda dapat mengelola pengaturan cookies melalui pengaturan perangkat Anda.',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('6. Hak Pengguna'),
        _buildSectionContent(
          'Anda memiliki hak untuk:\n'
          '• Mengakses data pribadi Anda\n'
          '• Memperbarui atau mengoreksi informasi\n'
          '• Menghapus akun dan data Anda\n'
          '• Menarik persetujuan penggunaan data\n'
          '• Mengajukan keluhan terkait privasi',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('7. Penyimpanan Data'),
        _buildSectionContent(
          'Data pribadi Anda akan disimpan selama akun Anda aktif atau sepanjang diperlukan untuk menyediakan layanan. '
          'Setelah akun dihapus, data akan dihapus dalam waktu 90 hari kecuali diwajibkan oleh hukum untuk disimpan lebih lama.',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('8. Perubahan Kebijakan'),
        _buildSectionContent(
          'Kebijakan privasi ini dapat diperbarui dari waktu ke waktu. '
          'Kami akan memberitahu Anda tentang perubahan signifikan melalui aplikasi atau email.',
        ),
        const SizedBox(height: 24),

        _buildSectionTitle('9. Hubungi Kami'),
        _buildSectionContent(
          'Jika Anda memiliki pertanyaan tentang kebijakan privasi ini, hubungi:\n\n'
          'Email: privacy@pedagangpulsa.com\n'
          'WhatsApp: +62 812-3456-7890\n'
          'Alamat: Jl. Contoh No. 123, Jakarta',
        ),
        const SizedBox(height: 32),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.verified_user, color: Colors.green.shade700),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Kami berkomitmen untuk melindungi privasi dan keamanan data Anda',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade800,
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        content,
        style: TextStyle(
          fontSize: 14,
          height: 1.6,
          color: Colors.grey.shade700,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
