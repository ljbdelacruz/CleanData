



import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/address.dart';
import 'package:clean_data/response/standard_response.dart';

class AddressUseCase extends CleanUseCase {
  final CleanRepository repository;
  AddressUseCase(this.repository);
  

  Future<StandardResponse> addDeliveryAddress(String address, String lat, String lon, String desc, int isDefault) async{
    return await repository.addDeliveryAddress(address, lat, lon, desc, isDefault);
  }
  Future<StandardResponse> updateDeliveryAddress(int addressId,String address, String lat, String lon, String desc, int isDefault) async{
   return await repository.updateDeliveryAddress(addressId, address, lat, lon, desc, isDefault);
    
  }
  Future<LSAddress> getCustomerAddressByID(int id) async{
    return await repository.getCustomerAddressByID(id);
  }
  Future<LSAddress> getCustomerDefaultAddress() async{
    return await repository.getCustomerDefaultAddress();
  }
  Future<List<LSAddress>> listCustomerAddresses() async{
    return await repository.listCustomerAddresses();
  }
  Future<StandardResponse> deleteCustomerAddress(int id) async{
    return await repository.deleteCustomerAddress(id);
  }

}