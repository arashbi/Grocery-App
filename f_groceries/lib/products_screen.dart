import 'package:built_collection/built_collection.dart';
import 'package:f_groceries/Cart_Screen.dart';
import 'package:f_groceries/blocs/products/products.dart';
import 'package:f_groceries/blocs/search/search.dart';
import 'package:f_groceries/model/menu_bar_model.dart';
import 'package:f_groceries/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as rs;
import 'package:provider/provider.dart';
import 'app_bar.dart';
import 'model/data_model.dart';

class ProductsScreen extends StatelessWidget {
  final String toolbarName;

  ProductsScreen({Key key, this.toolbarName})
      : super(key: key);

  final List list = ['12', '11'];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String toolbarname = "Products";

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: _scaffoldKey,
      appBar: _appbar(context),
      body: Column(
        children: <Widget>[
          Container(
              // height: 500.0,
              child: BlocProvider<ProductsBloc>(
                create: (context) {
                  return ProductsBloc(BlocProvider.of<SearchBloc>(context));
                },
                child: BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    return  (state is ProductsLoading) ? Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    ) : ProductsGrid(products: (state as SearchDone).products);
                  })
    ),
    )
    ]
    ),

      );


  }

  _appbar(BuildContext context) {
    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.linux:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
        default:
          return Icons.arrow_back;
      }
    }

    return MenuBar();
  }
}

class ProductsGrid extends StatelessWidget {
  final BuiltList<ProductDto> products;
  const ProductsGrid({
    Key key,
    this.products
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      controller: new ScrollController(keepScrollOffset: false),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(4.0),
      children: products.map((ProductDto aProduct) {
        return ProductWidget(
        product: aProduct,
      );
    }).toList(),
                ),
              );
  }
}

class ProductWidget extends StatelessWidget {
  ProductWidget({Key key, @required this.product, this.shape})
      : assert(product != null),
        super(key: key);

  static const double height = 566.0;
  final ProductDto product;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    return SafeArea(
        top: false,
        bottom: false,
        child: Container(
            padding: const EdgeInsets.all(4.0),
            height: height,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: product)));
              },
              child: Card(
                shape: shape,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // photo and title
                    Stack(
                      children: <Widget>[
                        Image.network(
                          product.images[0].src,
                          // package: destination.assetPackage,
                          fit: BoxFit.scaleDown,
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            // padding: EdgeInsets.all(5.0),
                            child: IconButton(
                                icon: const Icon(Icons.favorite_border),
                                onPressed: () {})),
                      ],
                    ),
                    // description and share/explore buttons
                    Expanded(
                      child: DefaultTextStyle(
                        style: descriptionStyle,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            // three line description
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  6.0, 0, 6.0, 6.0),
                              child: Text(
                                product.name,
                                style: descriptionStyle.copyWith(
                                    color: Colors.black87),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8.0),
                              child: Text(
                                product.price,
                                style: descriptionStyle.copyWith(
                                    color: Colors.black54),
                              ),
                            ),
                            // Text(destination.description[1]),
                            // Text(destination.description[2]),
                          ],
                        ),
                      ),
                    ),
                    // share, explore buttons
                    Container(
                      alignment: Alignment.center,
                      child: OutlineButton(
                          borderSide: BorderSide(color: Colors.amber.shade500),
                          child: const Text('Add'),
                          textColor: Colors.amber.shade500,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailScreen()));
                          },
                          shape: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          )),
                    ),
                  ],
                ),
              ),
            )));
  }

/* List<RangeSliderData> _rangeSliderDefinitions() {
    return <RangeSliderData>[
      RangeSliderData(
          min: 0.0, max: 100.0, lowerValue: 10.0, upperValue: 100.0),
      RangeSliderData(
          min: 0.0,
          max: 100.0,
          lowerValue: 25.0,
          upperValue: 75.0,
          divisions: 20,
          overlayColor: Colors.red[100]),
      RangeSliderData(
          min: 0.0,
          max: 100.0,
          lowerValue: 10.0,
          upperValue: 30.0,
          showValueIndicator: false,
          valueIndicatorMaxDecimals: 0),
      RangeSliderData(
          min: 0.0,
          max: 100.0,
          lowerValue: 10.0,
          upperValue: 30.0,
          showValueIndicator: true,
          valueIndicatorMaxDecimals: 0,
          activeTrackColor: Colors.red,
          inactiveTrackColor: Colors.red[50],
          valueIndicatorColor: Colors.green),
      RangeSliderData(
          min: 0.0,
          max: 100.0,
          lowerValue: 25.0,
          upperValue: 75.0,
          divisions: 20,
          thumbColor: Colors.grey,
          valueIndicatorColor: Colors.grey),
    ];
  }*/
}

