

import 'package:clean_data/model/deliveryactivity.dart';

class DeliveryActivityData{
  static DeliveryActivityData instance =DeliveryActivityData();
  List<DeliveryActivity> activities = [];
  DeliveryActivityData();
  getList(){
    var item=DeliveryActivity("1ee", "1ee", "Marias Kitchen", "Out for Delivery", 0.6, 2);
    item.image=setActivityImage(2);
    activities.add(item);
    var item1=DeliveryActivity("2ee", "2ee", "Jollibee Bonifacio Stop Over", "Preparing order", 0.3, 1);
    item1.image=setActivityImage(1);
    activities.add(item1);
  }

  String setActivityImage(int status){
    switch(status){
      case 0:
        return "assets/images/request.png";
      case 1:
        return "assets/images/prepare.png";
      case 2:
        return "assets/images/delivery.png";
      case 3:
        return "assets/images/success.png";
      default:
        return "assets/images/cancelled.png";
    }
  }


}