



import 'dart:convert';
import 'dart:io';

import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/config/constant.dart';
import 'package:clean_data/mapper/address_mapper.dart';
import 'package:clean_data/mapper/delivery_mapper.dart';
import 'package:clean_data/mapper/transactions_mapper.dart';
import 'package:clean_data/mapper/user_session_data_mapper.dart';
import 'package:clean_data/mapper/user_store_mapper.dart';
import 'package:clean_data/model/address.dart';
import 'package:clean_data/model/delivery.dart';
import 'package:clean_data/model/transactions.dart';
import 'package:clean_data/model/userstore.dart';
import 'package:clean_data/response/standard_response.dart';
import 'package:sembast/sembast.dart';
import '../db/category_db.dart';
import '../db/user_session_db.dart';
import '../mapper/cart_mapper.dart';
import '../mapper/category_mapper.dart';
import '../mapper/image_storage_mapper.dart';
import '../mapper/product_mapper.dart';
import '../mapper/user_session_mapper.dart';
import '../model/cart.dart';
import '../model/category.dart';
import '../model/image_storage.dart';
import '../model/product.dart';
import '../model/user_session.dart';
import '../rest_client.dart';

class CleanMainRepository extends CleanRepository {
    Database db;
    RestClient restClient;


    UserSessionMapper userSMapper= UserSessionMapper();
    UserSessionDataMapper userSDataMapper = UserSessionDataMapper();
    UserInfoSessionMapper userInfoSessionMapper = UserInfoSessionMapper();
    LivingSmartStoresMapper livingSmartStoreMapper = LivingSmartStoresMapper();
    ProductMapper productMapper= ProductMapper();
    LivingSmartStoresInfoMapper livingSmartStoresInfoMapper= LivingSmartStoresInfoMapper();
    AddressMapper addressMapper = AddressMapper();


    CategoryMapper categoryMapper = CategoryMapper();
    CartMapper cartMapper = CartMapper();
    CartStoreMapper cartStoreMapper = CartStoreMapper();
    CartItemMapper cartItemMapper = CartItemMapper();
    CartStoreItemMapper cartStoreItemMapper = CartStoreItemMapper();
    ImageStorageMapper imageStorageMapper = ImageStorageMapper();
    MStoreTransactionMapper mstoreTransMapper = MStoreTransactionMapper();
    MStoreTransactionContentMapper mstoreTransactionContentMapper = MStoreTransactionContentMapper();
    RiderDeliveryMapper riderDeliveryMapper = RiderDeliveryMapper();
    RiderCurrentDeliveryMapper riderCurrentDeliveryMapper= RiderCurrentDeliveryMapper();
    RiderCurrentDeliveryInfoMapper riderCurrentDeliveryInfoMapper=RiderCurrentDeliveryInfoMapper();
    UserTransactionMapper userTransMapper = UserTransactionMapper();

    /* -------------------------------- Databases ------------------------------- */
    UserSessionDb sessionDb;
    CategoryDb categoryDb;

    CleanMainRepository(this.db, this.restClient){
      this.sessionDb = UserSessionDb(this.db);
      this.categoryDb = CategoryDb(this.db);
    }


    @override
    Future<UserSessionData> lsLogin(String email, String password, remember_me) async{
      // TODO: implement getUserLogin
      var data=await restClient.lSmartLogin(email, password, remember_me);
      var response = userSDataMapper.fromMap(data.data);
      Constants.instance.session=response;
      return response;
    }
    @override
    Future<UserSessionData> lsMobileLogin(String mobile, String password, bool remember_me, String device_token) async{
      var data=await restClient.lsMobileLogin(mobile, password, remember_me, device_token);
      var response = userSDataMapper.fromMap(data.data);
      Constants.instance.session=response;
      return response;
    }

    @override
    Future<StandardResponse> lsRegister(String name, String email, String password, String rpass, String mobile) async{
      var data=await restClient.lSmartRegister(name, email, password, rpass, mobile);
      // var response = userInfoSessionMapper.fromMapRegister(data.data);
      return data;
    }
    Future<StandardResponse> logout()async{
      var data=await restClient.logout();
      return data.data;
    }
    Future<UserInfoSession> userInfo()async{
      var data=await restClient.userInfo();
      return userInfoSessionMapper.fromMap(data.data);
    }
    Future<StandardResponse> changePassword(String password, String password_confirmation) async {
      var data = await restClient.changePassword(password, password_confirmation);
      return data;
    }
    Future<StandardResponse> uploadUserImage(File image) async {
      var data = await restClient.uploadUserImage(image);
      return data;
    }
    Future<StandardResponse> forgotPasswordEmail(String email) async{
      var data = await restClient.forgotPasswordEmail(email);
      return data;
    }
    Future<StandardResponse> restPassword(String email, String password, String password_confirmation, int pin) async{
      var data = await restClient.restPassword(email, password, password_confirmation, pin);
      return data;
    }


