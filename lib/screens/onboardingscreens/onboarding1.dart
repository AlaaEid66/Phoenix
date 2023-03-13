import 'package:colour/colour.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
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
          Text(
            'All you need !',
            style: TextStyle(
              color: Colour('#505050'),
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'Segoe Script',
            ),
          ),
          Text(
            '''An integrated community in which
            you can find doctors, psychiatrists
            and recovers to help you.''',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Segoe UI.ttf',
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colour('#505050'),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color:Colour('#008894'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
