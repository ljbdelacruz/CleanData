



import 'package:clean_data/base/architechture.dart';
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
    CategoryMapper categoryMapper = CategoryMapper();
    CartMapper cartMapper = CartMapper();
    CartItemMapper cartItemMapper = CartItemMapper();
    ProductMapper productMapper= ProductMapper();
    ImageStorageMapper imageStorageMapper = ImageStorageMapper();

    /* -------------------------------- Databases ------------------------------- */
    UserSessionDb sessionDb;
    CategoryDb categoryDb;

    CleanMainRepository(this.db, this.restClient){
      this.sessionDb = UserSessionDb(this.db);
      this.categoryDb = CategoryDb(this.db);
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