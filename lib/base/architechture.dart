




import 'dart:async';

import 'package:clean_data/model/cart.dart';
import 'package:clean_data/model/category.dart';
import 'package:clean_data/model/image_storage.dart';
import 'package:clean_data/model/product.dart';
import 'package:clean_data/model/user_session.dart';
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
    extends State<CleanPage> {
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

  @deprecated
  void notify() {
    cleanPageState.setState(() {
      cleanPageState.presenter = this;
    });
  }
}

abstract class CleanRepository {
  Future<UserSession> login(String email, String password);
  Future<UserSession> fbLogin(String fbId, String firstname, String lastname);
  Future<UserSession> userRegister(String firstName, String lastName, String email, String password);
  Future<UserSession> getUserLogin();



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




}






