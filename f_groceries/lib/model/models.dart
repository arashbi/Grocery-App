import 'package:built_collection/built_collection.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:f_groceries/services/woo/services.dart';
import 'package:flutter/foundation.dart';

class CategoryModel extends ChangeNotifier {
  BuiltList<CategoryDto> _categories= BuiltList.of([]);
  BuiltList<CategoryDto> get categories => _categories;

  fetch() {
    fetchCategories().then((value) {
    _categories = value;
        notifyListeners();
    });
  }

}