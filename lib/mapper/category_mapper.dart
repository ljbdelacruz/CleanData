


import 'package:clean_data/base/architechture.dart';
import '../model/category.dart';

class CategoryMapper extends CleanMapper<FoodyCategory>{
   @override
    FoodyCategory fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return FoodyCategory.ls(map["category_name"], map["category_image"]);
    }
    @override
    Map<String, dynamic> toMap(FoodyCategory object) {
    // TODO: implement toMap
      return {"id":object.id, "desc":object.description, "value":object.value, "categoryType":object.categoryType};
    }
}


