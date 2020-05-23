import '../architechture.dart';

class Cart extends CleanModel{
  String id;
  String description;
  String ownerUUID;
  double totalAmount;
  int orderStatus;
  Cart({this.id, this.description, this.ownerUUID, this.totalAmount, this.orderStatus});
}
class CartItem extends CleanModel{
  String id;
  String description;
  String prodId;
  String cartUUID;
  String storeUUID;
  int quantity;
  double amount;
  String orderStatus;
  String updatedAt;
  CartItem({this.id, this.description, this.prodId, this.cartUUID, this.storeUUID, this.quantity, this.amount, this.orderStatus, this.updatedAt});
}

