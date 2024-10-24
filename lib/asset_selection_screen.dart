import 'package:flutter/material.dart';
import 'asset_detail_screen.dart';

class AssetSelectionScreen extends StatelessWidget {
  const AssetSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pilih Jenis Asset')),
      body: ListView(
        children: [
          _buildAssetCategory('Transportasi', [
            _buildAssetItem(context, Icons.motorcycle, 'Motor', Colors.blue),
            _buildAssetItem(context, Icons.golf_course, 'Buggy', Colors.blue),
            _buildAssetItem(
                context, Icons.local_shipping, 'Truck', Colors.blue),
            _buildAssetItem(
                context, Icons.electric_scooter, 'Scooter', Colors.blue),
          ]),
          _buildAssetCategory('Komputer', [
            _buildAssetItem(context, Icons.computer, 'PC', Colors.orange),
            _buildAssetItem(context, Icons.laptop, 'Laptop', Colors.orange),
            _buildAssetItem(context, Icons.print, 'Printer', Colors.orange),
            _buildAssetItem(
                context, Icons.videocam, 'Proyektor', Colors.orange),
            _buildAssetItem(context, Icons.router, 'Router', Colors.orange),
            _buildAssetItem(
                context, Icons.battery_charging_full, 'UPS', Colors.orange),
            _buildAssetItem(context, Icons.tablet, 'Tablet', Colors.orange),
            _buildAssetItem(
                context, Icons.storage, 'Hard Drive', Colors.orange),
            _buildAssetItem(
                context, Icons.headphones, 'Headphone', Colors.orange),
            _buildAssetItem(
                context, Icons.videocam_outlined, 'Webcam', Colors.orange),
          ]),
          _buildAssetCategory('Electronic', [
            _buildAssetItem(context, Icons.ac_unit, 'AC', Colors.red),
            _buildAssetItem(context, Icons.tv, 'TV', Colors.red),
            _buildAssetItem(context, Icons.kitchen, 'Fridge', Colors.red),
            _buildAssetItem(context, Icons.phone, 'Telephone', Colors.red),
            _buildAssetItem(
                context, Icons.local_drink, 'Dispenser', Colors.red),
            _buildAssetItem(context, Icons.microwave, 'Microwave', Colors.red),
            _buildAssetItem(context, Icons.videocam, 'CCTV', Colors.red),
          ]),
        ],
      ),
    );
  }

  Widget _buildAssetCategory(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          childAspectRatio: 1,
          children: items,
        ),
      ],
    );
  }

  Widget _buildAssetItem(
      BuildContext context, IconData icon, String label, Color color) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssetDetailScreen(
              assetType: label,
              // Remove the assetDetails parameter
            ),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 40),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Map<String, String> _getAssetDetails(String assetType) {
    switch (assetType) {
      case 'Motor':
        return {
          'Mesin': '155cc',
          'Tahun': '2023',
          'Warna': 'Hitam',
          'Tipe': 'Matic',
        };
      case 'Laptop':
        return {
          'Layar': '16.1"',
          'Kapasitas': '1Tb',
          'Memori': '16 Gb',
          'Prosesor': 'i7-11800h',
        };
      // Tambahkan case untuk jenis aset lainnya
      default:
        return {
          'Info': 'Tidak tersedia',
        };
    }
  }
}
