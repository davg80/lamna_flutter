import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';
import 'package:lamna/utils/widgets/itinerary/title_itinerary.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class ItineraryPage extends StatefulWidget {
  const ItineraryPage({super.key});

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  final List<SwipeItem> _swipeItems = [];
  late MatchEngine _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> _names = ["Red", "Blue", "Green", "Yellow", "Orange"];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(
        SwipeItem(
            content: Content(text: _names[i], color: _colors[i]),
            likeAction: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Liked ${_names[i]}"),
                  duration: const Duration(milliseconds: 500),
                ),
              );
            },
            nopeAction: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Nope ${_names[i]}"),
                  duration: const Duration(milliseconds: 500),
                ),
              );
            },
            superlikeAction: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Superliked ${_names[i]}"),
                  duration: const Duration(milliseconds: 500),
                ),
              );
            },
            onSlideUpdate: (SlideRegion? region) async {
              print("Region $region");
            }),
      );
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 18.0),
          child: TitleItinerary(),
        ),
        backgroundColor: ColorConstants.lightScaffoldBackgroundColor,
        elevation: 0,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 550,
            child: SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: _swipeItems[index].content.color,
                  child: Text(
                    _swipeItems[index].content.text,
                    style: const TextStyle(fontSize: 100),
                  ),
                );
              },
              onStackFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Stack Finished"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              itemChanged: (SwipeItem item, int index) {
                print("item: ${item.content.text}, index: $index");
              },
              upSwipeAllowed: true,
              fillSpace: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Nope")),
              ElevatedButton(onPressed: () {}, child: const Text("Superlike")),
              ElevatedButton(onPressed: () {}, child: const Text("Like"))
            ],
          )
        ]),
      ),
    );
  }
}

class Content {
  final String text;
  final Color color;

  Content({required this.text, required this.color});
}
