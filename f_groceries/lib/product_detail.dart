import 'package:f_groceries/cart_screen.dart';
import 'package:f_groceries/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDto product;

  ProductDetailScreen({this.product});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final ThemeData theme = Theme.of(context);

    final TextStyle descriptionStyle = theme.textTheme.subtitle1;
    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
        default:
          return Icons.arrow_back;
      }
    }

    IconData _addIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.add_circle;
        case TargetPlatform.iOS:
          return Icons.add_circle;
        default:
          return Icons.add_circle;
      }
    }

    IconData _subIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.remove_circle;
        case TargetPlatform.iOS:
          return Icons.remove_circle;
        default:
          return Icons.remove_circle;
      }
    }

    return new Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(_backIcon()),
            alignment: Alignment.centerLeft,
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(product.name),
          backgroundColor: Colors.white,
          actions: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(10.0),
              child: new Container(
                height: 150.0,
                width: 30.0,
                child: new GestureDetector(
                  onTap: () {
                    /*Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder:(BuildContext context) =>
                      new CartItemsScreen()
                  )
              );*/
                  },
                ),
              ),
            )
          ],
        ),
        body: Container(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Card(
                elevation: 4.0,
                child: Container(
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // photo and title
                        SizedBox(
                          height: 250.0,
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              new Container(
                                child: new Carousel(
                                  images: product.images
                                      .map((image) => NetworkImage(
                                            image.src,
                                            // package: destination.assetPackage,
                                          ))
                                      .toList(),
                                  boxFit: BoxFit.scaleDown,
                                  showIndicator: false,
                                  autoplay: false,
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: DefaultTextStyle(
                      style: descriptionStyle,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // three line description
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              product.name,
                              style: descriptionStyle.copyWith(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              product.price,
                              style: descriptionStyle.copyWith(
                                  fontSize: 20.0, color: Colors.black54),
                            ),
                          ),
                        ],
                      ))),
              Container(
                  margin: EdgeInsets.all(10.0),
                  child: Card(
                      child: Container(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
                          child: DefaultTextStyle(
                              style: descriptionStyle,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  // three line description
                                  Row(
                                    children: <Widget>[
                                      new IconButton(
                                        icon: Icon(_addIcon(),
                                            color: Colors.amber.shade500),
                                        onPressed: () {
//                                            item = item + 1;
                                        },
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 2.0),
                                      ),
                                      Text(
                                        "item",
                                        style: descriptionStyle.copyWith(
                                            fontSize: 20.0,
                                            color: Colors.black87),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 2.0),
                                      ),
                                      new IconButton(
                                        icon: Icon(_subIcon(),
                                            color: Colors.amber.shade500),
                                        onPressed: () {
//                                          if(item<0){
//
//                                          }
//                                          else{
//                                            item = item -1;
//                                          }
                                        },
                                      ),
                                    ],
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: OutlineButton(
                                          borderSide: BorderSide(
                                              color: Colors.amber.shade500),
                                          child: const Text('Add'),
                                          textColor: Colors.amber.shade500,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Cart_screen()));
                                          },
                                          shape: new OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          )),
                                    ),
                                  ),
                                ],
                              ))))),
              Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: DefaultTextStyle(
                      style: descriptionStyle,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // three line description
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'Details',
                              style: descriptionStyle.copyWith(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ),
                        ],
                      ))),
              Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
                  child: Html(
                    data: product.description,
                  )),
            ]))));
  }
}
