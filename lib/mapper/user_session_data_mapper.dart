





import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/mapper/user_session_mapper.dart';
import 'package:clean_data/model/user_session.dart';

class UserSessionDataMapper extends CleanMapper<UserSessionData> {
  @override
  UserSessionData fromMap(Map<String, dynamic> map) {
    // TODO: implement fromMap
    UserInfoSessionMapper userMapper = UserInfoSessionMapper();
    UserTokenSessionMapper tokenMapper = UserTokenSessionMapper();
    if(map != null){
      var token = tokenMapper.fromMap(map["data"]["auth"]);
      var user = userMapper.fromMap(map["data"]["user"]);
      return UserSessionData(token, user, map["data"]["message"].toString());
    }
    return UserSessionData.empty();
  }
  @override
  Map<String, dynamic> toMap(UserSessionData object) {
    return {};
  }
}

class UserInfoSessionMapper extends CleanMapper<UserInfoSession> {
  @override
  UserInfoSession fromMap(Map<String, dynamic> map) {
    if(map != null){
      return UserInfoSession(map["name"], map["email"], map["mobile"], map["role"]);
    }
    return UserInfoSession.empty();
  }
  UserInfoSession fromMapRegister(Map<String, dynamic> map){
    if(map != null){
      return UserInfoSession.register(map["id"], map["name"], map["email"], map["mobile"], map["deviceToken"]);
    }
    return UserInfoSession.empty();
  }

  @override
  Map<String, dynamic> toMap(UserInfoSession object) {
    return {};
  }
}


