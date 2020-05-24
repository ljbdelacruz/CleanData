import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/base/clean_app.dart';
import 'package:clean_data/config/constant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../test/test_data_instantiator.dart';
import '../rest_client.dart';


void main() {
  CleanRepository repository;

  setUp(() async {
    CleanDataInstantiator dataInstantiator = CleanTestDataInstantiator();
    await dataInstantiator.initAppDependencies();
    repository = GetIt.I.get<CleanRepository>();
    Constants.instance.baseURL="http://localhost:8080";
  });

  test("login", ()async{
    await repository.login("ljbdelacruz123@gmail.com", "johnny05");
    var userSession=await repository.getUserLogin();
    print("setup user session");
    print(userSession.firstname);
  });
test("fbLogin", ()async{
    await repository.fbLogin("3374878515875196", "Lainel John", "Dela Cruz");
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