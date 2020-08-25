


import 'package:clean_data/base/architechture.dart';
import '../model/product.dart';

class ProductMapper extends CleanMapper<Product>{
   @override
    Product fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      try{
        var storeID = map["store_id"] != null ? map["store_id"] : 0;
        var storeClosed = map["store_closed"] != null ? map["store_closed"] : 0;
        var stockCount = map["stock_count"] != null ? map["stock_count"] : 0;

        return Product.optional(id: map["id"], image: map["image"].toString(), name:map["name"].toString(), weight_size:map["weight_size"].toString(), description:map["description"].toString(), price: double.parse(map["price"]), store_id:storeID, store_closed: storeClosed, store_name: map["store_name"].toString(), store_admin_commission: map["store_admin_commission"].toString(), store_delivery_fee: map["store_delivery_fee"].toString(), store_latitude: map["store_latitude"].toString(), store_longitude:map["store_longitude"].toString(), stock_count: stockCount);
      }catch(e){
        print("Error mapping from Product");
        print(e.toString());
        throw e;
      }
    }
    @override
    Map<String, dynamic> toMap(Product object) {
    // TODO: implement toMap
      return {};
    }
}