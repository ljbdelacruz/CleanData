

import 'dart:io';

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
  Future<UserSessionData> mobileLogin(String mobile, String password, bool rememberMe, String device_token){
    return repository.lsMobileLogin(mobile, password, rememberMe, device_token);
  }
  Future<UserInfoSession> getUserInfo(){
    return repository.userInfo();
  }
  Future<StandardResponse> logout() async{
    return await repository.logout();
  }
  Future<StandardResponse> changePassword(String password, String password_confirmation) async {
    return await repository.changePassword(password, password_confirmation);
  }
  Future<StandardResponse> uploadUserImage(File image) async {
    return await repository.uploadUserImage(image);
  }
  Future<StandardResponse> restPassword(String email, String password, String password_confirmation, int pin) async{
    return await repository.restPassword(email, password, password_confirmation, pin);
  }
  Future<StandardResponse> forgotPasswordEmail(String email) async{
    return await repository.forgotPasswordEmail(email);
  }


}
