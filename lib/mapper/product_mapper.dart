


import 'package:clean_data/base/architechture.dart';
import '../model/product.dart';

class ProductMapper extends CleanMapper<Product>{
   @override
    Product fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return Product(map["id"], map["title"], map["description"], map["price"], map["ownerId"], map["storeId"], map["productReview"], map["category"], map["tags"], map["isAllowSubscription"], map["mainImage"], map["isAvailable"], map["longitude"], map["latitude"]);
    }
    @override
    Map<String, dynamic> toMap(Product object) {
    // TODO: implement toMap
      return {"id":object.id, "title":object.title, "description":object.description, "price":object.price, "ownerId":object.ownerId, "storeId":object.storeId, "productReview":object.productReview, "category":object.category, "tags":object.tags, "isAllowSubscription":object.isAllowSubscription, "mainImage":object.mainImage, "isAvailable":object.isAvailable, "longitude":object.longitude, "latitude":object.latitude};
    }
}