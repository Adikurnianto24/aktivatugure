import 'package:flutter/material.dart';

class AssetDetail extends StatelessWidget {
  final String assetId;

  const AssetDetail({Key? key, required this.assetId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Asset Detail: $assetId')),
      body: Center(child: Text('Details for asset $assetId')),
    );
  }
}
