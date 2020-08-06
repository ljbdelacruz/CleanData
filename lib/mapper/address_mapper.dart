


import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/address.dart';

class AddressMapper extends CleanMapper<LSAddress> {
  @override
    LSAddress fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return LSAddress(id:map["id"], user_id: map["user_id"].toString(), address: map["address"].toString(), latitude: map["latitude"].toString(), longitude: map["longitude"].toString(), description: map["description"].toString(), isDefault: map["isDefault"], created_at: map["created_at"].toString(), updated_at: map["updated_at"].toString());
    }
    @override
    Map<String, dynamic> toMap(LSAddress object) {
    // TODO: implement toMap
    return {};
    }
}