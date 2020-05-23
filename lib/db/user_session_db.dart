import 'package:sembast/sembast.dart';
import 'package:sembast/utils/value_utils.dart';
import '../mapper/user_session_mapper.dart';
import '../model/user_session.dart';
import 'db.dart';
class UserSessionDb extends Db {
  UserSessionDb(Database db) : super(db, stringMapStoreFactory.store("user_session"));
  RecordRef get currentSessionRecord => store.record("main");

  UserSessionMapper mapper = UserSessionMapper();
  Future<UserSession> getCurrentSession() async {
    Map<String, dynamic> value = await currentSessionRecord.get(db) as Map;
    return mapper.fromMap(cloneMap(value));
  }
  Future<void> save(Map<String, dynamic> userSession) async {
    await currentSessionRecord.put(db, userSession);
  }
}




