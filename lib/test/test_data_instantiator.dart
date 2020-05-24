
import 'package:clean_data/base/data_instantiator.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';


class CleanTestDataInstantiator extends DataInstantiator {
  @override
  Future<Database> getDatabase() async {
    // File path to a file in the current directory
    String dbPath = 'clean_test.db';
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
