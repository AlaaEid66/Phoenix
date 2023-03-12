import 'package:colour/colour.dart';
import 'package:flutter/material.dart';
class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/p2.jpg')),
         const SizedBox(
            height: 20,
          ),
          Text('''You can enter the world of meta-virus &
               Using chat bot and photo detection
               technology that can help you in
               recovery journey.''',
            textAlign:TextAlign.center,
            style:TextStyle(
              fontFamily: 'Segoe UI.ttf',
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color:Colour('#505050'),
            ),
          ),
        ],
      ),
    );
  }
}
