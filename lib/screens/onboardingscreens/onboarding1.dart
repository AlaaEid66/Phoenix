import 'package:colour/colour.dart';
import 'package:flutter/material.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/p1.jpg')),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text(
                'All you need !',
                style: TextStyle(
                  color: Colour('#505050'),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Segoe UI',
                ),
              ),
              Text(
                '''An integrated community in which
                you can find doctors, psychiatrists
                and recovers to help you.''',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: 'Segoe UI.ttf',
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colour('#505050'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
