




import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/mapper/product_mapper.dart';
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


class LivingSmartStoresInfoMapper extends CleanMapper<LivingSmartStoreInfo> { 
  LivingSmartStoresMapper livingSmartStoreMapper = new LivingSmartStoresMapper();
  ProductMapper productMapper = new ProductMapper();
  @override
  LivingSmartStoreInfo fromMap(Map<String, dynamic> map) {
    try{
      print("getStoreMap Data");
      print(map.toString());
      return LivingSmartStoreInfo(livingSmartStoreMapper.fromMap(map["store_info"]), productMapper.fromListMap(map["products"]));
    }catch(e){
      print("Error mapping from LivingSmartStoreInfo");
      print(e.toString());
      throw e;
    }
  }

  @override
  Map<String, dynamic> toMap(LivingSmartStoreInfo object) {
    // TODO: implement toMap
    return {};
  }
}


class LivingSmartStoresMapper extends CleanMapper<LivingSmartStores> { 
  @override
  LivingSmartStores fromMap(Map<String, dynamic> map) {
    try{
      print("getStoreMap Data");
      print(map.toString());
      return LivingSmartStores(id: int.parse(map["id"].toString()), image:map["image"].toString(), name:map["name"].toString(), description:map["description"].toString(), address:map["address"].toString(), phone:map["phone"].toString(), mobile:map["mobile"].toString());
    }catch(e){
      print("Error mapping from LivingSmartStore");
      print(e.toString());
      throw e;
    }
    // return LivingSmartStores(id:map["id"], image:map["image"], name:map["name"], rate:map["rate"], address:map["address"], description:map["description"], phone:map["phone"], mobile:map["mobile"], delivery_fee: map["delivery_fee"].toString(), admin_commission: map["admin_commission"], default_tax: map["default_tax"], closed: map["closed"], delivery: map["delivery"], user_id: map["user_id"], created_by: map["created_by"], created_at: map["created_at"], updated_at: map["updated_at"]);
  }

  @override
  Map<String, dynamic> toMap(LivingSmartStores object) {
    // TODO: implement toMap
    return {};
  }
}