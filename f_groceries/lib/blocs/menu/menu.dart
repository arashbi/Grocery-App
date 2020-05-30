import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:f_groceries/blocs/cart/cart_bloc.dart';
import 'package:f_groceries/blocs/search/search.dart';
import 'package:flutter/cupertino.dart';

abstract class MenuEvent extends Equatable {}

class SearchStarted extends MenuEvent {
  @override
  List<Object> get props => [];
}

class ChangeTitle extends MenuEvent {

  @override
  List<Object> get props => throw UnimplementedError();

}

class SearchUpdated extends MenuEvent {
  final String _term;

  SearchUpdated(this._term);
  @override
  List<Object> get props => [_term];
}

// States
abstract class MenuState extends Equatable {
  final String title;

  MenuState(this.title);
}

class SearchingState extends MenuState {
  SearchingState(String title) : super(title);

  @override
  List<Object> get props => [title];
}

class RestingState extends MenuState {
  RestingState(String title) : super(title);

  @override
  List<Object> get props => [title];
}

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  SearchBloc _searchBloc;
  CartBloc _cartBloc;
  MenuBloc(this._searchBloc, this._cartBloc){
    _cartBloc.listen((state ) {
      if(state is Ready) {

      }
    });
  }

  @override
  MenuState get initialState => RestingState("");

  @override
  Stream<MenuState> mapEventToState(MenuEvent event) async* {
    if(event is SearchStarted) {
      yield SearchingState(state.title);
    } else if (event is SearchUpdated) {
      _searchBloc.add(UpdateSearchEvent(_searchBloc.state.rebuild((b) => b.searchTerm = event._term)));
    }

  }
}
