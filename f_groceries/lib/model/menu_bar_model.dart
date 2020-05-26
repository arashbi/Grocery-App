import 'package:built_collection/built_collection.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:flutter/cupertino.dart';

class MenuBarModel extends ChangeNotifier {
  bool _searching = false;
  String _title= "loading";
  BuiltMap<ProductDto, int> _purchases = BuiltMap.of({});
  set title(String aTitle) {
    this._title = aTitle;
    notifyListeners();
  }
  get title => _title;
  get searching => _searching;
  set searching(bool v) {
    this._searching = v;
    notifyListeners();
  }
  get puchases => _purchases;
  get purchaseCount => _purchases.values.fold(0,(i,j)=> i+j);
}

