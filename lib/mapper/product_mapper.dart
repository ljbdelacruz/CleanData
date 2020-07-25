


import 'package:clean_data/base/architechture.dart';
import '../model/product.dart';

class ProductMapper extends CleanMapper<Product>{
   @override
    Product fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return Product(id:map["id"], image:map["image"].toString(), name:map["name"].toString());
    }
    @override
    Map<String, dynamic> toMap(Product object) {
    // TODO: implement toMap
      return {};
    }
}