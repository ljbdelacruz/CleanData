import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../data_instantiator.dart';


abstract class CleanApp extends StatelessWidget{
  CleanDataInstantiator dataInstantiator;
  CleanApp(this.dataInstantiator);
}

abstract class CleanDataInstantiator {
  CleanDataInstantiator(){

  }
  void initAppDependencies();
}
class TestCleanDataInstantiator extends DataInstantiator {
  @override
  Future<Database> getDatabase() async {
    // File path to a file in the current directory
    String dbPath = 'cleanapp.db';
    DatabaseFactory dbFactory = databaseFactoryIo;
    return await dbFactory.openDatabase(dbPath);
  }

  Dio getDio(Database database) {
    Dio dio = super.getDio(database);
    dio.interceptors.add(
      PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          maxWidth: 128,
          error: true,
          responseBody: true),
    );
    return dio;
  }
}