// ---------------------------------------------------
// Helper class aimed at simplifying the way to
// automate the creation of a series of RangeSliders,
// based on various parameters
//
// This class is to be used to demonstrate the appearance
// customization of the RangeSliders
// ---------------------------------------------------
class RangeSliderData {
  double min;
  double max;
  double lowerValue;
  double upperValue;
  int divisions;
  bool showValueIndicator;
  int valueIndicatorMaxDecimals;
  bool forceValueIndicator;
  Color overlayColor;
  Color activeTrackColor;
  Color inactiveTrackColor;
  Color thumbColor;
  Color valueIndicatorColor;
  Color activeTickMarkColor;

  static const Color defaultActiveTrackColor = const Color(0xFF0175c2);
  static const Color defaultInactiveTrackColor = const Color(0x3d0175c2);
  static const Color defaultActiveTickMarkColor = const Color(0x8a0175c2);
  static const Color defaultThumbColor = const Color(0xFF0175c2);
  static const Color defaultValueIndicatorColor = const Color(0xFF0175c2);
  static const Color defaultOverlayColor = const Color(0x290175c2);

  RangeSliderData({
    this.min,
    this.max,
    this.lowerValue,
    this.upperValue,
    this.divisions,
    this.showValueIndicator: true,
    this.valueIndicatorMaxDecimals: 1,
    this.forceValueIndicator: false,
    this.overlayColor: defaultOverlayColor,
    this.activeTrackColor: defaultActiveTrackColor,
    this.inactiveTrackColor: defaultInactiveTrackColor,
    this.thumbColor: defaultThumbColor,
    this.valueIndicatorColor: defaultValueIndicatorColor,
    this.activeTickMarkColor: defaultActiveTickMarkColor,
  });

  // Returns the values in text format, with the number
  // of decimals, limited to the valueIndicatedMaxDecimals
  //
  String get lowerValueText =>
      lowerValue.toStringAsFixed(valueIndicatorMaxDecimals);

  String get upperValueText =>
      upperValue.toStringAsFixed(valueIndicatorMaxDecimals);

  // Builds a RangeSlider and customizes the theme
  // based on parameters
  //
  Widget build(BuildContext context, rs.RangeSliderCallback callback) {
    return new Container(
      width: double.infinity,
      child: new Row(
        children: <Widget>[
          new Container(
            constraints: new BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: new Text(lowerValueText),
          ),
          new Expanded(
            child: new SliderTheme(
              // Customization of the SliderTheme
              // based on individual definitions
              // (see rangeSliders in _RangeSliderSampleState)
              data: SliderTheme.of(context).copyWith(
                overlayColor: overlayColor,
                activeTickMarkColor: activeTickMarkColor,
                activeTrackColor: activeTrackColor,
                inactiveTrackColor: inactiveTrackColor,
                thumbColor: thumbColor,
                valueIndicatorColor: valueIndicatorColor,
                showValueIndicator: showValueIndicator
                    ? ShowValueIndicator.always
                    : ShowValueIndicator.onlyForDiscrete,
              ),
              child: rs.RangeSlider(
                min: min,
                max: max,
                lowerValue: lowerValue,
                upperValue: upperValue,
                divisions: divisions,
                showValueIndicator: showValueIndicator,
                valueIndicatorMaxDecimals: valueIndicatorMaxDecimals,
                onChanged: (double lower, double upper) {
                  // call
                  callback(lower, upper);
                },
              ),
            ),
          ),
          new Container(
            constraints: new BoxConstraints(
              minWidth: 40.0,
              maxWidth: 40.0,
            ),
            child: new Text(upperValueText),
          ),
        ],
      ),
    );
  }
}
