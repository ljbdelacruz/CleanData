import 'package:sembast/sembast.dart';
import '../mapper/category_mapper.dart';
import '../model/category.dart';
import 'db.dart';
class CategoryDb extends Db {
  CategoryDb(Database db) : super(db, stringMapStoreFactory.store("category"));
  CategoryMapper mapper = CategoryMapper();


  Stream<List<FoodyCategory>> getCategories(String category, int count){
    print("Extracting data from list");
    var query = store.query();
    return query.onSnapshots(db).map((snapshots) {
      return snapshots
          .map(
            (snapshot) {
              print(snapshot.value);
              return mapper.fromMap(snapshot.value);
            }
          )
          .toList();
    });
  }
  Future<void> saveList(List<dynamic> categories)async{
    await db.transaction((txn) async {
      var index = 0;
      for (Map<String, dynamic> category in categories) {
        await store.record(index.toString()).put(txn, category).then((value){
          print("Success saving");
        }).catchError((err){
          print(err.message);
        }).whenComplete((){
          print("Complete Saving");
        });
        index++;
      }
    });
  }
  Future<void> save(List<Map<String, dynamic>> categories) async {
    await store.records(categories[0]["id"]).put(db, categories).whenComplete((){
      print("Save Complete");
    });
  }
}




