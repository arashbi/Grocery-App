// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductDto> _$productDtoSerializer = new _$ProductDtoSerializer();
Serializer<CategoryDto> _$categoryDtoSerializer = new _$CategoryDtoSerializer();
Serializer<ImageDto> _$imageDtoSerializer = new _$ImageDtoSerializer();

class _$ProductDtoSerializer implements StructuredSerializer<ProductDto> {
  @override
  final Iterable<Type> types = const [ProductDto, _$ProductDto];
  @override
  final String wireName = 'ProductDto';

  @override
  Iterable<Object> serialize(Serializers serializers, ProductDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(num)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'status',
      serializers.serialize(object.status,
          specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'price',
      serializers.serialize(object.price,
          specifiedType: const FullType(String)),
      'images',
      serializers.serialize(object.images,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ImageDto)])),
    ];

    return result;
  }

  @override
  ProductDto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'images':
          result.images.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ImageDto)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryDtoSerializer implements StructuredSerializer<CategoryDto> {
  @override
  final Iterable<Type> types = const [CategoryDto, _$CategoryDto];
  @override
  final String wireName = 'CategoryDto';

  @override
  Iterable<Object> serialize(Serializers serializers, CategoryDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    if (object.image != null) {
      result
        ..add('image')
        ..add(serializers.serialize(object.image,
            specifiedType: const FullType(ImageDto)));
    }
    return result;
  }

  @override
  CategoryDto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
              specifiedType: const FullType(ImageDto)) as ImageDto);
          break;
      }
    }

    return result.build();
  }
}

class _$ImageDtoSerializer implements StructuredSerializer<ImageDto> {
  @override
  final Iterable<Type> types = const [ImageDto, _$ImageDto];
  @override
  final String wireName = 'ImageDto';

  @override
  Iterable<Object> serialize(Serializers serializers, ImageDto object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'src',
      serializers.serialize(object.src, specifiedType: const FullType(String)),
      'alt',
      serializers.serialize(object.alt, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ImageDto deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageDtoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'src':
          result.src = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'alt':
          result.alt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ProductDto extends ProductDto {
  @override
  final num id;
  @override
  final String name;
  @override
  final String status;
  @override
  final String description;
  @override
  final String price;
  @override
  final BuiltList<ImageDto> images;

  factory _$ProductDto([void Function(ProductDtoBuilder) updates]) =>
      (new ProductDtoBuilder()..update(updates)).build();

  _$ProductDto._(
      {this.id,
      this.name,
      this.status,
      this.description,
      this.price,
      this.images})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('ProductDto', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('ProductDto', 'name');
    }
    if (status == null) {
      throw new BuiltValueNullFieldError('ProductDto', 'status');
    }
    if (description == null) {
      throw new BuiltValueNullFieldError('ProductDto', 'description');
    }
    if (price == null) {
      throw new BuiltValueNullFieldError('ProductDto', 'price');
    }
    if (images == null) {
      throw new BuiltValueNullFieldError('ProductDto', 'images');
    }
  }

  @override
  ProductDto rebuild(void Function(ProductDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductDtoBuilder toBuilder() => new ProductDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductDto &&
        id == other.id &&
        name == other.name &&
        status == other.status &&
        description == other.description &&
        price == other.price &&
        images == other.images;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), status.hashCode),
                description.hashCode),
            price.hashCode),
        images.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProductDto')
          ..add('id', id)
          ..add('name', name)
          ..add('status', status)
          ..add('description', description)
          ..add('price', price)
          ..add('images', images))
        .toString();
  }
}

class ProductDtoBuilder implements Builder<ProductDto, ProductDtoBuilder> {
  _$ProductDto _$v;

  num _id;
  num get id => _$this._id;
  set id(num id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _price;
  String get price => _$this._price;
  set price(String price) => _$this._price = price;

  ListBuilder<ImageDto> _images;
  ListBuilder<ImageDto> get images =>
      _$this._images ??= new ListBuilder<ImageDto>();
  set images(ListBuilder<ImageDto> images) => _$this._images = images;

  ProductDtoBuilder();

  ProductDtoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _status = _$v.status;
      _description = _$v.description;
      _price = _$v.price;
      _images = _$v.images?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProductDto;
  }

