import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'data_model.dart';

Future<DataModel?> getSinglePostData() async {
  DataModel? resultData;
  try{
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/2");
    final response = await http
        .get(uri, headers: {HttpHeaders.contentTypeHeader: "application/json"});
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      resultData = DataModel.fromJson(item);
    } else {
      print("error request http:${response.statusCode}");
    }
  }catch(e){
    print(e.toString());
  }
  return resultData;
}
