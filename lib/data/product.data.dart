


import 'package:clean_data/model/product.dart';

class ProductData{
  static ProductData instance = ProductData();
  List<Product> products = [];
  ProductData(){
    this.getProducts();
  }
  getProducts(){
    products.add(Product("1ee", "Cheese Burger", "Custom Made for keto diet", 200, "1ee", "1ee", 4, "Fastfood", "Fastfood", false, "http://www.pngall.com/wp-content/uploads/2016/03/Food-Free-Download-PNG.png", true, 0, 0));
    products.add(Product("1ee", "Cookies and Cream Ice Cream", "Made from natural ingredients", 200, "1ee", "1ee", 4, "Fastfood", "Fastfood", false, "http://www.pngall.com/wp-content/uploads/2016/03/Food-Free-Download-PNG.png", true, 0, 0));
  }
}