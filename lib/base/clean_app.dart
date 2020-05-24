
import 'package:flutter/cupertino.dart';

abstract class CleanApp extends StatelessWidget{
  CleanDataInstantiator dataInstantiator;
  CleanApp(this.dataInstantiator);
}

abstract class CleanDataInstantiator {
  CleanDataInstantiator(){
  }

  void initAppDependencies();
}