  //Customer
  Future<LivingSmartStoreInfo> getStore() async{
      var data=await restClient.getStore();
      var storeInfo = livingSmartStoresInfoMapper.fromMap(data.data);
      return storeInfo;
  }
  Future<bool> addProductToStore(int addProductToStore)async{
      var data=await restClient.addProductToStore(addProductToStore);
      return data.success;
  }
  Future<bool> productRemoveToStore(int addProductToStore)async{
      var data=await restClient.productRemoveToStore(addProductToStore);
      return data.success;
  }
  Future<bool> storeUpdate(String name, String rate, String address, String phone, String mobile, String information, String delivery_fee, String default_tax, String latitude, String longitude, String closed, String delivery) async{
    var data=await restClient.storeUpdate(name, rate, address, phone, mobile, information, delivery_fee, default_tax, latitude, longitude, closed, delivery);
    return data.success;
  }
  Future<List<Product>> getProductsGlobal() async{
    var data = await restClient.getProductsGlobal();
    List<Product> products = [];
    data.data.forEach((product){
        products.add(productMapper.fromMap(product));
    });
    return products;
  }
  Future<List<LivingSmartStores>> getLStoreList() async {
    // TODO: implement getLStoreList
    var data=await restClient.getListAllStores();
    List<LivingSmartStores> stores = [];
    data.data.forEach((product){
        stores.add(livingSmartStoreMapper.fromMap(product));
    });
    return stores;
  }
  Future<LivingSmartStores> getLStoreInfo(int id) async{
    var data = await restClient.getProductByStoreId(id);
    var storeInfo = livingSmartStoreMapper.fromMap(data.data["store_info"]);
    storeInfo.products = [];
    data.data["products"].forEach((product){
      storeInfo.products.add(productMapper.fromMap(product));
    });
    return storeInfo;
  }
  //User Transaction
  Future<List<UserTransaction>> getUserTransactions() async{
    var data = await restClient.getUserTransactions();
    return userTransMapper.fromListMap(data.data);
  }
  Future<MStoreTransactionContent> getUserTransactionContent(String transCode) async{
    var data = await restClient.getUserTransactionContent(transCode);
    return mstoreTransactionContentMapper.fromMap(data.data);
  }
  Future<StandardResponse> cancelUserTransaction(String transCode) async{
    return await restClient.cancelUserTransaction(transCode);
  }


  //Cart
  Future<List<CartStore>> getCartStores() async{
    var data = await restClient.getStoresInCart();
    List<CartStore> stores= [];
    data.data.forEach((store){
      stores.add(cartStoreMapper.fromMap(store));
    });
    return stores;
  }
  Future<List<CartStoreItem>> getCartStoreProducts(int storeId) async{
    var data = await restClient.getStoreProductCart(storeId);
    List<CartStoreItem> products= [];
    print(data.data.toString());
    data.data.forEach((product){
      products.add(cartStoreItemMapper.fromMap(product));
    });
    return products;
  }
  Future<LivingSmartStoreInfo> getListAllStoresProduct(int storeId) async{
    var data = await restClient.getListAllStoresProduct(storeId);
    return livingSmartStoresInfoMapper.fromMap(data.data);
  }

  Future<Product> fetchProductInfoByID(int id) async{
    var data = await restClient.getProductInfoByID(id);
    return productMapper.fromMap(data.data);
  }

  Future<StandardResponse> addProductToCart(int storeId, int productId, int quantity) async{
    var data = await restClient.addProductToCart(storeId, productId, quantity);
    return data;
  }
  Future<StandardResponse> removeProductFromCart(int storeId, int productId) async{
    var data = await restClient.removeProductFromCart(storeId, productId);
    return data;
  }
  Future<StandardResponse> deleteCart(int storeId) async{
    var data = await restClient.deleteStoreCart(storeId);
    return data;
  }
  Future<StandardResponse> checkoutCart(int storeId, int addressId, String payment_type) async{
    var data = await restClient.checkoutCart(storeId, addressId, payment_type);
    return data;
  }

