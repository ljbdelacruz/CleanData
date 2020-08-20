



import 'package:clean_data/base/architechture.dart';

class MStoreTransaction extends CleanModel{
  String transaction_code;
  String customer_image;
  String customer_name;
  String customer_mobile;
  String customer_address;
  String customer_latitude;
  String customer_longitude;
  int products;
  String status;
  String rider_image;
  String rider_name;
  String rider_mobile;
  String delivery_address;
  String delivery_latitude;
  String delivery_longitude;
  String delivery_fee;
  String payment_type;
  String admin_commission;

  //TODO: rider

  MStoreTransaction({this.transaction_code, this.customer_image, this.customer_name, this.customer_mobile, this.customer_address, this.customer_latitude, this.customer_longitude, this.products, this.status, this.rider_image="", this.rider_name="", this.rider_mobile="", this.delivery_address="", this.delivery_latitude="", this.delivery_longitude="", this.delivery_fee="", this.payment_type="", this.admin_commission=""});
}

class MStoreTransactionItem extends CleanModel{
  int product_id;
  String image;
  String name;
  int quantity;
  String price;
  String discounted_price;
  MStoreTransactionItem({this.product_id, this.image, this.name, this.quantity, this.price, this.discounted_price});
}


class MStoreTransactionContent extends CleanModel{
  MStoreTransaction details;
  List<MStoreTransactionItem> products = [];
  MStoreTransactionContent(this.details, this.products);
}


class UserTransaction extends CleanModel{
  String transaction_code;
  String store_image;
  String store_name;
  String store_mobile;
  String store_phone;
  String store_address;
  int products;
  String status;
  UserTransaction({this.transaction_code="", this.store_image="", this.store_name="", this.store_mobile="", this.store_phone="", this.store_address="", this.products = 0, this.status=""});
}