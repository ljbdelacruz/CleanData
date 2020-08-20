




import 'dart:async';
import 'dart:io';

import 'package:clean_data/model/address.dart';
import 'package:clean_data/model/cart.dart';
import 'package:clean_data/model/category.dart';
import 'package:clean_data/model/delivery.dart';
import 'package:clean_data/model/image_storage.dart';
import 'package:clean_data/model/product.dart';
import 'package:clean_data/model/transactions.dart';
import 'package:clean_data/model/user_session.dart';
import 'package:clean_data/model/userstore.dart';
import 'package:clean_data/response/standard_response.dart';
import 'package:flutter/widgets.dart';

abstract class CleanUseCase {}

abstract class CleanMapper<T extends CleanModel> {
  Map<String, dynamic> toMap(T object);
  T fromMap(Map<String, dynamic> map);
  List<T> fromListMap(List<dynamic> listMap) {
    List<T> list = [];
    listMap.forEach((object) {
      list.add(fromMap(object));
    });
    return list;
  }
}


abstract class CleanModel {}

abstract class CleanPage extends StatefulWidget {
  @override
  CleanPageState createState();
}

abstract class CleanPageState<P extends CleanPresenter>
    extends State<CleanPage> with TickerProviderStateMixin {
  P presenter;

  P createPresenter();

  @override
  void initState() {
    presenter = createPresenter();
    super.initState();
    presenter.onViewInit();
  }

  @override
  void dispose() {
    presenter.dispose();
    super.dispose();
  }
}

abstract class CleanPresenter {
  CleanPageState cleanPageState;
  BuildContext get context => cleanPageState.context;
  CleanPresenter(this.cleanPageState);
  List<StreamController> get streamControllers;
  void onViewInit();
  //Dispose all stream controllers
  void dispose() {
    streamControllers?.map((disposable) {
      disposable.close();
    });
  }

  // @deprecated
  void notify() {
    cleanPageState.setState(() {
      cleanPageState.presenter = this;
    });
  }
}

abstract class CleanRepository {
  Future<UserSessionData> lsLogin(String email, String password, remember_me);
  Future<StandardResponse> lsRegister(String name, String email, String password, String rpass, String mobile);
  Future<UserSessionData> lsMobileLogin(String mobile, String password, bool remember_me);
  Future<StandardResponse> logout();
  Future<UserInfoSession> userInfo();
  Future<LivingSmartStoreInfo> getStore();
  Future<StandardResponse> changePassword(String password, String password_confirmation);
  Future<StandardResponse> uploadUserImage(File image);
  Future<StandardResponse> forgotPasswordEmail(String email);
  Future<StandardResponse> restPassword(String email, String password, String password_confirmation, int pin);


  Future<bool> addProductToStore(int product_id);
  Future<bool> productRemoveToStore(int product_id);
  Future<bool> storeUpdate(String name, String rate, String address, String phone, String mobile, String information, String delivery_fee, String default_tax, String latitude, String longitude, String closed, String delivery);

  //MStore
  Future<List<Product>> getProductsGlobal();




  //Customer
  Future<List<LivingSmartStores>> getLStoreList();
  Future<LivingSmartStores> getLStoreInfo(int id);
  Future<UserSession> login(String email, String password);
  Future<UserSession> fbLogin(String fbId, String firstname, String lastname);
  Future<UserSession> userRegister(String firstName, String lastName, String email, String password);
  Future<UserSession> getUserLogin();
  //Cart
  Future<List<CartStore>> getCartStores();
  Future<List<CartStoreItem>> getCartStoreProducts(int storeId);
  Future<StandardResponse> addProductToCart(int storeId, int productId, int quantity);
  Future<StandardResponse> removeProductFromCart(int storeId, int productId);
  Future<StandardResponse> deleteCart(int storeId);
  Future<StandardResponse> checkoutCart(int storeId, int productId, String payment_type);


  //Unauthenticated
  Future<Product> fetchProductInfoByID(int id);
  Future<LivingSmartStoreInfo> getListAllStoresProduct(int storeId);

  //Address
  Future<StandardResponse> addDeliveryAddress(String address, String lat, String lon, String desc, int isDefault);
  Future<StandardResponse> updateDeliveryAddress(int addressId,String address, String lat, String lon, String desc, int isDefault);
  Future<LSAddress> getCustomerAddressByID(int id);
  Future<LSAddress> getCustomerDefaultAddress();
  Future<List<LSAddress>> listCustomerAddresses();
  Future<StandardResponse> deleteCustomerAddress(int id);

  //Transactions
  Future<List<MStoreTransaction>> getTransactions();
  Future<MStoreTransactionContent> getTransactionContent(String transactionCode);
  Future<StandardResponse> cancelTransaction(String transCode, String reason);
  Future<StandardResponse> processTransaction(String transCode);
  Future<StandardResponse> readyForPickupTransaction(String transCode);


  //MCS Rider Transaction
  Future<List<RiderDelivery>> listAvailableDeliveries();
  Future<List<RiderDelivery>> listCompletedDeliveries();
  Future<RiderCurrentDelivery> listCurrentDelivery();
  Future<RiderCurrentDeliveryInfo> getRiderDeliveryDetails(String transCode);
  Future<StandardResponse> riderAcceptDelivery(String transCode, int store_id, int customerId);
  Future<StandardResponse> triggerDelivered(String transCode);


  


  Future<List<FoodyCategory>> getCategoryType(String category);
  Future<FoodyCategory> newCategoryType(String desc, String categoryType, String value);

  Future<Cart> newCart(String desc, String ownerId, String totalAmount);
  Future<CartItem> newCartItem(String desc, String prodId, String cartUUID, String storeUUID, int quantity, double amount, int orderStatus);
  Future<List<Cart>> getCartByOwnerId(String id);
  Future<List<CartItem>> getCartItemByCartId(String id);

  Future<Product> newProduct(String title, String description, double price, storeId, String category, mainImage);
  Future<List<Product>> getProductByCategory(String category);
  Future<List<Product>> getProductByLocationCategory(String category, double radius, double long, double lat);
  Future<List<Product>> getProductByLocation(double radius, double long, double lat);
  Future<List<Product>> getProductByStoreId(storeId);
  Future<List<Product>> getProductByReview(double review);
  Future<List<Product>> getProductByReviewPosition(String order);
  Future<List<Product>> searchTitleProductLocation(String text, double radius, double long, double lat);
  Future<List<Product>> updateProductByStoreId(double long, double lat);
  Future<Product> updateProductById(String id, String title, String desc, double price, String storeId, String category, String mainImage, bool isAllowSubscription, bool isAvailable, String tags);

  Future<List<ImageStorage>> getImageByOwnerIdType(String id, String type);
  Future<ImageStorage> newImage(String src, String type, String ownerId);


  //MStore
  Future<StandardResponse> uploadFrontImage(File file);
  Future<StandardResponse> updateStore(String name, String rate, String address, String description, String phone, String mobile, String information, String deliveryFee, String defaultTax, String latitude, String longitude, String closed, String delivery);

  //User Transaction
  Future<List<UserTransaction>> getUserTransactions();
  Future<MStoreTransactionContent> getUserTransactionContent(String transCode);
  Future<StandardResponse> cancelUserTransaction(String transCode);

}