  @override
  void update(void Function(ProductDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProductDto build() {
    _$ProductDto _$result;
    try {
      _$result = _$v ??
          new _$ProductDto._(
              id: id,
              name: name,
              status: status,
              description: description,
              price: price,
              images: images.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        images.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ProductDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$CategoryDto extends CategoryDto {
  @override
  final int id;
  @override
  final String name;
  @override
  final ImageDto image;

  factory _$CategoryDto([void Function(CategoryDtoBuilder) updates]) =>
      (new CategoryDtoBuilder()..update(updates)).build();

  _$CategoryDto._({this.id, this.name, this.image}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('CategoryDto', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('CategoryDto', 'name');
    }
  }

  @override
  CategoryDto rebuild(void Function(CategoryDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryDtoBuilder toBuilder() => new CategoryDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryDto &&
        id == other.id &&
        name == other.name &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), name.hashCode), image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CategoryDto')
          ..add('id', id)
          ..add('name', name)
          ..add('image', image))
        .toString();
  }
}

class CategoryDtoBuilder implements Builder<CategoryDto, CategoryDtoBuilder> {
  _$CategoryDto _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  ImageDtoBuilder _image;
  ImageDtoBuilder get image => _$this._image ??= new ImageDtoBuilder();
  set image(ImageDtoBuilder image) => _$this._image = image;

  CategoryDtoBuilder();

  CategoryDtoBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _image = _$v.image?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CategoryDto;
  }

  @override
  void update(void Function(CategoryDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CategoryDto build() {
    _$CategoryDto _$result;
    try {
      _$result = _$v ??
          new _$CategoryDto._(id: id, name: name, image: _image?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CategoryDto', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ImageDto extends ImageDto {
  @override
  final String src;
  @override
  final String alt;

  factory _$ImageDto([void Function(ImageDtoBuilder) updates]) =>
      (new ImageDtoBuilder()..update(updates)).build();

  _$ImageDto._({this.src, this.alt}) : super._() {
    if (src == null) {
      throw new BuiltValueNullFieldError('ImageDto', 'src');
    }
    if (alt == null) {
      throw new BuiltValueNullFieldError('ImageDto', 'alt');
    }
  }

  @override
  ImageDto rebuild(void Function(ImageDtoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageDtoBuilder toBuilder() => new ImageDtoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageDto && src == other.src && alt == other.alt;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, src.hashCode), alt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImageDto')
          ..add('src', src)
          ..add('alt', alt))
        .toString();
  }
}

class ImageDtoBuilder implements Builder<ImageDto, ImageDtoBuilder> {
  _$ImageDto _$v;

  String _src;
  String get src => _$this._src;
  set src(String src) => _$this._src = src;

  String _alt;
  String get alt => _$this._alt;
  set alt(String alt) => _$this._alt = alt;

  ImageDtoBuilder();

  ImageDtoBuilder get _$this {
    if (_$v != null) {
      _src = _$v.src;
      _alt = _$v.alt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageDto other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ImageDto;
  }

  @override
  void update(void Function(ImageDtoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImageDto build() {
    final _$result = _$v ?? new _$ImageDto._(src: src, alt: alt);
    replace(_$result);
    return _$result;
  }
}

class _$SearchCriteria extends SearchCriteria {
  @override
  final String category;
  @override
  final String searchTerm;

  factory _$SearchCriteria([void Function(SearchCriteriaBuilder) updates]) =>
      (new SearchCriteriaBuilder()..update(updates)).build();

  _$SearchCriteria._({this.category, this.searchTerm}) : super._() {
    if (category == null) {
      throw new BuiltValueNullFieldError('SearchCriteria', 'category');
    }
    if (searchTerm == null) {
      throw new BuiltValueNullFieldError('SearchCriteria', 'searchTerm');
    }
  }

  @override
  SearchCriteria rebuild(void Function(SearchCriteriaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchCriteriaBuilder toBuilder() =>
      new SearchCriteriaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchCriteria &&
        category == other.category &&
        searchTerm == other.searchTerm;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, category.hashCode), searchTerm.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchCriteria')
          ..add('category', category)
          ..add('searchTerm', searchTerm))
        .toString();
  }
}

class SearchCriteriaBuilder
    implements Builder<SearchCriteria, SearchCriteriaBuilder> {
  _$SearchCriteria _$v;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  String _searchTerm;
  String get searchTerm => _$this._searchTerm;
  set searchTerm(String searchTerm) => _$this._searchTerm = searchTerm;

  SearchCriteriaBuilder() {
    SearchCriteria._initializeBuilder(this);
  }

  SearchCriteriaBuilder get _$this {
    if (_$v != null) {
      _category = _$v.category;
      _searchTerm = _$v.searchTerm;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchCriteria other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchCriteria;
  }

  @override
  void update(void Function(SearchCriteriaBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchCriteria build() {
    final _$result = _$v ??
        new _$SearchCriteria._(category: category, searchTerm: searchTerm);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
