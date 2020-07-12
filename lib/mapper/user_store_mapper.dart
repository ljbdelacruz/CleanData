




import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/userstore.dart';

class UserStoreMapper extends CleanMapper<UserStore> {
  @override
  UserStore fromMap(Map<String, dynamic> map) {
    return UserStore(map["id"], map["ownerUUID"], map["storeName"], map["storeLogo"],  map["storeReview"], map["updatedAt"],  map["longitude"], map["latitude"]);
  }

  @override
  Map<String, dynamic> toMap(UserStore object) {
    // TODO: implement toMap
    return {"id":object.id, "ownerUUID":object.ownerUUID, "storeName":object.storeName, "storeLogo":object.storeLogo, "storeReview":object.storeReview, "updatedAt":object.updatedAt, "longitude":object.longitude, "latitude":object.latitude};
  }
}