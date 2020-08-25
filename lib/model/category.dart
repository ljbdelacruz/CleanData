import 'package:clean_data/base/architechture.dart';

class FoodyCategory extends CleanModel{
  String id;
  String description;
  String value;
  String categoryType;
  String category_name;
  String category_image;

  FoodyCategory(this.id, this.description, this.value, this.categoryType);
  FoodyCategory.ls(this.category_name, this.category_image);
}