

import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/base/clean_app.dart';
import 'package:clean_data/config/constant.dart';
import 'package:clean_data/repository/clean_main_repository.dart';
import 'package:clean_data/rest_client.dart';
import 'package:clean_data/usecase/address_use_case.dart';
import 'package:clean_data/usecase/customer_use_case.dart';
import 'package:clean_data/usecase/fb_login_use_case.dart';
import 'package:clean_data/usecase/login_use_case.dart';
import 'package:clean_data/usecase/mcsrider_use_case.dart';
import 'package:clean_data/usecase/mstore_use_case.dart';
import 'package:clean_data/usecase/registration_use_case.dart';
import 'package:clean_data/usecase/transaction_use_case.dart';
import 'package:clean_data/usecase/unauthenticated_use_case.dart';
import 'package:clean_data/usecase/user_auth_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';


class DataInstantiator extends CleanDataInstantiator {
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

    GetIt.I.registerLazySingleton<UserAuthUseCase>(
        () => UserAuthUseCase(repository));
    GetIt.I.registerLazySingleton<RegistrationUseCase>(
        () => RegistrationUseCase(repository));
    GetIt.I.registerLazySingleton<MStoreUseCase>(
        () => MStoreUseCase(repository));
    GetIt.I.registerLazySingleton<CustomerUseCase>(
        () => CustomerUseCase(repository));
    GetIt.I.registerLazySingleton<UnauthenticatedUseCase>(
        () => UnauthenticatedUseCase(repository));
    GetIt.I.registerLazySingleton<AddressUseCase>(
        () => AddressUseCase(repository));
    GetIt.I.registerLazySingleton<MStoreTransactionUseCase>(
        () => MStoreTransactionUseCase(repository));
    GetIt.I.registerLazySingleton<MCSRiderUseCase>(
        () => MCSRiderUseCase(repository));
    
    
  }

  Future<Database> getDatabase() async {
    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    var dbPath = join(dir.path, 'cleanapp.db');

    return await databaseFactoryIo.openDatabase(dbPath);
  }

  Dio getDio(Database database) {
    BaseOptions options = new BaseOptions(
      //set base url here
      baseUrl: Constants.instance.baseURL,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
      connectTimeout: 15000,
      receiveTimeout: 15000,
    );
    Dio dio = Dio(options);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (Options options) async {
          // SessionDb sessionDb = SessionDb(database);
          dio.interceptors.requestLock.lock();
          // Session currentSession = await sessionDb.getCurrentSession();
          // if (currentSession?.token != null)
          if(Constants.instance.session != null){
            options.headers.addAll(
              {
                "Authorization": Constants.instance.session.token.type+" "+Constants.instance.session.token.token,
                "X-Requested-With":"XMLHttpRequest"
              },
            );
          }
          dio.interceptors.requestLock.unlock();
          return options; //continue
        },
      ),
    );

    return dio;
  }

}