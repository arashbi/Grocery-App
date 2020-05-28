import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:f_groceries/blocs/menu/menu.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:f_groceries/services/woo/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CategoryEvent extends Equatable {}

class LoadCategories extends CategoryEvent {
  @override
  List<Object> get props => [];
}

class LoadCategoriesDone extends CategoryEvent {
  final BuiltList<CategoryDto> categories;

  LoadCategoriesDone(this.categories);
  @override
  List<Object> get props => [categories];

}

class LoadCategoriesFailed extends CategoryEvent {
  @override
  List<Object> get props => [];
}

/// States
///
abstract class CategoryState extends Equatable {}

class Loaded extends CategoryState{
  final BuiltList<CategoryDto> categories;

  Loaded(this.categories);

  @override
  List<Object> get props => [categories];
}
class Loading extends CategoryState {
  @override
  List<Object> get props => [];

}
class Failed extends CategoryState {
  final String reason;

  Failed(this.reason);

  @override
  List<Object> get props => [reason];

}

/// Category Bloc
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  CategoryBloc(){
    this.add(LoadCategories());
  }

  @override
  get initialState => Loaded(BuiltList<CategoryDto>.of([]));

  @override
  Stream<CategoryState> mapEventToState(event) async* {
    if(event is LoadCategoriesDone) {
      yield Loaded(event.categories);
    } else if (event is LoadCategoriesFailed) {
      yield Failed("Failed to load Categories");
    }else if( event is LoadCategories) {
        fetchCategories()
            .then((value) => add(LoadCategoriesDone(value)))
            .catchError((onError) {
              debugPrint("Error");
          Timer(Duration(seconds: 2), (){
            add(LoadCategories());
          });
          add(LoadCategoriesFailed());
        });
        yield Loading();
    }
  }
}
