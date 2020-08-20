





import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/address.dart';
import 'package:clean_data/model/transactions.dart';

class MStoreTransactionMapper extends CleanMapper<MStoreTransaction> {
  @override
    MStoreTransaction fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      String status = map["status"] == null ? map["transaction_status"].toString() : map["status"].toString();
      return MStoreTransaction(transaction_code:map["transaction_code"].toString(), customer_image:map["customer_image"].toString(), customer_name:map["customer_name"].toString(), customer_mobile:map["customer_mobile"].toString(), customer_address:map["customer_address"].toString(), customer_latitude:map["customer_latitude"].toString(), customer_longitude:map["customer_longitude"].toString(), products:map["products"], status:status, rider_image:map["rider_image"].toString(), rider_name:map["rider_name"].toString(), rider_mobile:map["rider_mobile"].toString(), delivery_address: map["delivery_address"].toString(), delivery_latitude: map["delivery_latitude"].toString(), delivery_longitude: map["delivery_longitude"].toString(), delivery_fee: map["delivery_fee"].toString(), payment_type: map["payment_type"].toString(), admin_commission: map["admin_commission"].toString());
    }
    @override
    Map<String, dynamic> toMap(MStoreTransaction object) {
    // TODO: implement toMap
    return {};
    }
}

class MStoreTransactionItemMapper extends CleanMapper<MStoreTransactionItem> {
  @override
    MStoreTransactionItem fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return MStoreTransactionItem(product_id: map["product_id"], image:map["image"].toString(), name:map["name"].toString(), quantity:map["quantity"], price:map["price"].toString(), discounted_price: map["discounted_price"].toString());
    }
    @override
    Map<String, dynamic> toMap(MStoreTransactionItem object) {
    // TODO: implement toMap
    return {};
    }
}

class MStoreTransactionContentMapper extends CleanMapper<MStoreTransactionContent> {
  MStoreTransactionItemMapper mstoreItemMapper = new MStoreTransactionItemMapper();
  MStoreTransactionMapper mstoreTransMapper = new MStoreTransactionMapper();
  @override
    MStoreTransactionContent fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return MStoreTransactionContent(mstoreTransMapper.fromMap(map["details"]), mstoreItemMapper.fromListMap(map["products"]));
    }
    @override
    Map<String, dynamic> toMap(MStoreTransactionContent object) {
    // TODO: implement toMap
    return {};
    }
}

class UserTransactionMapper extends CleanMapper<UserTransaction> {
  @override
  UserTransaction fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      var prod = map["products"] != null ? map["products"] : 0;
      return UserTransaction(transaction_code: map["transaction_code"].toString(), store_image: map["store_image"].toString(), store_name: map["store_name"].toString(), store_mobile: map["store_mobile"].toString(), store_phone: map["store_phone"].toString(), store_address: map["store_address"].toString() ,products:prod, status:map["status"].toString());
  }
  
  @override
  Map<String, dynamic> toMap(UserTransaction object) {
    // TODO: implement toMap
    return {};
  }

}


