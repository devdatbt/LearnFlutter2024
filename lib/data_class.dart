
import 'package:demo/data_model.dart';
import 'package:demo/service_class.dart';
import 'package:flutter/cupertino.dart';

class DataClass extends ChangeNotifier {
  DataModel? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = (await getSinglePostData())!;
    loading = false;

    notifyListeners();
  }
}