  //MStore
  Future<StandardResponse> uploadFrontImage(File file) async{
    var data = await restClient.uploadStoreFrontImage(file);
    return data;
  }
  Future<StandardResponse> updateStore(String name, String rate, String address, String description, String phone, String mobile, String information, String deliveryFee, String defaultTax, String latitude, String longitude, String closed, String delivery) async{
    var data = await restClient.storeUpdate(name, rate, address, phone, mobile, information, deliveryFee, defaultTax, latitude, longitude, closed, delivery);
    return data;
  }

  //Address
  Future<StandardResponse> addDeliveryAddress(String address, String lat, String lon, String desc, int isDefault) async{
    var data = await restClient.addDeliveryAddress(address, lat, lon, desc, isDefault);
    return data;
  } 
  Future<StandardResponse> updateDeliveryAddress(int addressId,String address, String lat, String lon, String desc, int isDefault) async{
    var data = await restClient.updateDeliveryAddress(addressId, address, lat, lon, desc, isDefault);
    return data;
  }
  Future<LSAddress> getCustomerAddressByID(int id) async{
    var data = await restClient.getCustomerAddressByID(id);
    return addressMapper.fromMap(data.data);
  }
  Future<LSAddress> getCustomerDefaultAddress() async{
    var data = await restClient.getCustomerDefaultAddress();
    return addressMapper.fromMap(data.data);
  }
  Future<List<LSAddress>> listCustomerAddresses() async{
    var data = await restClient.listCustomerAddresses();
    return addressMapper.fromListMap(data.data);
  }
  Future<StandardResponse> deleteCustomerAddress(int id) async{
    var data = await restClient.deleteCustomerAddress(id);
    return data;
  }

  Future<List<MStoreTransaction>> getTransactions() async{
    var data = await restClient.getTransactions();
    return mstoreTransMapper.fromListMap(data.data);
  }
  Future<MStoreTransactionContent> getTransactionContent(String transactionCode) async{
    var data = await restClient.getTransactionContent(transactionCode);
    return mstoreTransactionContentMapper.fromMap(data.data);
  }
  Future<StandardResponse> cancelTransaction(String transCode, String reason) async{
    var data = await restClient.cancelTransaction(transCode, reason);
    return data;
  }
  Future<StandardResponse> processTransaction(String transCode) async{
    var data = await restClient.processTransaction(transCode);
    return data;
  }
  Future<StandardResponse> readyForPickupTransaction(String transCode) async{
    var data = await restClient.readyForPickupTransaction(transCode);
    return data;
  }
  //Driver 
  Future<List<RiderDelivery>> listAvailableDeliveries() async{
    try{
      var data = await restClient.listAvailableDeliveries();
      print(data.data.toString());
      return riderDeliveryMapper.fromListMap(data.data);
    }catch(e){
      return [];
    }
  }
  Future<List<RiderDelivery>> listCompletedDeliveries() async{
    var data = await restClient.listCompletedDeliveries();
    return riderDeliveryMapper.fromListMap(data.data);
  }
  Future<RiderCurrentDelivery> listCurrentDelivery() async{
    var data = await restClient.listCurrentDelivery();
    return riderCurrentDeliveryMapper.fromMap(data.data);
  }
  Future<RiderCurrentDeliveryInfo> getRiderDeliveryDetails(String transCode) async{
    var data = await restClient.getRiderDeliveryDetails(transCode);
    print("getRiderDeliveryDetails endpoint");
    print(data.data.toString());
    return riderCurrentDeliveryInfoMapper.fromMap(data.data);
  }
  Future<StandardResponse> riderAcceptDelivery(String transCode, int store_id, int customerId) async{
    var data = await restClient.riderAcceptDelivery(transCode, store_id, customerId);
    return data;
  }
  Future<StandardResponse> triggerDelivered(String transCode) async{
    var data = await restClient.triggerDelivered(transCode);
    return data;
  }

   Future<List<Product>> searchProductsAllStoreCategory(String category,String product) async{
     var data = await restClient.searchProductsAllStoreCategory(category, product);
     return productMapper.fromListMap(data.data);
   }
    Future<List<Product>> searchProductsStore(int storeID,String category, String product) async{
      var data = await restClient.searchProductsStore(storeID, category, product);
       return productMapper.fromListMap(data.data);
    }

   Future<List<FoodyCategory>> getCategoriesList() async{
     var data = await restClient.getProductCategories();
     return categoryMapper.fromListMap(data.data);
   }






























