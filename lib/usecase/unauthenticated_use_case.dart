



import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/product.dart';
import 'package:clean_data/model/userstore.dart';

class UnauthenticatedUseCase extends CleanUseCase {
  final CleanRepository repository;
  UnauthenticatedUseCase(this.repository);

  Future<Product> fetchProductInfoByID(int id) async{
    return await repository.fetchProductInfoByID(id);
  }
  Future<LivingSmartStoreInfo> getListAllStoresProduct(int storeId) async{
    return await repository.getListAllStoresProduct(storeId);
  }
  Future<List<Product>> searchProductsAllStoreCategory(String category,String product) async{
    return await repository.searchProductsAllStoreCategory(category,product);
  }
  Future<List<Product>> searchStoreProducts(int storeID,String category,String product) async{
    return await repository.searchProductsStore(storeID,category,product);
  }
}