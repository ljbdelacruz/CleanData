

import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/response/standard_response.dart';

import '../model/user_session.dart';

class RegistrationUseCase extends CleanUseCase {
  final CleanRepository repository;
  RegistrationUseCase(this.repository);
  
  Future<StandardResponse> register(String name, String email, String password, String rpass, String mobile){
    return repository.lsRegister(name, email, password, rpass, mobile);
  }
  

}
