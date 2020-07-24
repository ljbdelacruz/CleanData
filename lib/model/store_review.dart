




import 'package:clean_data/base/architechture.dart';

class StoreReview extends CleanModel{
  String id;
  String userImage;
  String userName;
  String storeName;
  String storeImage;
  double review;
  String description;
  String date;
  StoreReview(this.id, this.userImage, this.userName, this.storeName, this.storeImage, this.review, this.description, this.date);
}