




import 'dart:io';

import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/product.dart';
import 'package:clean_data/model/userstore.dart';
import 'package:clean_data/response/standard_response.dart';

class MStoreUseCase extends CleanUseCase {
  final CleanRepository repository;
  MStoreUseCase(this.repository);

  Future<List<Product>> getGlobalProducts() async{
    return await repository.getProductsGlobal();
  }
  Future<LivingSmartStoreInfo> getStoreInfo() async{
    return await repository.getStore();
  }
  Future<bool> addProduct(int productId) async{
    return await repository.addProductToStore(productId);
  }
  Future<bool> removeProductFromStore(int prodId)async{
    return await repository.productRemoveToStore(prodId);
  }
  Future<StandardResponse> uploadStoreFrontImage(File file) async{
    return await repository.uploadFrontImage(file);
  }
  Future<StandardResponse> updateStore(String name, String rate, String address, String description, String phone, String mobile, String information, String deliveryFee, String defaultTax, String latitude, String longitude, String closed, String delivery) async{
    var data = await repository.updateStore(name, rate, address, phone, description, mobile, information, deliveryFee, defaultTax, latitude, longitude, closed, delivery);
    return data;
  }
}