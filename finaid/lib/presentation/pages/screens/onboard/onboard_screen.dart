
import 'package:FinAid/presentation/pages/screens/onboard/widgets/currency_pic.dart';
import 'package:FinAid/presentation/pages/screens/onboard/widgets/landing.dart';
import 'package:FinAid/presentation/pages/screens/onboard/widgets/profile.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({super.key});
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          LandingPage(onGetStarted: (){
            _pageController.jumpToPage(1);
          },),
          ProfileWidget(onGetStarted: (){
            _pageController.jumpToPage(2);
          },),
          const CurrencyPicWidget()
        ],
      ),
    );
  }
}
