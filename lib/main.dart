import 'package:flutter/material.dart';
import 'package:lamna/pages/slider_page.dart';
import 'package:lamna/utils/color_constants.dart';
import 'package:lamna/utils/widgets/button_next_page.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                width: MediaQuery.of(context).size.width * 0.70,
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    const NewVisonTitle(),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: ButtonNextPageNewVison(context: context),
                    ),
                  ],
                ),
              ),
              Image.asset(
                'assets/pictures/Madrid_pana.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Button Next Page
class ButtonNextPageNewVison extends StatelessWidget {
  const ButtonNextPageNewVison({super.key, required BuildContext context});

  void _navigate(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SliderPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonNextPage(
      onPressed: () {
        _navigate(context);
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'Commencer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Clash Display Variable',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Icon(
                Icons.east,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Title Page
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
