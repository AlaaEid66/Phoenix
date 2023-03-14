import 'package:colour/colour.dart';
import 'package:flutter/material.dart';
import 'package:phoenix/screens/onboardingscreens/onboarding_contents.dart';
import 'package:phoenix/shared/components/size_config.dart';
import 'onboarding1.dart';
import 'onboarding2.dart';
import 'onboarding3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>{
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  // List colors = const [
  //   Color(0xffDAD3C8),
  //   Color(0xffFFE5DE),
  //   Color(0xffDCF6E6),
  // ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(80),
        ),
        color:_currentPage==index?Colour('#008894'):Colour('#FFFFFF'),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 14,
      curve: Curves.easeIn,
      width: 14,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) => setState(() => _currentPage = value),
                    children:const[
                      OnBoarding1(),
                      OnBoarding2(),
                      OnBoarding3(),
                    ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                          (int index) => _buildDots(
                        index: index,
                      ),
                    ),
                  ),
                  _currentPage + 1 == contents.length
                      ? Padding(
                    padding: const EdgeInsets.all(30),
                    child: SizedBox(
                      width: 117,
                      height: 37,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:Colour('#008894'),
                          // padding: (width <= 400)
                          //     ? const EdgeInsets.symmetric(
                          //     horizontal: 70, vertical: 10)
                          //     : EdgeInsets.symmetric(
                          //     horizontal: width * 0.1, vertical: 20),
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight:FontWeight.bold,
                            fontFamily: 'Segoe UI',
                          ),
                        ),
                        child: const  Text("Start now!"),
                      ),
                    ),
                  )
                      : Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            _controller.jumpToPage(2);
                          },
                          style: TextButton.styleFrom(
                            elevation: 0,
                            textStyle:const TextStyle(
                              fontFamily:'Segoe UI',
                              fontSize:18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: Text(
                            "Skip",
                            style: TextStyle(color: Colour('#008894')),
                          ),
                        ),
                        SizedBox(
                          width: 80,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:Colour('#008894'),
                              elevation: 0,
                              // padding: (width <= 550)
                              //     ? const EdgeInsets.symmetric(
                              //     horizontal: 30, vertical: 20)
                              //     : const EdgeInsets.symmetric(
                              //     horizontal: 30, vertical: 25),
                              textStyle: const TextStyle(
                                fontFamily:'Segoe UI',
                                fontSize:18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text("NEXT"),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
