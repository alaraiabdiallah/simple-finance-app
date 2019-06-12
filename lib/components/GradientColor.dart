

import 'package:flutter/material.dart';

List<Color> GradientColor(String color){
  List<Color> colors;
  if (color == "blue") {
     colors = [
      Colors.blue[400],
      Colors.blue[300],
      Colors.blue[200],
    ];
   }else if(color == "green"){
     colors = [
      Colors.green[400],
      Colors.green[300],
      Colors.green[200]
    ];
   }else if(color == "red"){
     colors = [
      Colors.red[400],
      Colors.red[300],
      Colors.red[200]
    ];
   }else{
     colors = [
      Colors.grey[400],
      Colors.grey[200]
    ];
   }
  return colors;
}

LinearGradient definedGradient(String color){
  return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: GradientColor(color)
  );
}