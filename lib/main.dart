import 'package:flutter/material.dart';

import 'app.dart';
import 'core/data/databases/database_service.dart';
import 'core/data/get_it.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService().database;
  await setUp();
  runApp(const MyApp());
}

