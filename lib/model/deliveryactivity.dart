


import 'package:clean_data/base/architechture.dart';

class DeliveryActivity extends CleanModel{
  String id;
  String storeUUID;
  String title;
  String subtitle;
  double activityProgress;
  int activityStatus;
  String image;
  DeliveryActivity(this.id, this.storeUUID, this.title, this.subtitle, this.activityProgress, this.activityStatus);
}