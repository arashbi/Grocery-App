import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:f_groceries/blocs/search/search.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:f_groceries/services/woo/services.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

}

class UpdateProducts extends ProductsEvent {
  final SearchCriteria searchCriteria;

  UpdateProducts(this.searchCriteria);

  @override
  List<Object> get props => [searchCriteria];

}

class UpdateProductsDone extends ProductsEvent {
  final BuiltList<ProductDto> products;

  UpdateProductsDone(this.products);

  @override
  List<Object> get props => [products];
}
///////// states
abstract class ProductsState extends Equatable {}

@immutable
class SearchDone extends ProductsState {
  final BuiltList<ProductDto> products;

  SearchDone(this.products);

  @override
  List<Object> get props => [products];

}

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {

  SearchBloc _searchBloc;
  StreamSubscription<SearchCriteria> _subscription;
  ProductsBloc(this._searchBloc){
    _subscription = this._searchBloc.listen((state) {
        add(UpdateProducts(state));
    });
  }

  @override

  ProductsState get initialState => SearchDone(BuiltList<ProductDto>.of([]));

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async*{
    if(event is UpdateProducts) {
      search(event.searchCriteria).then((products) =>  {
        add(UpdateProductsDone(products))
    });
      yield ProductsLoading();
    } else if ( event is UpdateProductsDone) {
      yield SearchDone(event.products);
    }
  }

  @override
  Future<void> close() async {
    await super.close();
    await _subscription.cancel();
  }
}

class ProductsLoading extends ProductsState {
  @override
  List<Object> get props => [];
}