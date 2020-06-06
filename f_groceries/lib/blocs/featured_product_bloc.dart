import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:f_groceries/services/woo/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as FBloc;

abstract class FeaturedProductsEvent extends Equatable {}

class Load extends FeaturedProductsEvent {
  @override
  List<Object> get props => [];
}

class Loaded extends FeaturedProductsEvent {
  final BuiltList<ProductDto> products;

  Loaded(this.products);

  @override
  List<Object> get props => [products];
}

class FailedEvent extends FeaturedProductsEvent {

  @override
  List<Object> get props => [];

}
///
abstract class FeaturedProductState extends Equatable{}

class Ready extends FeaturedProductState {
  final BuiltList<ProductDto> products;

  Ready(this.products);
  @override
  List<Object> get props => [products];
}

class Loading extends FeaturedProductState {
  @override
  List<Object> get props => [];
}

class Failed extends FeaturedProductState {
  @override
  List<Object> get props => [];
}

class Bloc extends FBloc.Bloc<FeaturedProductsEvent, FeaturedProductState> {
  Bloc() {
    this.add(Load());
  }
  @override
  FeaturedProductState get initialState => Loading();

  @override
  Stream<FeaturedProductState> mapEventToState(FeaturedProductsEvent event) async* {
    yield Loading();
    if (event is Load) {
      yield await fetchFeaturedProducts().then((value) {
        return Ready(value);
      }).catchError((error) {
        return Failed();
      });
    } else if ( event is Loaded) {
      yield Ready(event.products);
    } else if (event is FailedEvent) {
      yield Failed();
    }
  }
}


/// Bloc class

