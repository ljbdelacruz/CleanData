


class LoggerService{
  static bool isDemo=false;
  static log(String data){
    if(isDemo){
      print(data);
    }
  }
}