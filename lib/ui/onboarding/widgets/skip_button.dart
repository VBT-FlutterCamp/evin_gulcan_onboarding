import 'package:flutter/material.dart';

import '../../../core/constants/colors_constants.dart';
import '../../../product/text/app_strings.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key, required this.tapEvent}) : super(key: key);

  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: tapEvent,
        child: Text(
          AppString().buttonSkip.toString(),
          style: const TextStyle(
              color: kBackgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            textStyle:
                const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
