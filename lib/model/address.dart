




import 'package:clean_data/base/architechture.dart';

class LSAddress extends CleanModel{
  int id;
  String user_id;
  String address;
  String latitude;
  String longitude;
  String description;
  int isDefault;
  String created_at;
  String updated_at;
  LSAddress({this.id=0, this.user_id="", this.address="", this.latitude="", this.longitude="", this.description="", this.isDefault=0, this.created_at="", this.updated_at=""});
}