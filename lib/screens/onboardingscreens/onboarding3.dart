import 'package:colour/colour.dart';
import 'package:flutter/material.dart';
class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/p2.jpg')),
          Text('''You can enter the world of meta-virus &
               Using chat bot and photo detection
               technology that can help you in
               recovery journey.''',
            textAlign:TextAlign.center,
            style:TextStyle(
              fontFamily: 'Segoe UI.ttf',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color:Colour('#505050'),
            ),
          ),
        ],
      ),
    );
  }
}
