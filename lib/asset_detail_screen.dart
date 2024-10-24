import 'package:flutter/material.dart';
import 'asset_detail.dart';

class AssetDetailScreen extends StatefulWidget {
  final String assetType;

  const AssetDetailScreen({Key? key, required this.assetType})
      : super(key: key);

  @override
  _AssetDetailScreenState createState() => _AssetDetailScreenState();
}

class _AssetDetailScreenState extends State<AssetDetailScreen> {
  List<AssetInfo> assets = [];
  List<AssetInfo> filteredAssets = [];
  bool isAscending = true;
  String filterStatus = 'All';

  @override
  void initState() {
    super.initState();
    assets =
        List.generate(5, (index) => _getAssetInfo(widget.assetType, index));
    filteredAssets = List.from(assets);
  }

  void _sortAssets() {
    setState(() {
      isAscending = !isAscending;
      filteredAssets.sort((a, b) => isAscending
          ? a.title.compareTo(b.title)
          : b.title.compareTo(a.title));
    });
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Filter by Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('All'),
                leading: Radio<String>(
                  value: 'All',
                  groupValue: filterStatus,
                  onChanged: (String? value) {
                    Navigator.pop(context);
                    _filterAssets(value!);
                  },
                ),
              ),
              ListTile(
                title: const Text('Available'),
                leading: Radio<String>(
                  value: 'Available',
                  groupValue: filterStatus,
                  onChanged: (String? value) {
                    Navigator.pop(context);
                    _filterAssets(value!);
                  },
                ),
              ),
              ListTile(
                title: const Text('Not Available'),
                leading: Radio<String>(
                  value: 'Not Available',
                  groupValue: filterStatus,
                  onChanged: (String? value) {
                    Navigator.pop(context);
                    _filterAssets(value!);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _filterAssets(String status) {
    setState(() {
      filterStatus = status;
      if (status == 'All') {
        filteredAssets = List.from(assets);
      } else {
        filteredAssets =
            assets.where((asset) => asset.status == status).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Asset - ${widget.assetType}'),
        iconTheme: const IconThemeData(
          color: Colors.lightBlue,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _showFilterDialog,
                  icon: const Icon(Icons.filter_list),
                  label: const Text('Filter'),
                ),
                ElevatedButton.icon(
                  onPressed: _sortAssets,
                  icon: Icon(
                      isAscending ? Icons.arrow_upward : Icons.arrow_downward),
                  label: const Text('Sort'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.assetType,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredAssets.length,
                itemBuilder: (context, index) =>
                    _buildAssetDetails(filteredAssets[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetDetails(AssetInfo assetInfo) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: assetInfo.color,
          radius: 25,
          child: Icon(assetInfo.icon, color: Colors.white),
        ),
        title: Text(
          assetInfo.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(assetInfo.subtitle),
            Text(
              assetInfo.status,
              style: TextStyle(
                  color: assetInfo.status == 'Available'
                      ? Colors.green
                      : Colors.red),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // Add action for more options
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AssetDetail(assetId: assetInfo.subtitle),
            ),
          );
        },
      ),
    );
  }

  AssetInfo _getAssetInfo(String assetType, int index) {
    final baseInfo = _getBaseAssetInfo(assetType);
    return AssetInfo(
      baseInfo.icon,
      baseInfo.color,
      '${baseInfo.title} ${index + 1}',
      '${baseInfo.subtitle}-00${index + 1}',
      index % 2 == 0 ? 'Available' : 'Not Available',
    );
  }

  AssetInfo _getBaseAssetInfo(String assetType) {
    switch (assetType) {
      case 'Motor':
        return AssetInfo(Icons.motorcycle, Colors.blue, 'Yamaha NMAX 150 cc',
            'B 2422 KM', 'Available');
      case 'Buggy':
        return AssetInfo(Icons.directions_car, Colors.blue, 'Buggy XYZ Model',
            'B 1234 AB', 'Available');
      case 'Truck':
        return AssetInfo(Icons.local_shipping, Colors.blue, 'Isuzu Elf',
            'B 9876 XY', 'Available');
      case 'Scooter':
        return AssetInfo(Icons.electric_scooter, Colors.blue, 'Xiaomi M365 Pro',
            'SC', 'Available');
      case 'PC':
        return AssetInfo(
            Icons.computer, Colors.orange, 'Dell OptiPlex', 'PC', 'Available');
      case 'Laptop':
        return AssetInfo(
            Icons.laptop, Colors.orange, 'MacBook Pro', 'LT', 'Available');
      case 'Printer':
        return AssetInfo(
            Icons.print, Colors.orange, 'HP LaserJet Pro', 'PR', 'Available');
      case 'Proyektor':
        return AssetInfo(
            Icons.videocam, Colors.orange, 'Epson EB-U05', 'PJ', 'Available');
      case 'Router':
        return AssetInfo(
            Icons.router, Colors.orange, 'TP-Link Archer', 'RT', 'Available');
      case 'UPS':
        return AssetInfo(Icons.battery_charging_full, Colors.orange,
            'APC Back-UPS', 'UPS', 'Available');
      case 'Tablet':
        return AssetInfo(
            Icons.tablet, Colors.orange, 'iPad Air', 'TB', 'Available');
      case 'Hard Drive':
        return AssetInfo(Icons.sd_storage, Colors.orange, 'WD My Passport',
            'HD', 'Available');
      case 'Headphone':
        return AssetInfo(
            Icons.headset, Colors.orange, 'Sony WH-1000XM4', 'HP', 'Available');
      case 'Webcam':
        return AssetInfo(
            Icons.camera, Colors.orange, 'Logitech C920', 'WC', 'Available');
      case 'AC':
        return AssetInfo(
            Icons.ac_unit, Colors.red, 'Daikin FTKG25', 'AC', 'Available');
      case 'TV':
        return AssetInfo(
            Icons.tv, Colors.red, 'Samsung 55" QLED', 'TV', 'Available');
      case 'Fridge':
        return AssetInfo(
            Icons.kitchen, Colors.red, 'LG InstaView', 'FR', 'Available');
      case 'Telephone':
        return AssetInfo(
            Icons.phone, Colors.red, 'Panasonic KX-TS500', 'TEL', 'Available');
      default:
        return AssetInfo(
            Icons.device_unknown, Colors.grey, 'Unknown Asset', 'N/A', 'N/A');
    }
  }
}

class AssetInfo {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final String status;

  AssetInfo(this.icon, this.color, this.title, this.subtitle, this.status);
}
