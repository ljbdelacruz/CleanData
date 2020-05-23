import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../architechture.dart';
import '../base/clean_data_instantiator.dart';
import '../rest_client.dart';



void main() {
  CleanRepository repository;

  setUp(() async {
    CleanDataInstantiator dataInstantiator = TestCleanDataInstantiator();
    await dataInstantiator.initAppDependencies();
    repository = GetIt.I.get<CleanRepository>();
    RestClient restClient = GetIt.I.get<RestClient>();
  });

  test("login", ()async{
    await repository.login("ljbdelacruz123@gmail.com", "johnny05");
    var userSession=await repository.getUserLogin();
    print("setup user session");
    print(userSession.firstname);
  });

  test("getCategory", ()async{
    var data=await repository.getCategoryType("dishtype");
    print("Category count");
    print(data.length);
    await Future.delayed(Duration(milliseconds: 350));
  });


}