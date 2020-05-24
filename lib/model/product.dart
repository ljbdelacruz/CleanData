




import 'package:clean_data/base/architechture.dart';

class Product extends CleanModel{
  String id;
  String title;
  String description;
  double price;
  String ownerId;
  String storeId;
  double productReview;
  String category;
  String tags;
  bool isAllowSubscription;
  String mainImage;
  bool isAvailable;
  double longitude;
  double latitude;
  Product(this.id, this.title, this.description, this.price, this.ownerId, this.storeId, this.productReview, this.category, this.tags, this.isAllowSubscription, this.mainImage, this.isAvailable, this.longitude, this.latitude);
}