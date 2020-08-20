




import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/mapper/product_mapper.dart';
import 'package:clean_data/model/delivery.dart';

class RiderDeliveryMapper  extends CleanMapper<RiderDelivery> {
  @override
    RiderDelivery fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap

      try{
        String caddress = map["customer_address"] == null ? map["delivery_address"].toString() : map["customer_address"].toString();
        String clat = map["customer_latitude"] == null ? map["delivery_latitude"].toString() : map["customer_latitude"].toString();
        String clon = map["customer_longitude"] == null ? map["delivery_longitude"].toString() : map["customer_longitude"].toString();
        int products = map["products"] != null ? map["products"] : 0;
        int custID = map["customer_id"] != null ? map["customer_id"] : 0;
        int store_id = map["store_id"] != null ? map["store_id"] : 0;
        return RiderDelivery(transaction_code: map["transaction_code"].toString(), store_id: store_id, store_image: map["store_image"].toString(), store_name: map["store_name"].toString(), store_phone: map["store_phone"].toString(), store_mobile: map["store_mobile"].toString(), store_address:map["store_address"].toString(), store_latitude: map["store_latitude"].toString(), store_longitude: map["store_longitude"].toString(), store_delivery_fee: map["store_delivery_fee"].toString(), customer_id: custID, customer_name: map["customer_name"].toString(), customer_mobile: map["customer_mobile"].toString(), customer_address: caddress, customer_latitude: clat, customer_longitude: clon, products:products, status: map["status"].toString());
      }catch(e){
        print(e.toString());
      }
    }
    @override
    Map<String, dynamic> toMap(RiderDelivery object) {
    // TODO: implement toMap
    return {};
    }
}

class RiderCurrentDeliveryMapper  extends CleanMapper<RiderCurrentDelivery> {
  @override
    RiderCurrentDelivery fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return RiderCurrentDelivery(transaction_code: map["transaction_code"].toString(), status: map["status"].toString());
    }
    @override
    Map<String, dynamic> toMap(RiderCurrentDelivery object) {
    // TODO: implement toMap
    return {};
    }
}

class RiderCurrentDeliveryInfoMapper extends CleanMapper<RiderCurrentDeliveryInfo> {
    RiderDeliveryMapper riderDeliveryMapper = RiderDeliveryMapper();
    ProductMapper productMapper = ProductMapper();

    @override
    RiderCurrentDeliveryInfo fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return RiderCurrentDeliveryInfo(details:riderDeliveryMapper.fromMap(map["details"]), products:productMapper.fromListMap(map["products"]));
    }
    @override
    Map<String, dynamic> toMap(RiderCurrentDeliveryInfo object) {
    // TODO: implement toMap
    return {};
    }
}

