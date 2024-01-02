import 'package:flutter/material.dart';
import 'package:lamna/utils/color_constants.dart';

class ButtonNextPage extends StatefulWidget {
  final Widget child;
  final GestureTapCallback onPressed;

  const ButtonNextPage(
      {super.key, required this.onPressed, required this.child});

  @override
  State<ButtonNextPage> createState() => _ButtonNextPageState();
}

class _ButtonNextPageState extends State<ButtonNextPage> {
  late Color _color;
  @override
  void initState() {
    _color = ColorConstants.greenLightAppColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _color,
        // side: BorderSide(color: Colors.yellow, width: 5),
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // <-- Radius
        ),
      ),
      onPressed: () {
        widget.onPressed();
      },
      child: widget.child,
    );
  }
}
