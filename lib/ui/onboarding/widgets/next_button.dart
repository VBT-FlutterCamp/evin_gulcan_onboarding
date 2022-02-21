import 'package:flutter/material.dart';
import 'package:onboarding/product/companent/app_size_constant.dart';

import '../../../product/companent/app_colors_constant.dart';
import '../../../product/companent/app_text_constant.dart';
import '../../../product/companent/app_text_style.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, required this.tapEvent}) : super(key: key);

  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: xLarge5x * 3,
      child: ElevatedButton(
        child: Text(
          AppString().buttonNext.toString(),
          style: StyleText().normalTextStyle,
        ),
        onPressed: tapEvent,
      ),
    );
  }
}
