
import 'package:built_collection/built_collection.dart';

extension BuiltListAddition<T> on BuiltList<T> {
  BuiltList<T> add(T value) {
    return BuiltList.build((ListBuilder b) => b..addAll(this.asList())..add(value));
  }
}