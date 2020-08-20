



import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/transactions.dart';
import 'package:clean_data/response/standard_response.dart';

class MStoreTransactionUseCase extends CleanUseCase {
  final CleanRepository repository;
  MStoreTransactionUseCase(this.repository);



  Future<List<MStoreTransaction>> getTransactions() async{
    return await repository.getTransactions();
  }
  Future<MStoreTransactionContent> getTransactionContent(String transCode) async{
    return await repository.getTransactionContent(transCode);
  }
  Future<StandardResponse> cancelTransaction(String transCode, String reason) async{
    return await repository.cancelTransaction(transCode, reason);
  }
  Future<StandardResponse> processTransaction(String transCode) async{
    return await repository.processTransaction(transCode);
  }
  Future<StandardResponse> readyForPickupTransaction(String transCode) async{
    return await repository.readyForPickupTransaction(transCode);
  }

}