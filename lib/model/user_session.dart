import 'package:clean_data/base/architechture.dart';

class UserSession extends CleanModel {
  String firstname;
  String lastname;
  String birthDate;
  UserTokenSession token;
  UserSession(this.firstname, this.lastname, this.birthDate, this.token);
  UserSession.empty(){
    this.firstname="";
    this.lastname="";
    this.birthDate="";
    this.token=UserTokenSession.empty();
  }
}

class UserTokenSession extends CleanModel {
  String token;
  String type;
  UserTokenSession(this.token, this.type);
  UserTokenSession.empty(){
    this.token="";
    this.type="";
  }
}