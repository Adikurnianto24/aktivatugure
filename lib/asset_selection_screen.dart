import 'package:flutter/material.dart';
import 'asset_detail_screen.dart'; // Pastikan nama file sesuai
import 'widgets/asset_item.dart'; // Ensure correct import

class AssetSelectionScreen extends StatelessWidget {
  const AssetSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Jenis Asset'),
        iconTheme: const IconThemeData(
          color: Colors.lightBlue, // Ubah warna ikon kembali di sini
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAssetSection('Transportasi', Colors.blue, [
              _buildAssetItem(context, Icons.motorcycle, 'Motor', Colors.blue),
              _buildAssetItem(context, Icons.directions_car, 'Buggy', Colors.blue),
              _buildAssetItem(context, Icons.local_shipping, 'Truck', Colors.blue),
              _buildAssetItem(context, Icons.electric_scooter, 'Scooter', Colors.blue),
            ]),
            _buildAssetSection('Komputer', Colors.orange, [
              _buildAssetItem(context, Icons.computer, 'PC', Colors.orange),
              _buildAssetItem(context, Icons.laptop, 'Laptop', Colors.orange),
              _buildAssetItem(context, Icons.print, 'Printer', Colors.orange),
              _buildAssetItem(context, Icons.videocam, 'Proyektor', Colors.orange),
              _buildAssetItem(context, Icons.router, 'Router', Colors.orange),
              _buildAssetItem(context, Icons.battery_charging_full, 'UPS', Colors.orange),
              _buildAssetItem(context, Icons.tablet, 'Tablet', Colors.orange),
              _buildAssetItem(context, Icons.sd_storage, 'Hard Drive', Colors.orange),
              _buildAssetItem(context, Icons.headset, 'Headphone', Colors.orange),
              _buildAssetItem(context, Icons.camera, 'Webcam', Colors.orange),
            ]),
            _buildAssetSection('Electronic', Colors.red, [
              _buildAssetItem(context, Icons.ac_unit, 'AC', Colors.red),
              _buildAssetItem(context, Icons.tv, 'TV', Colors.red),
              _buildAssetItem(context, Icons.kitchen, 'Fridge', Colors.red),
              _buildAssetItem(context, Icons.phone, 'Telephone', Colors.red),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetSection(String title, Color color, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.grey, fontFamily: 'SF Pro Text'),
        ),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: items,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildAssetItem(BuildContext context, IconData icon, String label, Color color) {
    return AssetItem(
      icon: icon,
      label: label,
      color: color,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssetDetailScreen(assetType: label),
          ),
        );
      },
    );
  }
}

class AssetItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const AssetItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
                color: color,
                fontFamily: 'SF Pro Text',
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
