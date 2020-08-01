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
    Future<StandardResponse> getProducts() async {
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
      Response response = await _dio.get("/products/store/"+storeId.toString());
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