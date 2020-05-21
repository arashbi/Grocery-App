import 'package:built_collection/built_collection.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:f_groceries/services/woo/services.dart';
import 'package:flutter/foundation.dart';

import 'menu_bar_model.dart';

class CategoryModel extends ChangeNotifier {
  BuiltList<CategoryDto> _categories= BuiltList.of([]);
  BuiltList<CategoryDto> get categories => _categories;

  fetch() async {
    var cats = await fetchCategories();
    _categories = cats;
        notifyListeners();
  }
}

class ProductsModel extends ChangeNotifier {
  String categoryId;

  SearchCriteriaModel _searchCriteria;
  set searchCriteria(SearchCriteriaModel criteria) {
    this._searchCriteria = criteria;
    searchProducts(this._searchCriteria.criteria);

  }

  BuiltList<ProductDto> _products = BuiltList.of([]);
  BuiltList<ProductDto> get products => _products;

  searchProducts(SearchCriteria criteria) async {
    search(criteria).then((value){
      this._products = value;
      notifyListeners();
    });
  }
}