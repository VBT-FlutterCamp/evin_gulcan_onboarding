import 'package:flutter/material.dart';
import 'package:onboarding/product/companent/app_text_style.dart';
import '../../../product/companent/app_colors_constant.dart';
import '../../../product/companent/app_size_constant.dart';
import '../../../product/companent/app_text_constant.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key, required this.tapEvent}) : super(key: key);

  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: xLarge5x * 3,
      child: ElevatedButton(
        onPressed: tapEvent,
        child: Text(
          AppString().buttonSkip.toString(),
          style: StyleText().normalTextStyle,
        ),
        style: ElevatedButton.styleFrom(
            primary: kGriColor, textStyle: StyleText().skipTextStyle),
      ),
    );
  }
}
