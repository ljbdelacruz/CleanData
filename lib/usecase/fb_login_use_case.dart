

import 'package:clean_data/base/architechture.dart';

import '../model/user_session.dart';

class FBLoginUseCase extends CleanUseCase {
  final CleanRepository repository;
  FBLoginUseCase(this.repository);
  Future<UserSession> execute(String fbId, String fname, String lname) async {
    return await repository.fbLogin(fbId, fname, lname);
  }
  Future<UserSession> getSession(){
    return repository.getUserLogin();
  }
}
