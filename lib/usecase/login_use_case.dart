

import '../architechture.dart';
import '../model/user_session.dart';

class LoginUseCase extends CleanUseCase {
  final CleanRepository repository;
  LoginUseCase(this.repository);
  Future<UserSession> execute(String email, String password) async {
    return await repository.login(email, password);
  }
  Future<UserSession> getSession(){
    return repository.getUserLogin();
  }
}
