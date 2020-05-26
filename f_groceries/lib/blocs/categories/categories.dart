import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:f_groceries/blocs/menu/menu.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:f_groceries/services/woo/services.dart';
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

/// States
///
class CategoryState extends Equatable {
  final BuiltList<CategoryDto> categories;

  CategoryState(this.categories);

  @override
  List<Object> get props => [categories];
}

/// Category Bloc
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  CategoryBloc(){
    this.add(LoadCategories());
  }

  @override
  get initialState => CategoryState(BuiltList<CategoryDto>.of([]));

  @override
  Stream<CategoryState> mapEventToState(event) async* {
    if(event is LoadCategoriesDone) {
      yield CategoryState(event.categories);
    } else if( event is LoadCategories) {
      var cats = await fetchCategories();
      add(LoadCategoriesDone(cats));
    }
  }
}