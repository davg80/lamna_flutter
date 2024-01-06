import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lamna/models/city.dart';
import 'package:lamna/pages/destination_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/detailsDestination/header_details_destination.dart';

class CityDetailsPage extends StatefulWidget {
  final int id;
  const CityDetailsPage({super.key, required this.id});

  @override
  State<CityDetailsPage> createState() => _CityDetailsPageState();
}

class _CityDetailsPageState extends State<CityDetailsPage> {
  Future<List<City>> getCityById() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/cities.json");
    List mapData = jsonDecode(data);
    List<City> cities = mapData.map((city) => City.fromJson(city)).toList();
    return cities.where((city) => city.id == widget.id).toList();
  }

  void _navigate() {
    Navigator.pop(context,
        MaterialPageRoute(builder: (context) => const DestinationPage()));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: () {
            _navigate();
          },
          child: Container(
            transform: Matrix4.translationValues(-10, 0, 0),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: FutureBuilder<List<City>>(
        future: getCityById(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<City> city = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                HeaderDetailsDestination(
                    detailPicture: city[0].detailPicture, label: city[0].label),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0, left: 14.0),
                    child: Text(
                      city[0].name,
                      style: const TextStyle(
                        color: Color(0xFF3B6B4E),
                        fontSize: 30,
                        fontFamily: 'Clash Display Variable',
                        fontWeight: FontWeight.w600,
                        height: 0.04,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0, left: 14.0),
                    child: Text(city[0].text),
                  ),
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
