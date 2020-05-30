
import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:f_groceries/built_list_extensions.dart';
abstract class CartEvent extends Equatable {}

class AddProduct extends CartEvent {
  final ProductDto product;

  AddProduct(this.product);

  @override
  List<Object> get props => [ProductDto];
}

class RemoveProduct extends CartEvent {
  final ProductDto product;

  RemoveProduct(this.product);

  @override
  List<Object> get props => [product];
}

/// States

abstract class CartState extends Equatable {}

class Ready extends CartState {
  final BuiltList<ProductDto> products;

  Ready(this.products);

  @override
  List<Object> get props => [products];
}

class CartBloc extends Bloc<CartEvent, CartState> {
  @override
  CartState get initialState => Ready(BuiltList.of([]));

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if(event is AddProduct) {
      debugPrint("Adding product ${event.product}");
      yield Ready((state as Ready).products.add(event.product));
    }
  }

}

