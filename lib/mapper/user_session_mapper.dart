



import 'package:clean_data/base/architechture.dart';
import '../model/user_session.dart';

class UserSessionMapper extends CleanMapper<UserSession> {
  @override
  UserSession fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    UserTokenSessionMapper tmapper=UserTokenSessionMapper();
    if(map != null){
      return UserSession(map["firstName"], map["lastName"], map["birthDate"], tmapper.fromMap(map["token"]));
    }
    return UserSession.empty();
  }
  @override
  Map<String, dynamic> toMap(UserSession object) {
    // TODO: implement toMap
    return {"firstname":object.firstname, 
            "lastname":object.lastname,
            "birthDate":object.birthDate,
           };
  }
}

class UserTokenSessionMapper extends CleanMapper<UserTokenSession>{
  @override
  UserTokenSession fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    if(map != null){
      return UserTokenSession(map["token"].toString(), map["type"].toString());
    }
    return UserTokenSession.empty();
 
  }
  @override
  Map<String, dynamic> toMap(UserTokenSession object) {
    // TODO: implement toMap
    return {"token":object.token, 
            "type":object.type
          };
  }
  
}