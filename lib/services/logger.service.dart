


class LoggerService{
  static bool isDemo=true;
  static log(String data){
    if(isDemo){
      print(data);
    }
  }
}