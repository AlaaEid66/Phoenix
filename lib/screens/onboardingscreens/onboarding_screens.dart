import 'package:colour/colour.dart';
import 'package:flutter/material.dart';
import 'package:phoenix/screens/onboardingscreens/onboarding1.dart';
import 'package:phoenix/screens/onboardingscreens/onboarding3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'onboarding2.dart';
 class OnBoardingScreen extends StatefulWidget {
   const OnBoardingScreen({Key? key}) : super(key: key);

   @override
   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
 }

 class _OnBoardingScreenState extends State<OnBoardingScreen> {
   int currentIndex = 0;
   PageController? _controller;

   @override
   void initState() {
     _controller = PageController(initialPage: 0);
     super.initState();
   }
   @override
   void dispose() {
     _controller?.dispose();
     super.dispose();
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Stack(
         children: [
           PageView(
             onPageChanged: (int index) {
               setState(() {
                 currentIndex = index;
               });
             },
             controller: _controller,
             children:const[
               Screen1(),
               Screen2(),
               Screen3(),
             ],
           ),
           Container(
             alignment: const Alignment(0,0.75),
             child: SmoothPageIndicator(
                 controller: _controller!,
                 count: 3,
                effect:  SlideEffect(
                  activeDotColor:Colour('#008894'),
                  dotColor: Colour('#FFFFFF'),

                ),
             ),
           ),
         ],
       ),
     );
   }

 }


