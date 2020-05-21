import 'dart:convert';
import 'dart:io';

import 'package:f_groceries/main.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:f_groceries/model/serializers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
main () {
  HttpOverrides.global = MyHttpOverrides();
  String username = "ck_5a4c6c0cf237e24d7859810d56d97a523b7ab131";
  String password = "cs_3a4c1530d2e6aa0ae6ca7638e374f5c90941b585";
  String auth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  test("getting the product information", () async {
    HttpOverrides.global = MyHttpOverrides();
    var response = await http.get("https://pandasmooth.local/wp-json/wc/v3/products/35", headers: {"authorization": auth});
    print(response.body);

    var p = serializers.deserializeWith(ProductDto.serializer, json.decode(response.body));
    print(p);

  });

  test("getting all the products", () async {
    HttpOverrides.global = MyHttpOverrides();
    var response = await http.get("https://pandasmooth.local/wp-json/wc/v3/products", headers: {"authorization": auth});
    var b = deserializeListOf<ProductDto>(json.decode(response.body));
    for( var i in b) {
      print(i);
    }
  });
}