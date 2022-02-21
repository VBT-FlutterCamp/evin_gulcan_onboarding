import 'package:flutter/material.dart';

import 'app_colors_constant.dart';

class StyleText {
  FontWeight styleFontWeight = FontWeight.w700;

  var normalTextStyle = const TextStyle(
    fontSize: 16,
    color: kBackgroundColor,
    fontWeight: FontWeight.w600,
  );

  var titleTextStyle = const TextStyle(
      fontSize: 24, color: kTextColor, fontWeight: FontWeight.bold);

  var descTextStyle = const TextStyle(color: kTextLightColor, fontSize: 18);

  var skipTextStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
}
