import 'package:flutter/material.dart';

class CityInfosPage extends StatefulWidget {
  final int id;
  const CityInfosPage({super.key, required this.id});

  @override
  State<CityInfosPage> createState() => _CityInfosPageState();
}

class _CityInfosPageState extends State<CityInfosPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('CityInfos page'),
    );
  }
}
