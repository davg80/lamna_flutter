import 'package:flutter/material.dart';

class CityDetailsPage extends StatefulWidget {
  final int id;
  const CityDetailsPage({super.key, required this.id});

  @override
  State<CityDetailsPage> createState() => _CityDetailsPageState();
}

class _CityDetailsPageState extends State<CityDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Text('CityDetails page'),
    );
  }
}
