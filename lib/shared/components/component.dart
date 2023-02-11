import 'package:flutter/material.dart';
import 'package:colour/colour.dart';
Widget defButton({
  double height = 50,
  Color ?backgroundColor ,
  double width =  370,
  required void Function()pressed,
  required String text,
  Color textColor =Colors.white,
  double border=15,
  double fontSize = 30,
}){
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color:Colour('#008894'),
      borderRadius:BorderRadius.circular(border),
    ),
    child: MaterialButton(
      onPressed:pressed,
      child: Text(
        text,
        style:TextStyle(
          color:textColor,
          fontSize: fontSize,
        ),
      ),

    ),
  );
}