    @override
    Future<UserSession> getUserLogin() {
      // TODO: implement getUserLogin
      return sessionDb.getCurrentSession();
    }
    @override
    Future<UserSession> fbLogin(String fbId, String firstname, String lastname) async {
      var data=await restClient.fbLogin(fbId, firstname, lastname);
      sessionDb.save(data.data);
      print("Returning user mapped");
      print(data.data.toString());
      return userSMapper.fromMap(data.data);
    }
    @override
    Future<UserSession> login(String email, String password) async {
      // TODO: implement login
      var data=await restClient.login(email, password);
      print("Auth client");
      print(data.data.toString());
      sessionDb.save(data.data);
      return userSMapper.fromMap(data.data);
    }
    @override
    Future<UserSession> userRegister(String firstName, String lastName, String email, String password)async{
      var data=await restClient.userRegister(firstName, lastName, email, password);
      return userSMapper.fromMap(data.data);
    }

    @override
    Future<List<FoodyCategory>> getCategoryType(String category) async {
      var data=await restClient.getCategoryType(type:category);
      return categoryMapper.fromListMap(data.data);
    }
    @override
    Future<FoodyCategory> newCategoryType(String desc, String categoryType, String value)async{
      var data=await restClient.newCategoryType(desc:desc, categoryType:categoryType, value:value);
      return categoryMapper.fromMap(data.data);
    }
    @override
    Future<Cart> newCart(String desc, String ownerId, String totalAmount)async{
      var data=await restClient.newCart(desc, ownerId, totalAmount);
      return cartMapper.fromMap(data.data);
    }
    @override
    Future<CartItem> newCartItem(String desc, String prodId, String cartUUID, String storeUUID, int quantity, double amount, int orderStatus)async{
        var data=await restClient.newCartItem(desc, prodId, cartUUID, storeUUID, quantity, amount, orderStatus);
        return cartItemMapper.fromMap(data.data);
    }
    @override
    Future<List<Cart>> getCartByOwnerId(String id)async{
        var data = await restClient.getCartByOwnerId(id);
        return cartMapper.fromListMap(data.data);
    }
    @override
    Future<List<CartItem>> getCartItemByCartId(String id)async{
        var data=await restClient.getCartItemByCartId(id);
        return cartItemMapper.fromListMap(data.data);
    }
    @override
    Future<Product> newProduct(String title, String description, double price, storeId, String category, mainImage)async{
        var data=await restClient.newProduct(title, description, price, storeId, category, mainImage);
        return productMapper.fromMap(data.data);
    }
    @override
    Future<List<Product>> getProductByCategory(String category)async{
      var data = await restClient.getProductByCategory(category);
      return productMapper.fromListMap(data.data);
    }
    @override
    Future<List<Product>> getProductByLocationCategory(String category, double radius, double long, double lat)async{
      var data = await restClient.getProductByLocationCategory(category, radius, long, lat);
      return productMapper.fromListMap(data.data);
    }
    @override
    Future<List<Product>> getProductByLocation(double radius, double long, double lat)async{
      var data = await restClient.getProductByLocation(radius, long, lat);
      return productMapper.fromListMap(data.data);
    }
    @override
    Future<List<Product>> getProductByStoreId(storeId)async{
      var data = await restClient.getProductByStoreId(storeId);
      return productMapper.fromListMap(data.data);
    }
    @override
    Future<List<Product>> getProductByReview(double review)async{
      var data = await restClient.getProductByReview(review);
      return productMapper.fromListMap(data.data);
    }
    @override
    Future<List<Product>> getProductByReviewPosition(String order)async{
      var data = await restClient.getProductByReviewPosition(order);
      return productMapper.fromListMap(data.data);
    }
    @override
    Future<List<Product>> searchTitleProductLocation(String text, double radius, double long, double lat)async{
      var data = await restClient.searchTitleProductLocation(text, radius, long, lat);
      return productMapper.fromListMap(data.data);
    }
    @override
    Future<List<Product>> updateProductByStoreId(double long, double lat)async{
      var data = await restClient.updateProductByStoreId(long, lat);
      return productMapper.fromListMap(data.data);
    }
    @override
    Future<Product> updateProductById(String id, String title, String desc, double price, String storeId, String category, String mainImage, bool isAllowSubscription, bool isAvailable, String tags)async{
      var data = await restClient.updateProductById(id, title, desc, price, storeId, category, mainImage, isAllowSubscription, isAvailable, tags);
      return productMapper.fromMap(data.data);
    }
    @override
    Future<List<ImageStorage>> getImageByOwnerIdType(String id, String type)async{
      var data = await restClient.getImageByOwnerIdType(id, type);
      return imageStorageMapper.fromListMap(data.data);
    }
    @override
    Future<ImageStorage> newImage(String src, String type, String ownerId)async{
      var data = await restClient.newImage(src, type, ownerId);
      return imageStorageMapper.fromMap(data.data);
    }
}