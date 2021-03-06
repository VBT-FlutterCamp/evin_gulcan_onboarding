import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../product/companent/app_colors_constant.dart';
import '../../../product/companent/app_size_constant.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String labelText;
  final bool isPassword;
  final FocusNode focusNode;
  const CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.textInputType,
      required this.labelText,
      this.isPassword = false,
      required this.focusNode})
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool passVis;

  @override
  void initState() {
    super.initState();
    passVis = widget.isPassword == true ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: kGriColor)),
      child: Container(
        decoration: BoxDecoration(
            border: widget.focusNode.hasFocus
                ? const Border(
                    left: BorderSide(width: normal, color: kBlueColor),
                  )
                : null),
        child: Padding(
          padding: context.paddingLow,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field can not be empty";
              }
              if (value.length < 6) {
                return "This field can not be less than 6";
              }
              if (value.length > 20) {
                return "This field can not be greater than 20";
              }
            },
            focusNode: widget.focusNode,
            controller: widget.controller,
            keyboardType: widget.textInputType,
            obscureText: passVis,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: Theme.of(context).textTheme.headline6,
              border: InputBorder.none,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          passVis = !passVis;
                        });
                      },
                      icon: passVis == true
                          ? const Icon(Icons.visibility_off)
                          : const Icon(
                              Icons.visibility,
                            ))
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
