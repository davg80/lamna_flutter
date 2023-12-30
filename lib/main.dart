import 'package:flutter/material.dart';
import 'package:lamna/utils/color_constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: ColorConstants.lightScaffoldBackgroundColor),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'lämna',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 40,
              color: ColorConstants.greenLightAppColor,
              fontFamily: 'ClashDisplay',
            ),
          ),
          backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          width: MediaQuery.of(context).size.width * 0.70,
          alignment: Alignment.topLeft,
          child: const NewVisonTitle(),
        ),
      ),
    );
  }
}

class NewVisonTitle extends StatelessWidget {
  const NewVisonTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          style: TextStyle(
              color: ColorConstants.greenDarkAppColor), //style for all textspan
          TextSpan(
            children: [
              TextSpan(
                text: "Une nouvelle vision ",
                style: TextStyle(
                    fontSize: 21.04,
                    color: ColorConstants.greenDarkAppColor,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: "du voyage alliant",
                style: TextStyle(
                  fontSize: 21.04,
                  color: ColorConstants.greenDarkAppColor,
                ),
              ),
              TextSpan(
                text: " commerce local ",
                style: TextStyle(
                    color: ColorConstants.yellowPrimaryAppColor,
                    fontSize: 21.04,
                    fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: " et ",
                style: TextStyle(
                    color: ColorConstants.greenDarkAppColor, fontSize: 21.04),
              ),
              TextSpan(
                text: "mobilité responsable",
                style: TextStyle(
                    fontSize: 21.04,
                    color: ColorConstants.yellowPrimaryAppColor,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
