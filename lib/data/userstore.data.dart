

import 'package:clean_data/model/userstore.dart';

class UserStoreData{
  static UserStoreData instance = UserStoreData();
  List<UserStore> stores = [];
  UserStoreData(){
    this.getStoreList();
  }

  getStoreList(){
    stores.add(UserStore("1ee", "1ee", "Marias Kitchen", "https://nerdreactor.com/wp-content/uploads/2017/09/490bcbdfb730adb3dbcf33cd9301622e-thor-avengers-loki-thor.jpg", 4, "12-05-2020", 0, 0));
    stores.add(UserStore("2ee", "2ee", "Living Water", "https://nerdreactor.com/wp-content/uploads/2017/09/490bcbdfb730adb3dbcf33cd9301622e-thor-avengers-loki-thor.jpg", 4, "12-05-2020", 0, 0));
  }
}