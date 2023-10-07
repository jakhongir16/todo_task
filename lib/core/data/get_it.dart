import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_task/core/data/repositories/home_repo.dart';

import 'databases/database_service.dart';
import 'databases/local_data_source.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
  
  final db = await DatabaseService().database;
  getIt.registerLazySingleton<Database>(() => db);
}