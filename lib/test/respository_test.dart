import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/base/clean_app.dart';
import 'package:clean_data/config/constant.dart';
import 'package:clean_data/db/user_session_db.dart';
import 'package:clean_data/mapper/user_session_data_mapper.dart';
import 'package:clean_data/response/standard_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';

import '../test/test_data_instantiator.dart';
import '../rest_client.dart';


void main() {
  CleanRepository repository;
  UserSessionDataMapper userSDataMapper= UserSessionDataMapper();

  
  //TODO: living smart
  Future<StandardResponse> login(String email, String password, RestClient restClient) async {
    var response = await restClient.lSmartLogin(email, password, true);
    Constants.instance.session=userSDataMapper.fromMap(response.data);
    return StandardResponse.fromJson(response.data);
  }


  setUp(() async {
    // CleanDataInstantiator dataInstantiator = CleanTestDataInstantiator();
    // await dataInstantiator.initAppDependencies();
    // restClient = GetIt.I.get<RestClient>();
    // repository = GetIt.I.get<CleanRepository>();
    // if (restClient.hasToken()) return;
    // await login("hamad@janahi.com", "12345678");
    
    CleanDataInstantiator dataInstantiator = CleanTestDataInstantiator();
    await dataInstantiator.initAppDependencies();
    repository = GetIt.I.get<CleanRepository>();
    RestClient restClient = GetIt.I.get<RestClient>();
    Constants.instance.baseURL="http://localhost:8080";
    StoreRef store = StoreRef<String, Map>.main();
    // userSessionDb = UserSessionDb(database);
    if (restClient.hasToken()) return;
    await login("hamad@janahi.com", "12345678", restClient);

    // Constants.instance.baseURL="http://localhost:8080";
  });

  test("fetchStoreCart", () async{
    var data=await repository.getCartStores();
    print("Store Cart count");
    print(data.length);
    await Future.delayed(Duration(milliseconds: 350));
  });


}