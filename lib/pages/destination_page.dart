import 'package:flutter/material.dart';
import 'package:lamna/models/city.dart';
import 'package:lamna/pages/city_details_page.dart';
import 'package:lamna/pages/city_infos_page.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/constants/size_device_constants.dart';
import 'dart:convert';
import 'dart:async' show Future;

class DestinationPage extends StatefulWidget {
  const DestinationPage({super.key});

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  String query = "";

  Future<List<City>> getCities() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/cities.json");
    List mapData = jsonDecode(data);
    // print(mapData);
    if (query != '') {
      List<City> cities = mapData.map((city) => City.fromJson(city)).toList();
      List<City> filteredList = cities
          .where(
              (city) => city.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
      return filteredList;
    }
    return mapData.map((city) => City.fromJson(city)).toList();
  }

  onChangedQuery(String newQuery) {
    setState(() {
      query = newQuery;
    });
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
        elevation: 0,
        toolbarHeight: SizeDeviceConstants.appBarHeight,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 8.0),
              child: titleDestinationPage(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextField(
                  style: const TextStyle(color: Color(0xFF3B6B4E)),
                  textAlignVertical: TextAlignVertical.center,
                  onChanged: onChangedQuery,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Ville ou Région",
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / .7,
              height: MediaQuery.of(context).size.height / 1.6,
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: FutureBuilder<List<City>>(
                  future: getCities(),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  destinationCard(
                                    context,
                                    cityList[index].id!,
                                    cityList[index].picture!,
                                    cityList[index].enable!,
                                    cityList[index].label!,
                                    cityList[index].name!,
                                    cityList[index].title!,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Widget card
Widget destinationCard(BuildContext context, int id, String picture,
    bool enable, String label, String name, String title) {
  return Card(
    child: InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CityDetailsPage(id: id),
          ),
        );
      },
      child: SizedBox(
        height: 210.0,
        width: 350,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(48), // Image radius
                    child: Image.asset(picture, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: 150,
                    height: 24,
                    decoration: ShapeDecoration(
                      color: (enable)
                          ? const Color(0xFFFCC22B)
                          : const Color(0xFFEC755A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            label,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w700,
                              height: 0.10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Color(0xFF3B6B4E),
                      fontSize: 28,
                      fontFamily: 'Clash Display Variable',
                      fontWeight: FontWeight.w600,
                      height: 0.04,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: 300 * 0.65,
                    height: 80,
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                          color: Color(0xFF3B3B3B),
                          fontSize: 18,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CityInfosPage(id: id),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(side: BorderSide.none),
                    child: const Text(
                      '+ de détails',
                      style: TextStyle(
                        color: Color(0xFF3B3B3B),
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        height: 0.09,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

// Widget title Destination
Widget titleDestinationPage() {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          textAlign: TextAlign.start,
          style: TextStyle(
              color: ColorConstants.greenDarkAppColor), //style for all textspan
          TextSpan(
            children: [
              TextSpan(
                text: "Choisissez la ",
                style: TextStyle(
                    fontSize: 21,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: "destination ",
                style: TextStyle(
                    fontSize: 21,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w800),
              ),
              TextSpan(
                text: "de votre voyage... ",
                style: TextStyle(
                    color: ColorConstants.greenDarkAppColor,
                    fontSize: 21,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
