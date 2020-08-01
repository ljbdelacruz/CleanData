




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
  Product(this.id, this.image, this.name, this.weight_size, this.stock_count, this.price, this.discounted_price, this.description, this.featured, this.category, this.deliverable);
  Product.optional({this.id=0, this.image="",this.name="", this.weight_size="", this.stock_count=0, this.price=0.0, this.discounted_price=0.0, this.description="", this.featured=0, this.category, this.deliverable=0});
}

 