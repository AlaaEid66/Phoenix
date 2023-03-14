import 'package:colour/colour.dart';
import 'package:flutter/material.dart';
class OnBoarding2 extends StatefulWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  State<OnBoarding2> createState() => _OnBoarding2State();
}

class _OnBoarding2State extends State<OnBoarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/p2.jpg')),
         const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              textAlign:TextAlign.center,
              text: TextSpan(
                text:'You can enter the world of ',
                style: TextStyle(
                  fontFamily: 'Segoe UI.ttf',
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color:Colour('#505050'),
                ),
                children:<TextSpan>[
                  TextSpan(
                    text:'metavirus',
                    style:  TextStyle(
                      fontFamily: 'Segoe UI.ttf',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color:Colour('#505050'),
                    ),
                  ),
                  TextSpan(
                    text: '''&
                    Using ''',
                    style:TextStyle(
                      fontFamily: 'Segoe UI.ttf',
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color:Colour('#505050'),
                    ),
                  ),
                  TextSpan(
                    text:'chatbot',
                    style:  TextStyle(
                      fontFamily: 'Segoe UI.ttf',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color:Colour('#505050'),
                    ),
                  ),
                  TextSpan(
                    text:'''and photodetection 
                    technology that can help you in 
                    recovery journey.''',
                    style:TextStyle(
                      fontFamily: 'Segoe UI.ttf',
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color:Colour('#505050'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
