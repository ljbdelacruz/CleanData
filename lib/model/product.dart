




import 'package:clean_data/base/architechture.dart';

class Product extends CleanModel{
  int id;
  String image;
  String name;
  String weight_size;
  int stock_count;
  double price;
  double discounted_price;
  String description;
  int featured;
  String category;
  int deliverable;

  int store_id;
  String store_name;
  String store_admin_commission;
  String store_delivery_fee;
  int store_closed;
  String store_latitude;
  String store_longitude;



  Product(this.id, this.image, this.name, this.weight_size, this.stock_count, this.price, this.discounted_price, this.description, this.featured, this.category, this.deliverable);
  Product.optional({this.id=0, this.image="",this.name="", this.weight_size="", this.stock_count=0, this.price=0.0, this.discounted_price=0.0, this.description="", this.featured=0, this.category, this.deliverable=0, this.store_id=0, this.store_name="", this.store_admin_commission="", this.store_delivery_fee="", this.store_closed = 0, this.store_latitude="", this.store_longitude});
}

 