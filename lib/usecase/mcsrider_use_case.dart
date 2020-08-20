




import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/delivery.dart';
import 'package:clean_data/response/standard_response.dart';

class MCSRiderUseCase extends CleanUseCase {
  final CleanRepository repository;
  MCSRiderUseCase(this.repository);

  // Future<StandardResponse> listAvailableDeliveries() async{
    
  // }
  Future<List<RiderDelivery>> listAvailableDeliveries() async{
    return await repository.listAvailableDeliveries();
  }
  Future<List<RiderDelivery>> listCompletedDeliveries() async{
    return await repository.listCompletedDeliveries();
  }

  Future<RiderCurrentDelivery> listCurrentDelivery() async{
    return await repository.listCurrentDelivery();
  }
  Future<RiderCurrentDeliveryInfo> getRiderDeliveryDetails(String transCode) async{
    return await repository.getRiderDeliveryDetails(transCode);
  }
  Future<StandardResponse> riderAcceptDelivery(String transCode, int store_id, int customerId) async{
    return await repository.riderAcceptDelivery(transCode, store_id, customerId);
  }
  Future<StandardResponse> triggerDelivered(String transCode) async{
    return await repository.triggerDelivered(transCode);
  }

}