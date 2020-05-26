import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:flutter/cupertino.dart';

class SearchBloc extends Bloc<Search, SearchCriteria> {


  SearchBloc() {
    add(Search(SearchCriteria()));
  }

  @override
  get initialState => SearchCriteria();

  @override
  Stream<SearchCriteria> mapEventToState(event) async* {
      yield event.searchCriteria;
  }
}

@immutable
class Search extends Equatable {
  final SearchCriteria searchCriteria;

  @override
  List<Object> get  props => [searchCriteria];
  Search(this.searchCriteria);

}

class UpdateSearchEvent extends Search {
  UpdateSearchEvent(SearchCriteria searchCriteria) : super(searchCriteria);
}