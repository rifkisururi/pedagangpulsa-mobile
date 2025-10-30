import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class TransactionDetailPage extends StatefulWidget {
  final Map<String, dynamic> transaction;

  const TransactionDetailPage({super.key, required this.transaction});

  @override
  State<TransactionDetailPage> createState() => _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<TransactionDetailPage> {
  final ScreenshotController _screenshotController = ScreenshotController();
  bool _isLoading = false;

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'berhasil':
        return Colors.green;
      case 'gagal':
        return Colors.red;
      case 'refund':
        return Colors.orange;
      case 'pending':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'berhasil':
        return Icons.check_circle;
      case 'gagal':
        return Icons.cancel;
      case 'refund':
        return Icons.replay_circle_filled;
      case 'pending':
        return Icons.access_time;
      default:
        return Icons.info;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'topup':
        return Icons.account_balance_wallet;
      case 'pulsa':
        return Icons.phone_android;
      case 'paket data':
        return Icons.wifi;
      case 'listrik':
        return Icons.bolt;
      case 'game':
        return Icons.games;
      default:
        return Icons.receipt;
    }
  }

  Future<void> _captureAndShareToWhatsApp() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final image = await _screenshotController.capture();
      if (image == null) {
        throw Exception('Failed to capture screenshot');
      }

      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/transaction_${widget.transaction['id']}.png';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(image);

      final message = '''
*BUKTI TRANSAKSI*
${widget.transaction['type']} - ${widget.transaction['name']}

Nomor Tujuan: ${widget.transaction['phone'] ?? '-'}
Total: ${widget.transaction['price']}
Status: ${widget.transaction['status']}
ID Transaksi: ${widget.transaction['id']}
Tanggal: ${widget.transaction['date']}
''';

      final whatsappUrl = Uri.parse(
        'whatsapp://send?text=${Uri.encodeComponent(message)}',
      );

      if (await canLaunchUrl(whatsappUrl)) {
        await launchUrl(whatsappUrl);
        // After WhatsApp opens, share the image
        await Share.shareXFiles(
          [XFile(imagePath)],
          text: message,
        );
      } else {
        // Fallback to regular share if WhatsApp is not installed
        await Share.shareXFiles(
          [XFile(imagePath)],
          text: message,
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal membagikan: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _printReceipt() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final image = await _screenshotController.capture();
      if (image == null) {
        throw Exception('Failed to capture screenshot');
      }

      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/transaction_${widget.transaction['id']}.png';
      final imageFile = File(imagePath);
      await imageFile.writeAsBytes(image);

      await Share.shareXFiles(
        [XFile(imagePath)],
        subject: 'Bukti Transaksi ${widget.transaction['id']}',
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bukti transaksi siap untuk dicetak atau disimpan'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Gagal: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Detail Transaksi'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: _isLoading ? null : _printReceipt,
            tooltip: 'Print / Simpan',
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _isLoading ? null : _captureAndShareToWhatsApp,
            tooltip: 'Kirim ke WhatsApp',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Screenshot(
              controller: _screenshotController,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    // Status Banner
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: _getStatusColor(widget.transaction['status']),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            _getStatusIcon(widget.transaction['status']),
                            size: 64,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Transaksi ${widget.transaction['status']}',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.transaction['price'],
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Transaction Details
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  'PEDAGANG PULSA',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade700,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Struk Transaksi',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  height: 2,
                                  width: 100,
                                  color: Colors.grey.shade300,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Transaction Info Card
                          _buildInfoCard(
                            icon: _getTypeIcon(widget.transaction['type']),
                            title: 'Jenis Transaksi',
                            value: widget.transaction['type'],
                          ),
                          const SizedBox(height: 12),

                          _buildInfoCard(
                            icon: Icons.shopping_bag,
                            title: 'Produk',
                            value: widget.transaction['name'],
                          ),
                          const SizedBox(height: 12),

                          if (widget.transaction['phone'] != null)
                            _buildInfoCard(
                              icon: Icons.phone,
                              title: 'Nomor Tujuan',
                              value: widget.transaction['phone'],
                            ),
                          if (widget.transaction['phone'] != null)
                            const SizedBox(height: 12),

                          _buildInfoCard(
                            icon: Icons.confirmation_number,
                            title: 'ID Transaksi',
                            value: widget.transaction['id'],
                          ),
                          const SizedBox(height: 12),

                          _buildInfoCard(
                            icon: Icons.calendar_today,
                            title: 'Tanggal',
                            value: widget.transaction['date'],
                          ),
                          const SizedBox(height: 12),

                          _buildInfoCard(
                            icon: Icons.access_time,
                            title: 'Waktu',
                            value: widget.transaction['time'],
                          ),
                          const SizedBox(height: 24),

                          // Price Details
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                _buildPriceRow(
                                  'Harga Produk',
                                  widget.transaction['basePrice'] ?? widget.transaction['price'],
                                ),
                                if (widget.transaction['adminFee'] != null) ...[
                                  const SizedBox(height: 8),
                                  _buildPriceRow(
                                    'Biaya Admin',
                                    widget.transaction['adminFee'],
                                  ),
                                ],
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  child: Divider(height: 1),
                                ),
                                _buildPriceRow(
                                  'Total',
                                  widget.transaction['price'],
                                  isBold: true,
                                ),
                              ],
                            ),
                          ),

                          if (widget.transaction['notes'] != null) ...[
                            const SizedBox(height: 24),
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
                                  Icon(Icons.info_outline, color: Colors.blue.shade700),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Catatan',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue.shade700,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          widget.transaction['notes'],
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          const SizedBox(height: 32),

                          // Footer
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  height: 2,
                                  width: 100,
                                  color: Colors.grey.shade300,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Terima kasih atas transaksi Anda',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Simpan struk ini sebagai bukti pembayaran',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Action Buttons (outside screenshot)
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  if (_isLoading)
                    const CircularProgressIndicator()
                  else ...[
                    ElevatedButton.icon(
                      onPressed: _captureAndShareToWhatsApp,
                      icon: const Icon(Icons.send),
                      label: const Text('Kirim ke WhatsApp'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF25D366),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      onPressed: _printReceipt,
                      icon: const Icon(Icons.print),
                      label: const Text('Print / Simpan'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.blue.shade700, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isBold ? 16 : 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: Colors.grey.shade700,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 16 : 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
