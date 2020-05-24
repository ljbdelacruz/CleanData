


import 'package:clean_data/base/architechture.dart';
import '../model/image_storage.dart';

class ImageStorageMapper extends CleanMapper<ImageStorage>{
   @override
    ImageStorage fromMap(Map<String,dynamic> map) {
      // TODO: implement fromMap
      return ImageStorage(map["id"], map["source"], map["type"], map["ownerId"]);
    }
    @override
    Map<String, dynamic> toMap(ImageStorage object) {
    // TODO: implement toMap
      return {"id":object.id, "source":object.source, "type":object.type, "ownerId":object.ownerId};
    }
}
