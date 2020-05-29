import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:f_groceries/model/serializers.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:http/http.dart';
String username = "ck_5a4c6c0cf237e24d7859810d56d97a523b7ab131";
String password = "cs_3a4c1530d2e6aa0ae6ca7638e374f5c90941b585";
String auth = 'Basic ' + base64Encode(utf8.encode("$username:$password"));
String basePath = 'https://96ee18fd53e0.ngrok.io/';

Future<BuiltList<CategoryDto>> fetchCategories()  {
  var response = _callWC("/wp-json/wc/v3/products/categories");
  Future<BuiltList<CategoryDto>> f = response.then((value)  {
    try {
      BuiltList<CategoryDto>cats = deserializeListOf<CategoryDto>(json.decode(value.body));
      return cats;
    } catch( ex ) {
      debugPrint("Error in desrializing ");
      debugPrint(value.body);
      debugPrint(ex.toString());
      throw ex;
    }

  }
    );
  return f;
}

fetchProducts({String categoryId }) async {
  if (categoryId != null) {
    var response =  _callWC("/wp-json/wc/v3/products/?category=$categoryId");
    return response.then((it)  => deserializeListOf<ProductDto>(jsonDecode(it.body)));
  }
}

Future<BuiltList<ProductDto>> search(SearchCriteria criteria) async {
  var params = "category=${criteria.category}&search=${criteria.searchTerm}";
  return _callWC("/wp-json/wc/v3/products?$params").then((value) {
    return deserializeListOf<ProductDto>(jsonDecode(value.body));
  });
}

Future<Response> _callWC(String path) {
  return http.get("$basePath/$path", headers: {"authorization": auth});
}