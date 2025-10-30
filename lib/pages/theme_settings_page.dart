import 'package:flutter/material.dart';

class ThemeSettingsPage extends StatefulWidget {
  const ThemeSettingsPage({super.key});

  @override
  State<ThemeSettingsPage> createState() => _ThemeSettingsPageState();
}

class _ThemeSettingsPageState extends State<ThemeSettingsPage> {
  String _selectedTheme = 'Terang'; // Options: 'Terang', 'Gelap', 'Sistem'
  String _selectedAccentColor = 'Biru'; // Options: 'Biru', 'Hijau', 'Ungu', 'Merah', 'Oranye'
  bool _isCompactMode = false;

  final Map<String, Color> _accentColors = {
    'Biru': Colors.blue,
    'Hijau': Colors.green,
    'Ungu': Colors.purple,
    'Merah': Colors.red,
    'Oranye': Colors.orange,
    'Pink': Colors.pink,
    'Teal': Colors.teal,
    'Indigo': Colors.indigo,
  };

  void _saveThemeSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Pengaturan tema disimpan'),
        backgroundColor: Colors.green,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Tema Aplikasi'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _saveThemeSettings,
            child: const Text('Simpan'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // Theme Mode Section
          Text(
            'Mode Tampilan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 12),
          _buildThemeModeOption(
            'Terang',
            'Tampilan terang untuk penggunaan di siang hari',
            Icons.light_mode,
          ),
          _buildThemeModeOption(
            'Gelap',
            'Tampilan gelap untuk mengurangi kelelahan mata',
            Icons.dark_mode,
          ),
          _buildThemeModeOption(
            'Sistem',
            'Ikuti pengaturan sistem perangkat',
            Icons.settings_brightness,
          ),
          const SizedBox(height: 32),

          // Accent Color Section
          Text(
            'Warna Aksen',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pilih warna tema aplikasi',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _accentColors.entries.map((entry) {
                    final isSelected = _selectedAccentColor == entry.key;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedAccentColor = entry.key;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: entry.value,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? Colors.black : Colors.transparent,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: entry.value.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: isSelected
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                : null,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            entry.key,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Display Options Section
          Text(
            'Opsi Tampilan',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SwitchListTile(
              title: const Text('Mode Kompak'),
              subtitle: const Text('Tampilan lebih padat dengan jarak yang lebih kecil'),
              value: _isCompactMode,
              onChanged: (value) {
                setState(() {
                  _isCompactMode = value;
                });
              },
            ),
          ),
          const SizedBox(height: 32),

          // Preview Section
          Text(
            'Pratinjau',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                // Sample App Bar
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _accentColors[_selectedAccentColor],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.menu, color: Colors.white),
                      SizedBox(width: 16),
                      Text(
                        'Pedagang Pulsa',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Sample Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _accentColors[_selectedAccentColor],
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Contoh Tombol'),
                ),
                const SizedBox(height: 8),
                // Sample Card
                Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _accentColors[_selectedAccentColor]!.withOpacity(0.2),
                      child: Icon(
                        Icons.phone_android,
                        color: _accentColors[_selectedAccentColor],
                      ),
                    ),
                    title: const Text('Contoh Item'),
                    subtitle: const Text('Ini adalah pratinjau tampilan'),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: _accentColors[_selectedAccentColor],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Note
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Perubahan tema akan diterapkan setelah Anda menyimpan pengaturan',
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
      ),
    );
  }

  Widget _buildThemeModeOption(String title, String subtitle, IconData icon) {
    final isSelected = _selectedTheme == title;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: RadioListTile<String>(
        value: title,
        groupValue: _selectedTheme,
        onChanged: (value) {
          setState(() {
            _selectedTheme = value!;
          });
        },
        title: Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
