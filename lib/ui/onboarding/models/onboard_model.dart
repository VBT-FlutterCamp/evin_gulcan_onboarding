class OnboardModel {
  String title;
  String description;
  String image;

  OnboardModel(
      {required this.title, required this.description, required this.image});
}

List<OnboardModel> models = [
  OnboardModel(
    title: 'Meeting Online',
    description:
        'Stay home and complete all of your importance work and meeting for keeping safe you and your family member',
    image: 'assets/images/slider1.svg',
  ),
  OnboardModel(
    title: 'Wear a Mask',
    description:
        'When you go outside of your home then obiously you have to wear a mask for keeping safe from covid-19',
    image: 'assets/images/slider2.svg',
  ),
  OnboardModel(
    title: 'Social Distance',
    description:
        'By maintaining social distance you can kep safe from other covid virus affected people and keep safe from covid-19',
    image: 'assets/images/slider3.svg',
  ),
];
