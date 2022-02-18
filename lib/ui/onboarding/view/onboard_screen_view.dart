import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/core/constants/padding_constants.dart';
import '../../../core/constants/colors_constants.dart';
import '../../../core/constants/size_constant.dart';
import '../models/onboard_model.dart';
import '../widgets/next_button.dart';
import '../widgets/skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int selectedSlider = 0;
  PageController sliderController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      selectedSlider = index;
                    });
                  },
                  controller: sliderController,
                  itemCount: models.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      const SizedBox(
                        height: large * 5,
                      ),
                      SvgPicture.asset(
                        models[index].image,
                        height: xLarge5x * 5,
                      ),
                      const SizedBox(
                        height: large * 5,
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                models.length,
                                (index) => buildSliderNav(index: index),
                              ),
                            ),
                            const SizedBox(height: xLarge2x / 3),
                            Text(
                              models[index].title,
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: xLarge2x / 2),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: xLarge2x * 2),
                              child: Text(
                                models[index].description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: kTextLightColor, fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]);
                  },
                ),
              ),
              Padding(
                padding: PaddingConst.padOnly30,
                child: _buildButtonRow(
                    selectedSlider: selectedSlider,
                    sliderController: sliderController),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildSliderNav({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: xLarge2x / 2,
      width: xLarge2x / 2,
      decoration: BoxDecoration(
          color:
              selectedSlider == index ? kPrimaryColor : const Color(0xFFD7D7D7),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}

class _buildButtonRow extends StatelessWidget {
  const _buildButtonRow({
    Key? key,
    required this.selectedSlider,
    required this.sliderController,
  }) : super(key: key);

  final int selectedSlider;
  final PageController sliderController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SkipButton(
          tapEvent: () {
            if (selectedSlider != (models.length + 1)) {
              sliderController.animateToPage(selectedSlider - 1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.linear);
            }
          },
        ),
        const SizedBox(
          width: xLarge2x / 4,
        ),
        NextButton(
          tapEvent: () {
            if (selectedSlider != (models.length - 1)) {
              sliderController.animateToPage(selectedSlider + 1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.linear);
            }
          },
        )
      ],
    );
  }
}
