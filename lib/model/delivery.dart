



import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/product.dart';

class RiderDelivery extends CleanModel{
  String transaction_code;
  int store_id;
  String store_image;
  String store_name;
  String store_phone;
  String store_mobile;
  String store_address;
  String store_latitude;
  String store_longitude;
  String store_delivery_fee;
  int customer_id;
  String customer_image;
  String customer_name;
  String customer_mobile;
  String customer_address;
  String customer_latitude;
  String customer_longitude;
  int products;
  String status;

  RiderDelivery({this.transaction_code="", this.store_id=0, this.store_image="", this.store_name="", this.store_phone="", this.store_mobile="", this.store_address="", this.store_latitude="", this.store_longitude="", this.store_delivery_fee="", this.customer_id=0, this.customer_image="", this.customer_name="", this.customer_mobile="", this.customer_address="", this.customer_latitude="", this.customer_longitude="", this.products=0, this.status=""});
  
}


class RiderCurrentDelivery extends CleanModel{
  String transaction_code;
  String status;
  RiderCurrentDelivery({this.transaction_code="", this.status=""});
}

class RiderCurrentDeliveryInfo extends CleanModel{
  RiderDelivery details;
  List<Product> products = [];
  RiderCurrentDeliveryInfo({this.details, this.products});
}