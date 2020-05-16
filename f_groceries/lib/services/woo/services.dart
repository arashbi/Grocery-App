import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:f_groceries/model/serializers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

String username = "ck_5a4c6c0cf237e24d7859810d56d97a523b7ab131";
String password = "cs_3a4c1530d2e6aa0ae6ca7638e374f5c90941b585";
String auth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
String basePath = 'https://fbeb0141.ngrok.io/';
Future<BuiltList<CategoryDto>> fetchCategories() async {
  var response = http.get("$basePath/wp-json/wc/v3/products/categories", headers: {"authorization": auth});
  return  response.then((value)  {
    try {
      var cats = deserializeListOf<CategoryDto>(json.decode(value.body));
      return cats;
    } catch( ex ) {
      debugPrint("Error in desrializing ");
      debugPrint(value.body);
      throw ex;
    }

  }
    );
}
