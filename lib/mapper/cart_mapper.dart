


import 'package:clean_data/base/architechture.dart';
import '../model/cart.dart';



class CartStoreMapper extends CleanMapper<CartStore> {
  @override
    CartStore fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return CartStore(id:map["id"], image:map["image"], name:map["name"], address: map["address"], phone:map["phone"], mobile:map["mobile"], delivery_fee: map["delivery_fee"], product_count: map["product_count"]);
    }
    @override
    Map<String, dynamic> toMap(CartStore object) {
    // TODO: implement toMap
    return {};
    }
}
class CartStoreItemMapper extends CleanMapper<CartStoreItem> {
  @override
    CartStoreItem fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return CartStoreItem(id:map["id"], user_id:map["user_id"], store_id:map["store_id"], product_id:map["product_id"], quantity:map["quantity"], created_at:map["created_at"], updated_at:map["updated_at"], image:map["image"], name: map["name"], weight_size: map["weight_size"], stock_count: map["stock_count"], price:map["price"], discounted_price:map["discounted_price"], description:map["description"], featured: int.parse(map["featured"].toString()), category: map["category"], deliverable: int.parse(map["deliverable"]));
    }
    @override
    Map<String, dynamic> toMap(CartStoreItem object) {
    // TODO: implement toMap
    return {};
    }
}


class CartMapper extends CleanMapper<Cart>{
   @override
    Cart fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return Cart(id:map["id"], description:map["description"], ownerUUID:map["ownerUUID"], totalAmount: map["totalAmount"], orderStatus:map["orderStatus"]);
    }
    @override
    Map<String, dynamic> toMap(Cart object) {
    // TODO: implement toMap
      return {"id":object.id, "desc":object.description, "ownerUUID":object.ownerUUID, "totalAmount":object.totalAmount, "orderStatus":object.orderStatus};
    }
}

class CartItemMapper extends CleanMapper<CartItem>{
   @override
    CartItem fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return CartItem(id:map["id"], description:map["description"], prodId: map["prodId"], cartUUID: map["cartUUID"], storeUUID: map["storeUUID"], quantity:map["quantity"], amount:map["amount"], orderStatus: map["orderStatus"], updatedAt: map["updatedAt"]);
    }
    @override
    Map<String, dynamic> toMap(CartItem object) {
    // TODO: implement toMap
      return {"id":object.id, "desc":object.description, "prodId":object.prodId, "cartUUID":object.cartUUID, "storeUUID":object.storeUUID, "quantity":object.quantity, "amount":object.amount, "orderStatus":object.orderStatus};
    }
}