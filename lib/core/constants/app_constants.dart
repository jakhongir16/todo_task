import 'package:flutter/material.dart';

import 'app_colors.dart';


abstract class AppConstants {
  AppConstants._();
  static List<String> wordsOfWeekDays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];
  
  static List<Color> lightColorsTodo = [
    brightPink,
    blue,
    orange,
    red,
    green,
  ];
  static List<Color> darkColorsTodo = [
    darkPink,
    darkBlue,
    darkOrange,
    darkRed,
    darkGreen,
  ];
}