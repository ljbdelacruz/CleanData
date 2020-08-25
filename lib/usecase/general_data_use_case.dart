



import 'package:clean_data/base/architechture.dart';
import 'package:clean_data/model/category.dart';

class GeneralDataUseCase extends CleanUseCase {
  final CleanRepository repository;
  GeneralDataUseCase(this.repository);

  Future<List<FoodyCategory>> getCategoriesList() async{
    return await repository.getCategoriesList();
  }


}