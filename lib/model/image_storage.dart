


import 'package:clean_data/base/architechture.dart';

class ImageStorage extends CleanModel{
  String id;
  String source;
  String type;
  String ownerId;
  ImageStorage(this.id, this.source, this.type, this.ownerId);
}