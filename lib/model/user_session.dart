import '../architechture.dart';

class UserSession extends CleanModel {
  String firstname;
  String lastname;
  String birthDate;
  UserTokenSession token;
  UserSession(this.firstname, this.lastname, this.birthDate, this.token);
}

class UserTokenSession extends CleanModel {
  String token;
  String type;
  UserTokenSession(this.token, this.type);
}