import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../architechture.dart';
import '../architechture.dart';
import '../data_instantiator.dart';
import '../repository/clean_main_repository.dart';
import '../rest_client.dart';
import '../usecase/login_use_case.dart';


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
  void initAppDependencies() async {
    Database database = await getDatabase();
    Dio dio = getDio(database);
    var restClient = RestClient(dio);
    CleanRepository repository = CleanMainRepository(
      database,
      restClient,
    );
    GetIt.I.registerSingleton<CleanRepository>(repository);
    GetIt.I.registerSingleton<RestClient>(restClient);
    GetIt.I.registerSingleton<Dio>(dio);
    GetIt.I.registerSingleton<Database>(database);
    GetIt.I.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(repository));
  }

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