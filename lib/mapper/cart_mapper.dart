


import 'package:clean_data/base/architechture.dart';
import '../model/cart.dart';



class CartStoreMapper extends CleanMapper<CartStore> {
  @override
    CartStore fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      print(map.toString());
      return CartStore(id:map["id"], image:map["image"].toString(), name:map["name"].toString(), address: map["address"].toString(), phone:map["phone"].toString(), mobile:map["mobile"].toString(), delivery_fee: map["delivery_fee"].toString(), product_count: map["product_count"]);
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
      print(map.toString());
      try{
        return CartStoreItem(id:map["id"], quantity:map["quantity"], image:map["image"], name: map["name"], weight_size: map["weight_size"], price:map["price"], description:map["description"], category: map["category"]);
      }catch(e){
        print(e.toString());
      }
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