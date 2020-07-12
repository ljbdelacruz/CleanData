



import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/deliveryactivity.dart';

class DeliveryActivityMapper extends CleanMapper<DeliveryActivity>{
  @override
  DeliveryActivity fromMap(Map<String, dynamic> map) {
    return DeliveryActivity(map["id"], map["storeUUID"], map["title"], map["subtitle"], map["activityProgress"], map["activityStatus"]);
  }
  @override
  Map<String, dynamic> toMap(DeliveryActivity object) {
    return {};
  }
}