




import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/user_session.dart';

class UserStore extends CleanModel {
  String id;
  String ownerUUID;
  String storeName;
  String storeLogo;
  double storeReview;
  String updatedAt;
  double longitude;
  double latitude;

  UserSession ownerData;

  UserStore(this.id, this.ownerUUID, this.storeName, this.storeLogo, this.storeReview, this.updatedAt, this.longitude, this.latitude);
}