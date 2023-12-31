import 'package:flutter/material.dart';
import 'package:lamna/pages/teaser/show_one_page.dart';
import 'package:lamna/utils/font_constants.dart';
import 'package:provider/provider.dart';
import 'package:lamna/provider/global_provider.dart';
import 'package:lamna/utils/color_constants.dart';
import 'package:lamna/utils/widgets/button_next_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GlobalProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor:
                ColorConstants.lightScaffoldBackgroundColor),
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'lämna',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 40,
                color: ColorConstants.greenLightAppColor,
                fontFamily: FontConstants.principalFont,
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
                        child: ButtonNextPageNewVison(
                          context: context,
                          page: const ShowOnePage(),
                          title: 'Commencer',
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/pictures/Madrid_pana.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width * 0.85,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Button Next Page
class ButtonNextPageNewVison extends StatelessWidget {
  const ButtonNextPageNewVison({
    Key? key,
    required BuildContext context,
    required this.page,
    required this.title,
  }) : super(key: key);

  final String title;
  final dynamic page;

  void _navigate(context, page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonNextPage(
      onPressed: () {
        _navigate(context, page);
      },
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Clash Display Variable',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Icon(
                  Icons.east,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
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
