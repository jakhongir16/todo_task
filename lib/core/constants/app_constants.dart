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
    blue,
    orange,
    red,
    
  ];
  static List<Color> darkColorsTodo = [
    darkBlue,
    darkOrange,
    darkRed,
  ];
}