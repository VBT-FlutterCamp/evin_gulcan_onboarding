import 'package:flutter/material.dart';

import '../../../core/constants/colors_constants.dart';
import '../../../product/text/app_strings.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.tapEvent}) : super(key: key);

  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        child: Text(
          AppString().buttonNext.toString(),
          style: const TextStyle(
              color: kBackgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        onPressed: tapEvent,
      ),
    );
  }
}
