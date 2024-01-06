import 'package:flutter/material.dart';
import 'package:lamna/utils/constants/color_constants.dart';

class HeaderDetailsDestination extends StatelessWidget {
  const HeaderDetailsDestination({
    Key? key,
    required this.detailPicture,
    required this.label,
  }) : super(key: key);

  final String detailPicture;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -80, 0),
      child: Stack(
        children: [
          Image.asset(
            detailPicture,
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            transform: Matrix4.translationValues(10, 160, 0),
            width: MediaQuery.of(context).size.width * .45,
            decoration: ShapeDecoration(
              color: ColorConstants.yellowPrimaryAppColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_active_outlined,
                    color: ColorConstants.whiteAppColor,
                    size: 12,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    label,
                    style: TextStyle(
                        color: ColorConstants.whiteAppColor, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
