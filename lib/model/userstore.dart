




import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/product.dart';
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

class LivingSmartStoreInfo extends CleanModel{
  LivingSmartStores store_info;
  List<Product> products = [];
  LivingSmartStoreInfo(this.store_info, this.products);
}



class LivingSmartStores extends CleanModel {
  int id;
  String image;
  String name;
  String rate;
  String address;
  String description;
  String phone;
  String mobile;
  String information;
  String delivery_fee;
  String admin_commission;
  String default_tax;
  String latitude;
  String longitude;
  int closed;
  int delivery;
  int user_id;
  int created_by;
  String created_at;
  String updated_at;
  List<Product> products = [];

  LivingSmartStores({this.id=0, this.image="", this.name="", this.rate="", this.address="", this.description="", this.phone="", this.mobile="", this.information="", this.delivery_fee="", this.admin_commission="", this.default_tax="", this.longitude = "", this.latitude = "", this.closed = 0, this.delivery=0, this.user_id=0, this.created_by=0, this.created_at="", this.updated_at=""});

}