import 'package:flutter/material.dart';
import 'package:lamna/pages/city_infos_page.dart';
import 'package:lamna/utils/constants/size_device_constants.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({super.key});

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  Map<int, String> destinations = {
    1: 'one',
    2: 'two',
    3: 'three',
  };

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
      body: Container(),
    );
  }
}

Widget destinationCard(BuildContext context, int id, String picture,
    bool enable, String label, String name, String title) {
  return Card(
    child: InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => CityDetailsPage(id: id)));
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
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Center(
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CityInfosPage(id: id)));
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
Widget titleCityPage() {
  return Padding(
    padding: const EdgeInsets.only(top: 28.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(
                text: 'Choisissez la ',
                style: TextStyle(
                  color: const Color.fromRGBO(59, 107, 79, 1),
                  fontSize: SizeDeviceConstants.mobileFontSizeXl,
                  fontFamily: 'Clash Display Variable',
                  fontWeight: FontWeight.w400,
                  height: 0.06,
                ),
              ),
              TextSpan(
                text: 'destination',
                style: TextStyle(
                  color: const Color(0xFF3B6B4E),
                  fontSize: SizeDeviceConstants.mobileFontSizeXl,
                  fontFamily: 'Clash Display Variable',
                  fontWeight: FontWeight.w700,
                  height: 0.06,
                ),
              ),
              TextSpan(
                text: ' de votre voyage...',
                style: TextStyle(
                  color: const Color.fromRGBO(59, 107, 79, 1),
                  fontSize: SizeDeviceConstants.mobileFontSizeXl,
                  fontFamily: 'Clash Display Variable',
                  fontWeight: FontWeight.w400,
                  height: 0.06,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
