

import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/response/standard_response.dart';

import '../model/user_session.dart';

class UserAuthUseCase extends CleanUseCase {
  final CleanRepository repository;
  UserAuthUseCase(this.repository);
  
  Future<UserSession> execute(String email, String password) async {
    return await repository.login(email, password);
  }
  Future<UserSessionData> login(String email, String password, bool rememberMe){
    return repository.lsLogin(email, password, rememberMe);
  }
  Future<UserInfoSession> getUserInfo(){
    return repository.userInfo();
  }
  Future<StandardResponse> logout(){
    return repository.logout();
  }

}
