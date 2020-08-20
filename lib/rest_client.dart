import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:clean_data/config/constant.dart';
import 'package:dio/dio.dart';

import 'response/standard_response.dart';


class RestClient {
  Dio _dio;
  RestClient(this._dio);
  bool hasToken() {
    return _dio.options.headers.containsKey("Authorization");
  }
    //TODO: Authentication
    Future<StandardResponse> lSmartLogin(String email, String password, bool remember_me) async {
      Response response = await _dio.post("/login", data: {
        "email": email,
        "password": password,
        "remember_me":remember_me
      });
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> lsMobileLogin(String mobile, String password, bool remember_me) async{
      Response response = await _dio.post("/login/mobile", data: {
        "mobile": mobile,
        "password": password,
        "remember_me":remember_me
      });
      return StandardResponse.fromJson(response.data);
    }


    Future<StandardResponse> lSmartRegister(String name, String email, String password, String rpass, String mobile) async {
      Response response = await _dio.post("/register", data: {
        "name":name,
        "email": email,
        "password": password,
        "mobile": mobile,
        "password_confirmation": rpass
      });
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> logout() async {
      Response response = await _dio.get("/logout");
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> userInfo() async {
      Response response = await _dio.get("/user/info");
      return StandardResponse.fromJson(response.data);
    }

    Future<StandardResponse> forgotPasswordEmail(String email) async{
      Response response = await _dio.post("/password/forgot", data:jsonEncode({"email":email}));
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> restPassword(String email, String password, String password_confirmation, int pin) async{
      Response response = await _dio.post("/password/reset", data:jsonEncode({
        "email":email,
        "password":password,
        "password_confirmation":password_confirmation,
        "pin":pin
      }));
      return StandardResponse.fromJson(response.data);
    }
    
    Future<StandardResponse> changePassword(String password, String password_confirmation) async {
      Response response = await _dio.post("/user/password", data:jsonEncode({
        "password":password,
        "password_confirmation":password_confirmation
      }));
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> uploadUserImage(File image) async {
      MultipartFile imageMF = await MultipartFile.fromFile(image.path);
      var data = FormData.fromMap({
        "image": imageMF,
      });
      Response response = await _dio.post("/user/image", data: data);
      return StandardResponse.fromJson(response.data);
    }




    //TODO: MStore
    Future<StandardResponse> getStore() async {
      Response response = await _dio.get("/store");
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> loadEditStore() async {
      Response response = await _dio.get("/store/edit");
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> addProductToStore(int product_id) async {
      Response response = await _dio.post("/store/add", data: {
        "product_id":product_id,
      });
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> productRemoveToStore(int product_id) async {
      Response response = await _dio.delete("/store/remove", data: {
        "product_id":product_id,
      });
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> storeUpdate(String name, String rate, String address, String phone, String mobile, String information, String delivery_fee, String default_tax, String latitude, String longitude, String closed, String delivery) async {
      Response response = await _dio.delete("/store/update", data: {
        "name":name,
        "rate":rate,
        "address":address,
        "phone":phone,
        "mobile":mobile,
        "information":information,
        "delivery_fee":delivery_fee,
        "default_tax":default_tax,
        "latitude":latitude,
        "longitude":longitude,
        "closed":closed,
        "delivery":delivery
      });
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> getProductsGlobal() async {
      Response response = await _dio.get("/global/products");
      return StandardResponse.fromJson(response.data);
    }

    Future<StandardResponse> uploadStoreFrontImage(File image) async {
      MultipartFile imageMF = await MultipartFile.fromFile(image.path);
      var data = FormData.fromMap({
        "image": imageMF,
      });
      Response response = await _dio.post("/store/image", data: data);
      return StandardResponse.fromJson(response.data);
    }


    //TODO: CUSTOMER
    Future<StandardResponse> getListAllStores() async {
      Response response = await _dio.get("/stores/list");
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> getListAllStoresProduct(int storeId) async {
      Response response = await _dio.get("/store/"+storeId.toString());
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> getProductInfoByID(int id) async{
      Response response = await _dio.get("/product/"+id.toString());
      return StandardResponse.fromJson(response.data);
    }

      //Cart
    Future<StandardResponse> getStoreProductCart(int storeId) async {
      Response response = await _dio.get("/cart/store/"+storeId.toString());
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> getStoresInCart() async {
      Response response = await _dio.get("/cart/stores");
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> addProductToCart(int storeId, int prodId, int quantity) async {
      Response response = await _dio.post("/cart/add", data:jsonEncode({
        "store_id":storeId,
        "product_id":prodId,
        "quantity":quantity,
        "isDiscount":false
      }));
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> removeProductFromCart(int storeId, int prodId) async {
      Response response = await _dio.delete("/cart/remove", data:jsonEncode({
        "store_id":storeId,
        "product_id":prodId,
      }));
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> deleteStoreCart(int storeId) async {
      Response response = await _dio.delete("/cart/delete", data:jsonEncode({
        "store_id":storeId,
      }));
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> checkoutCart(int storeId, int addressId, String payment_type) async{
      Response response = await _dio.post("/cart/checkout", data:jsonEncode({
        "store_id":storeId,
        "user_address":addressId,
        "payment_type":payment_type,
      }));
      return StandardResponse.fromJson(response.data);
    }

    //Address
    Future<StandardResponse> addDeliveryAddress(String address, String lat, String lon, String desc, int isDefault) async{
      Response response = await _dio.post("/customer/address", data:jsonEncode({
        "address":address,
        "longitude":lon,
        "latitude":lat,
        "description":desc,
        "isDefault":isDefault
      }));
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> updateDeliveryAddress(int addressId,String address, String lat, String lon, String desc, int isDefault) async{
      Response response = await _dio.put("/customer/address", data:jsonEncode({
        "address_id":addressId,
        "address":address,
        "longitude":lon,
        "latitude":lat,
        "description":desc,
        "isDefault":isDefault
      }));
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> getCustomerAddressByID(int id) async{
      Response response = await _dio.get("/customer/address"+id.toString());
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> getCustomerDefaultAddress() async{
      Response response = await _dio.get("/customer/address");
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> listCustomerAddresses() async{
      Response response = await _dio.get("/customer/addresses");
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> deleteCustomerAddress(int id) async{
      Response response = await _dio.delete("/customer/address", data:jsonEncode({
        "address_id":id
      }));
      return StandardResponse.fromJson(response.data);
    }
    // User Transactions
    Future<StandardResponse> getUserTransactions() async{
      Response response = await _dio.get("/transactions/all");
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> getUserTransactionContent(String transCode) async{
      Response response = await _dio.get("/transaction/"+transCode);
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> cancelUserTransaction(String transCode) async{
      Response response = await _dio.put("/transaction/cancel", data:jsonEncode({
        "transaction_code":transCode
      }));
      return StandardResponse.fromJson(response.data);
    }




    //Transactions
    Future<StandardResponse> getTransactions() async{
      Response response = await _dio.get("/store/transactions/all");
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> getTransactionContent(String transactionID) async{
      Response response = await _dio.get("/store/transaction/"+transactionID);
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> cancelTransaction(String transactionCode, String reason) async{
      Response response = await _dio.put("/store/transaction/cancel", data:jsonEncode({
        "transaction_code":transactionCode,
        "reason":reason
      }));
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> processTransaction(String transactionCode) async{
      Response response = await _dio.put("/store/transaction/process", data:jsonEncode({
        "transaction_code":transactionCode,
      }));
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> readyForPickupTransaction(String transCode) async{
      Response response = await _dio.put("/store/transaction/ready", data:jsonEncode({
        "transaction_code":transCode,
      }));
      return StandardResponse.fromJson(response.data);
    }

    //Driver
    Future<StandardResponse> listAvailableDeliveries() async{
      Response response = await _dio.get("/rider/deliveries/available");
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> listCompletedDeliveries() async{
      Response response = await _dio.get("/rider/deliveries/completed");
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> listCurrentDelivery() async{
      Response response = await _dio.get("/rider/delivery/current");
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> getRiderDeliveryDetails(String transCode) async{
      Response response = await _dio.get("/rider/delivery/details/"+transCode);
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> riderAcceptDelivery(String transCode, int store_id, int customerId) async{
      Response response = await _dio.put("/rider/delivery/take", data:jsonEncode({
        "transaction_code":transCode,
        "store_id":store_id,
        "customer_id": customerId,
      }));
      return StandardResponse.fromJson(response.data);
    }
    Future<StandardResponse> triggerDelivered(String transCode) async{
      Response response = await _dio.put("/rider/delivery/delivered", data:jsonEncode({
        "transaction_code":transCode,
      }));
      return StandardResponse.fromJson(response.data);
    }


































  /********Users Authentication********/
  Future<StandardResponse> login(String email, String password) async {
    Response response = await _dio.post("/api/v1/users/userLogin", data: {
      "email": email,
      "password": password,
    });
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> fbLogin(String fbId, String firstName, String lastName) async {
    print(Constants.instance.baseURL+"/api/v1/users/fblogin");
    Response response = await _dio.post("/api/v1/users/fblogin", data: {
      "fbId": fbId,
      "firstName": firstName,
      "lastName":lastName
    });
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> userRegister(String firstName, String lastName, String email, String password) async {
    Response response = await _dio.post("/api/v1/users/userRegister", data: {
      "firstName": firstName,
      "lastName": lastName,
      "email":email,
      "password":password
    });
    return StandardResponse.fromJson(response.data);
  }

  /********Category********/
  Future<StandardResponse> getCategoryType({String type}) async {
    Response response = await _dio.get("/api/v1/category/type/"+type);
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> newCategoryType({String desc, String categoryType, String value}) async {
    Response response = await _dio.post("/api/v1/category/new", data: {
      "desc": desc,
      "categoryType": categoryType,
      "value":value,
    });
    return StandardResponse.fromJson(response.data);
  }


  /********Cart********/

  Future<StandardResponse> newCart(String desc, String ownerId, String totalAmount) async {
    Response response = await _dio.post("/api/v1/cart/new/cart", data: {
      "desc": desc,
      "ownerId": ownerId,
      "totalAmount":totalAmount,
    });
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> newCartItem(String desc, String prodId, String cartUUID, String storeUUID, int quantity, double amount, int orderStatus) async {
    Response response = await _dio.post("/api/v1/cart/new/cartitem", data: {
      "desc":desc,
      "prodId":prodId,
      "cartUUID":cartUUID,
      "storeUUID":storeUUID,
      "quantity":quantity,
      "amount":amount,
      "orderStatus":orderStatus
    });
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> getCartByOwnerId(String id) async {
    Response response = await _dio.get("/api/v1/cart/cart/"+id);
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> getCartItemByCartId(String id) async {
    Response response = await _dio.get("/api/v1/cart/cartitem/"+id);
    return StandardResponse.fromJson(response.data);
  }

  /********Product********/
  Future<StandardResponse> newProduct(String title, String description, double price, storeId, String category, mainImage) async {
    Response response = await _dio.post("/api/v1/product/new", data: {
      "title":title, "description":description,"price":price,
      "storeId":storeId, "category":category,"mainImage":mainImage
    });
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> getProductByCategory(String category) async {
    Response response = await _dio.get("/api/v1/product/"+category);
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> getProductByLocationCategory(String category, double radius, double long, double lat) async {
    Response response = await _dio.get("/api/v1/product/location"+radius.toString()+"/"+long.toString()+"/"+lat.toString()+"/"+category);
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> getProductByLocation(double radius, double long, double lat) async {
    Response response = await _dio.get("/api/v1/product/location/"+radius.toString()+"/"+long.toString()+"/"+lat.toString());
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> getProductByStoreId(storeId) async {
    Response response = await _dio.get("/api/v1/product/store/"+storeId);
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> getProductByReview(double review) async {
    Response response = await _dio.get("/api/v1/product/review/"+review.toString());
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> getProductByReviewPosition(String order) async {
    Response response = await _dio.get("/api/v1/product/review/order/"+order);
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> searchTitleProductLocation(String text, double radius, double long, double lat) async {
    Response response = await _dio.get("/api/v1/product/search/"+text+"/"+radius.toString()+"/"+long.toString()+"/"+lat.toString());
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> updateProductByStoreId(double long, double lat) async {
    Response response = await _dio.put("/api/v1/product/search/", data: {
      "lon":long,
      "lat":lat
    });
    return StandardResponse.fromJson(response.data);
  }
 Future<StandardResponse> updateProductById(String id, String title, String desc, double price, String storeId, String category, String mainImage, bool isAllowSubscription, bool isAvailable, String tags) async {
    Response response = await _dio.put("/api/v1/product/update/"+id, data: {
      "title":title,"description":desc, "price":price, "storeId":storeId, "category":category,"mainImage":mainImage, "isAllowSubscription":isAllowSubscription,"isAvailable":isAvailable,
      "tags":tags
    });
    return StandardResponse.fromJson(response.data);
  }
  /********Image********/
  Future<StandardResponse> getImageByOwnerIdType(String id, String type) async {
    Response response = await _dio.get("/api/v1/imagestorage/"+id+"/"+type);
    return StandardResponse.fromJson(response.data);
  }
  Future<StandardResponse> newImage(String src, String type, String ownerId) async {
    Response response = await _dio.post("/api/v1/imagestorage/new", data:{
      "src":src,"type":type,"ownerId":ownerId
    });
    return StandardResponse.fromJson(response.data);
  }
  



}