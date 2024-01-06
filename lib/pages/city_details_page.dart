import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lamna/models/city.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const SizedBox(),
          backgroundColor: Colors.transparent,
          leading: const BackButton(color: Colors.white),
          elevation: 0),
      extendBodyBehindAppBar: true,
      body: FutureBuilder<List<City>>(
        future: getCityById(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<City> cityList = snapshot.data!;
            return Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cityList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        HeaderDetailsDestination(
                          detailPicture: snapshot.data![0].detailPicture,
                          label: snapshot.data![0].label,
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
