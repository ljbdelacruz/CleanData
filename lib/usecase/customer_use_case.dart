





import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/cart.dart';
import 'package:clean_data/model/product.dart';
import 'package:clean_data/model/transactions.dart';
import 'package:clean_data/model/userstore.dart';
import 'package:clean_data/response/standard_response.dart';

import '../model/user_session.dart';

class CustomerUseCase extends CleanUseCase {
  final CleanRepository repository;
  CustomerUseCase(this.repository);
  
  Future<UserSession> execute(String email, String password) async {
    return await repository.login(email, password);
  }
  Future<UserSessionData> lsMobileLogin(String mobile, String password, bool remember_me, String device_token) async{
    return await repository.lsMobileLogin(mobile, password, remember_me, device_token);
  }

  Future<List<LivingSmartStores>> getStoresList() async{
    return await repository.getLStoreList();
  }
  Future<LivingSmartStores> getLStoreInfo(int id) async{
    return await repository.getLStoreInfo(id);
  }
  Future<List<Product>> getProductsGlobal() async{
    return await repository.getProductsGlobal();
  }

  //Cart
  Future<List<CartStore>> getCartStores() async{
    return await repository.getCartStores();
  }
  Future<List<CartStoreItem>> getCartStoreProducts(int storeId) async{
    return await repository.getCartStoreProducts(storeId);
  }
  Future<StandardResponse> addProductToCart(int storeId, int productId, int quantity) async{
    return await repository.addProductToCart(storeId, productId, quantity);
  }
  Future<StandardResponse> removeProductFromCart(int storeId, int productId) async{
    return await repository.removeProductFromCart(storeId, productId);
  }
  Future<StandardResponse> deleteCart(int storeId) async{
    return await repository.deleteCart(storeId);
  }
  Future<StandardResponse> checkoutCart(int storeId, int addressId, String payment_type) async{
    return await repository.checkoutCart(storeId, addressId, payment_type);
  }


  //Transactions
  Future<List<UserTransaction>> getTransactions() async{
    return await repository.getUserTransactions();
  }
  Future<MStoreTransactionContent> getTransactionContent(String transactionCode) async{
    return await repository.getUserTransactionContent(transactionCode);
  }
  Future<StandardResponse> cancelTransaction(String transCode, String reason) async{
    return await repository.cancelUserTransaction(transCode);
  }


}
