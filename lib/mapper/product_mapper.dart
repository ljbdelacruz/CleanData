


import 'package:clean_data/base/architechture.dart';
import '../model/product.dart';

class ProductMapper extends CleanMapper<Product>{
   @override
    Product fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      try{
        print(map.toString());
        return Product.optional(id: int.parse(map["id"].toString()), image: map["image"].toString(), name:map["name"].toString(), weight_size:map["weight_size"].toString(), description:map["description"].toString(), stock_count: int.parse(map["stock_count"].toString()), price: double.parse(map["price"]));
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