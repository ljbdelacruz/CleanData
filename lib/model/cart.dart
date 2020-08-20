import 'package:clean_data/base/architechture.dart';

class CartStore extends CleanModel{
  int id;
  String image;
  String name;
  String address;
  String phone;
  String mobile;
  String delivery_fee;
  int product_count;
  CartStore({this.id = 0, this.image = "", this.name = "", this.address = "", this.phone="", this.mobile = "", this.delivery_fee = "", this.product_count = 0});

}

class CartStoreItem extends CleanModel{
  int id;
  int user_id;
  int store_id;
  int product_id;
  int quantity;
  String created_at;
  String updated_at;
  String image;
  String name;
  String weight_size;
  int stock_count;
  String price;
  String discounted_price;
  String description;
  int featured;
  String category;
  int deliverable;
  CartStoreItem({this.id=0, this.user_id=0, this.store_id=0, this.product_id=0, this.quantity=0, this.created_at="", this.updated_at="", this.image="", this.name="", this.weight_size="", this.stock_count=0, this.price="", this.discounted_price="0.00", this.description="", this.featured=0, this.category="", this.deliverable=0});
}



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

