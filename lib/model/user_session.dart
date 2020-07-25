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
  UserSession.dummy(){
    this.firstname="Dummy 1";
    this.lastname="Dummy";
    this.birthDate="05 Dec 1994";
    this.token=UserTokenSession.empty();
  }
}


class UserSessionData extends CleanModel{
  UserTokenSession token;
  UserInfoSession user;
  String message;
  UserSessionData(this.token, this.user, this.message);
  UserSessionData.empty(){
    this.token=null;
    this.user=null;
  }
}

class UserTokenSession extends CleanModel {
  String token;
  String type;
  String expires_at;
  UserTokenSession(this.token, this.type, this.expires_at);
  UserTokenSession.empty(){
    this.token="";
    this.type="";
  }
}

class UserInfoSession extends CleanModel{
  String id;
  String name;
  String email;
  String mobile;
  String role;
  String deviceToken;

  UserInfoSession(this.name, this.email, this.mobile, this.role);
  UserInfoSession.register(this.id, this.name, this.email, this.mobile, this.deviceToken);
  
  UserInfoSession.empty(){
    this.name="";
    this.email="";
    this.mobile="";
    this.role="";
  }
}