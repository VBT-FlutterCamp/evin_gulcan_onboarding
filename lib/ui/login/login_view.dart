import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:onboarding/core/constants/app_strings.dart';
import 'package:onboarding/core/constants/padding_constants.dart';
import 'package:onboarding/ui/login/widgets/custom_text_from_field.dart';
import '../../core/constants/colors_constants.dart';
import '../../core/constants/size_constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _textEditConEmail = TextEditingController();
  final TextEditingController _textEditConPassword = TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    isPasswordVisible = false;
    isConfirmPasswordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: _emailNode.hasFocus || _passwordNode.hasFocus
              ? const ScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: context.dynamicHeight(1.1),
            child: Padding(
              padding: context.paddingLow,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: xLarge2x),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: PaddingConst.pad8,
                      child: _buildTitle(context),
                    ),
                  ),
                  Padding(
                    padding: PaddingConst.pad15,
                    child: Expanded(flex: 2, child: _buildForm(context)),
                  ),
                  SizedBox(
                    height: xLarge5x * 2,
                    child: Padding(
                      padding: PaddingConst.pad15,
                      child: _buildButtonLogin(context),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: _buildText(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text _buildText() {
    return const Text(
      AppString.haveAccount,
      textAlign: TextAlign.center,
    );
  }

  ElevatedButton _buildButtonLogin(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kbuttonColor,
        ),
        child: Text(
          AppString.loginPage,
          textAlign: TextAlign.center,
          style: context.textTheme.headline5?.copyWith(color: kBackgroundColor),
        ),
        onPressed: () {});
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CustomTextFormField(
            controller: _textEditConEmail,
            textInputType: TextInputType.emailAddress,
            labelText: AppString.email,
            focusNode: _emailNode),
        CustomTextFormField(
          controller: _textEditConPassword,
          textInputType: TextInputType.visiblePassword,
          labelText: AppString.password,
          focusNode: _passwordNode,
          isPassword: true,
        ),
        Padding(
          padding: context.verticalPaddingLow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: context.paddingLow,
                child: Text(
                  AppString.forgot,
                  style: context.textTheme.bodyText1,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  Column _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.welcome,
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          AppString.login,
          style: Theme.of(context)
              .textTheme
              .headline3
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
