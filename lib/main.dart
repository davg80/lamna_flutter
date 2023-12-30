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
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/pictures/Madrid_pana.png',
                fit: BoxFit.fitWidth,
                alignment: Alignment.bottomLeft,
              ),
            )
          ],
        ),
      ),
    );
  }
}
