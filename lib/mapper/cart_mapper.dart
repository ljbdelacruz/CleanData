


import '../architechture.dart';
import '../model/cart.dart';

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