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
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
