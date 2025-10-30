import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'login_page.dart';
import 'transaction_detail_page.dart';
import 'edit_profile_page.dart';
import 'change_password_page.dart';
import 'theme_settings_page.dart';
import 'terms_conditions_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Pulsa 5.000',
      'price': 'Rp 5.500',
      'icon': Icons.phone_android,
      'color': Colors.blue,
    },
    {
      'name': 'Pulsa 10.000',
      'price': 'Rp 10.500',
      'icon': Icons.phone_android,
      'color': Colors.green,
    },
    {
      'name': 'Pulsa 20.000',
      'price': 'Rp 20.500',
      'icon': Icons.phone_android,
      'color': Colors.orange,
    },
    {
      'name': 'Pulsa 50.000',
      'price': 'Rp 50.500',
      'icon': Icons.phone_android,
      'color': Colors.purple,
    },
    {
      'name': 'Paket Data 1GB',
      'price': 'Rp 15.000',
      'icon': Icons.wifi,
      'color': Colors.teal,
    },
    {
      'name': 'Paket Data 2GB',
      'price': 'Rp 25.000',
      'icon': Icons.wifi,
      'color': Colors.indigo,
    },
  ];

  final List<Map<String, dynamic>> _transactions = [
    {
      'id': 'TRX2025103001',
      'type': 'TopUp',
      'name': 'Top Up Saldo',
      'price': 'Rp 500.000',
      'basePrice': 'Rp 500.000',
      'date': '30 Okt 2025',
      'time': '14:30 WIB',
      'status': 'Berhasil',
      'notes': 'Top up saldo berhasil ditambahkan ke akun Anda',
    },
    {
      'id': 'TRX2025103002',
      'type': 'Pulsa',
      'name': 'Pulsa 50.000',
      'phone': '081234567890',
      'price': 'Rp 51.000',
      'basePrice': 'Rp 50.500',
      'adminFee': 'Rp 500',
      'date': '30 Okt 2025',
      'time': '13:15 WIB',
      'status': 'Berhasil',
      'notes': 'Pulsa telah terkirim ke nomor tujuan',
    },
    {
      'id': 'TRX2025103003',
      'type': 'Paket Data',
      'name': 'Paket Data 2GB',
      'phone': '081234567890',
      'price': 'Rp 25.500',
      'basePrice': 'Rp 25.000',
      'adminFee': 'Rp 500',
      'date': '30 Okt 2025',
      'time': '11:45 WIB',
      'status': 'Berhasil',
      'notes': 'Paket data aktif selama 30 hari',
    },
    {
      'id': 'TRX2025103004',
      'type': 'Pulsa',
      'name': 'Pulsa 20.000',
      'phone': '081234567891',
      'price': 'Rp 21.000',
      'basePrice': 'Rp 20.500',
      'adminFee': 'Rp 500',
      'date': '29 Okt 2025',
      'time': '16:20 WIB',
      'status': 'Gagal',
      'notes': 'Transaksi gagal: Nomor tujuan tidak aktif',
    },
    {
      'id': 'TRX2025103005',
      'type': 'Listrik',
      'name': 'Token Listrik 100.000',
      'phone': '12345678901',
      'price': 'Rp 101.000',
      'basePrice': 'Rp 100.000',
      'adminFee': 'Rp 1.000',
      'date': '29 Okt 2025',
      'time': '09:30 WIB',
      'status': 'Berhasil',
      'notes': 'Token: 1234-5678-9012-3456-7890',
    },
    {
      'id': 'TRX2025103006',
      'type': 'Pulsa',
      'name': 'Pulsa 10.000',
      'phone': '081234567892',
      'price': 'Rp 11.000',
      'basePrice': 'Rp 10.500',
      'adminFee': 'Rp 500',
      'date': '28 Okt 2025',
      'time': '18:10 WIB',
      'status': 'Refund',
      'notes': 'Transaksi dibatalkan, dana dikembalikan ke saldo',
    },
    {
      'id': 'TRX2025103007',
      'type': 'Game',
      'name': 'Mobile Legends 100 Diamond',
      'phone': '123456789',
      'price': 'Rp 30.000',
      'basePrice': 'Rp 29.500',
      'adminFee': 'Rp 500',
      'date': '28 Okt 2025',
      'time': '15:45 WIB',
      'status': 'Berhasil',
      'notes': 'Diamond telah masuk ke akun game',
    },
    {
      'id': 'TRX2025103008',
      'type': 'TopUp',
      'name': 'Top Up Saldo',
      'price': 'Rp 200.000',
      'basePrice': 'Rp 200.000',
      'date': '27 Okt 2025',
      'time': '10:20 WIB',
      'status': 'Berhasil',
      'notes': 'Top up saldo berhasil ditambahkan ke akun Anda',
    },
    {
      'id': 'TRX2025103009',
      'type': 'Paket Data',
      'name': 'Paket Data 1GB',
      'phone': '081234567890',
      'price': 'Rp 15.500',
      'basePrice': 'Rp 15.000',
      'adminFee': 'Rp 500',
      'date': '27 Okt 2025',
      'time': '08:15 WIB',
      'status': 'Gagal',
      'notes': 'Transaksi gagal: Server operator sedang gangguan',
    },
    {
      'id': 'TRX2025103010',
      'type': 'Pulsa',
      'name': 'Pulsa 5.000',
      'phone': '081234567890',
      'price': 'Rp 6.000',
      'basePrice': 'Rp 5.500',
      'adminFee': 'Rp 500',
      'date': '26 Okt 2025',
      'time': '20:30 WIB',
      'status': 'Berhasil',
      'notes': 'Pulsa telah terkirim ke nomor tujuan',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleLogout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with greeting and balance
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade700, Colors.blue.shade500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Selamat Datang,',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Pedagang Pulsa',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.blue.shade700,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Saldo Anda',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Rp 1.500.000',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Fitur top up akan segera hadir'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.blue.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Top Up'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Quick actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Layanan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildQuickAction(
                      icon: Icons.phone_android,
                      label: 'Pulsa',
                      color: Colors.blue,
                    ),
                    _buildQuickAction(
                      icon: Icons.wifi,
                      label: 'Paket Data',
                      color: Colors.green,
                    ),
                    _buildQuickAction(
                      icon: Icons.bolt,
                      label: 'Listrik',
                      color: Colors.orange,
                    ),
                    _buildQuickAction(
                      icon: Icons.games,
                      label: 'Game',
                      color: Colors.purple,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Product list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Produk Populer',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return _buildProductCard(
                      name: product['name'],
                      price: product['price'],
                      icon: product['icon'],
                      color: product['color'],
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Fitur $label akan segera hadir')),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              color: color,
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required String name,
    required String price,
    required IconData icon,
    required Color color,
  }) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Membeli $name')),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: 32,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(24),
      itemCount: _transactions.length,
      itemBuilder: (context, index) {
        final transaction = _transactions[index];
        final status = transaction['status'] as String;

        Color statusColor;
        IconData statusIcon;

        switch (status.toLowerCase()) {
          case 'berhasil':
            statusColor = Colors.green;
            statusIcon = Icons.check_circle;
            break;
          case 'gagal':
            statusColor = Colors.red;
            statusIcon = Icons.cancel;
            break;
          case 'refund':
            statusColor = Colors.orange;
            statusIcon = Icons.replay_circle_filled;
            break;
          case 'pending':
            statusColor = Colors.blue;
            statusIcon = Icons.access_time;
            break;
          default:
            statusColor = Colors.grey;
            statusIcon = Icons.info;
        }

        IconData typeIcon;
        Color typeColor;

        switch (transaction['type'].toString().toLowerCase()) {
          case 'topup':
            typeIcon = Icons.account_balance_wallet;
            typeColor = Colors.blue;
            break;
          case 'pulsa':
            typeIcon = Icons.phone_android;
            typeColor = Colors.green;
            break;
          case 'paket data':
            typeIcon = Icons.wifi;
            typeColor = Colors.purple;
            break;
          case 'listrik':
            typeIcon = Icons.bolt;
            typeColor = Colors.orange;
            break;
          case 'game':
            typeIcon = Icons.games;
            typeColor = Colors.pink;
            break;
          default:
            typeIcon = Icons.receipt;
            typeColor = Colors.grey;
        }

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionDetailPage(
                    transaction: transaction,
                  ),
                ),
              );
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: typeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      typeIcon,
                      color: typeColor,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction['name'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${transaction['date']} • ${transaction['time']}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              statusIcon,
                              size: 14,
                              color: statusColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              status,
                              style: TextStyle(
                                fontSize: 12,
                                color: statusColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        transaction['price'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          transaction['id'],
                          style: TextStyle(
                            fontSize: 10,
                            color: statusColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProfileTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        // Profile header
        Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue.shade100,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.blue.shade700,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Pedagang Pulsa',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'pedagang@example.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),

        // Profile menu items
        _buildProfileMenuItem(
          icon: Icons.person_outline,
          title: 'Edit Profil',
          subtitle: 'Lengkapi informasi pribadi Anda',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditProfilePage()),
            );
          },
        ),
        _buildProfileMenuItem(
          icon: Icons.lock_outline,
          title: 'Ubah Password',
          subtitle: 'Keamanan akun Anda',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
            );
          },
        ),
        _buildProfileMenuItem(
          icon: Icons.palette_outline,
          title: 'Tema Aplikasi',
          subtitle: 'Sesuaikan tampilan aplikasi',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ThemeSettingsPage()),
            );
          },
        ),
        _buildProfileMenuItem(
          icon: Icons.history,
          title: 'Riwayat Transaksi',
          subtitle: 'Lihat semua transaksi Anda',
          onTap: () {
            setState(() {
              _selectedIndex = 1;
            });
          },
        ),
        _buildProfileMenuItem(
          icon: Icons.description_outlined,
          title: 'Syarat & Ketentuan',
          subtitle: 'Kebijakan penggunaan aplikasi',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TermsConditionsPage()),
            );
          },
        ),
        _buildProfileMenuItem(
          icon: Icons.help_outline,
          title: 'Bantuan',
          subtitle: 'Pusat bantuan dan FAQ',
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Fitur bantuan akan segera hadir')),
            );
          },
        ),
        _buildProfileMenuItem(
          icon: Icons.info_outline,
          title: 'Tentang Aplikasi',
          subtitle: 'Versi dan informasi aplikasi',
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Tentang Aplikasi'),
                content: const Text('Pedagang Pulsa v1.0.0\n\nAplikasi untuk pedagang pulsa dan paket data.\n\n© 2025 Pedagang Pulsa'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        _buildProfileMenuItem(
          icon: Icons.logout,
          title: 'Keluar',
          onTap: _handleLogout,
          color: Colors.red,
        ),
      ],
    );
  }

  Widget _buildProfileMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    Color? color,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: color ?? Colors.grey.shade700),
        title: Text(
          title,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              )
            : null,
        trailing: Icon(Icons.chevron_right, color: color ?? Colors.grey.shade400),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      _buildHomeTab(),
      _buildTransactionTab(),
      _buildProfileTab(),
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey.shade400,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
