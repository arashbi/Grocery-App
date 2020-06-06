import 'package:carousel_slider/carousel_slider.dart';
import 'package:f_groceries/app_bar.dart';
import 'package:f_groceries/blocs/categories/categories.dart';
import 'package:f_groceries/blocs/search/search.dart';
import 'package:f_groceries/help_screen.dart';
import 'package:f_groceries/logind_signup.dart';
import 'package:f_groceries/orderhistory_screen.dart';
import 'package:f_groceries/products_screen.dart';
import 'package:f_groceries/setting_screen.dart';
import 'package:f_groceries/blocs/featured_product_bloc.dart' as FeaturedProductBloc;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Account_screen.dart';
import 'model/data_model.dart';
import 'package:transparent_image/transparent_image.dart';


class HomeScreen extends StatelessWidget {

 static const double height = 366.0;
  final String name ='My Wishlist';
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
        theme.textTheme.headline.copyWith(color: Colors.black54);
    final TextStyle descriptionStyle = theme.textTheme.subhead;

    return _Scaffold();
  }

}
class _Scaffold extends StatelessWidget {
  final Icon keyloch = new Icon(
    Icons.arrow_forward,
    color: Colors.black26,
  );

  ShapeBorder shapeBorder;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MenuBar(),
      drawer: _Drawer(),
      body:
      SingleChildScrollView(
        child: Container(
          child: new Column(children: <Widget>[
            new Container(
              height: 188.0,
              margin: EdgeInsets.only(left: 5.0, top: 10),
              child:
                BlocProvider(
                  create: (context) => FeaturedProductBloc.Bloc(),
                  child: FeaturedCarousel(),
                )
//              ListView(scrollDirection: Axis.horizontal, children: <Widget>[
//                Container(
//                  width: 270.0,
//
//                  child: Card(
//                    shape: shapeBorder,
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        SizedBox(
//                          height: 180.0,
//                          child: Stack(
//                            children: <Widget>[
//                              Positioned.fill(
//                                child: Image.asset(
//                                  'images/grthre.jpg',
//                                  fit: BoxFit.cover,
//                                ),
//                              ),
//                            ],
//                          ),
//                        )
//
//                        /*Positioned(
//                        bottom: 16.0,
//                        left: 16.0,
//                        right: 16.0,
//                        child: FittedBox(
//                          fit: BoxFit.scaleDown,
//                          alignment: Alignment.centerLeft,
//                          child: Text('',
//                            style: titleStyle,
//                          ),
//                        ),
//                      ),*/
//                      ],
//                    ),
//                  ),
//                  // description and share/explore buttons
//                  // share, explore buttons
//                ),
//                SafeArea(
//                  top: true,
//                  bottom: true,
//                  child: Container(
//                    width: 270.0,
//
//                    child: Card(
//                      shape: shapeBorder,
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          SizedBox(
//                            height: 180.0,
//                            child: Stack(
//                              children: <Widget>[
//                                Positioned.fill(
//                                  child: Image.asset(
//                                    'images/grtwo.jpg',
//                                    fit: BoxFit.cover,
//                                  ),
//                                ),
//                              ],
//                            ),
//                          )
//
//                          /*Positioned(
//                          bottom: 16.0,
//                          left: 16.0,
//                          right: 16.0,
//                          child: FittedBox(
//                            fit: BoxFit.scaleDown,
//                            alignment: Alignment.centerLeft,
//                            child: Text('',
//                              style: titleStyle,
//                            ),
//                          ),
//                        ),*/
//                        ],
//                      ),
//                    ),
//                    // description and share/explore buttons
//                    // share, explore buttons
//                  ),
//                ),
//                SafeArea(
//                  top: true,
//                  bottom: true,
//                  child: Container(
//                    width: 270.0,
//
//                    child: Card(
//                      shape: shapeBorder,
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          SizedBox(
//                            height: 180.0,
//                            child: Stack(
//                              children: <Widget>[
//                                Positioned.fill(
//                                  child: Image.asset(
//                                    'images/groceries.jpg',
//                                    fit: BoxFit.cover,
//                                  ),
//                                ),
//                              ],
//                            ),
//                          )
//
//                          /*Positioned(
//                          bottom: 16.0,
//                          left: 16.0,
//                          right: 16.0,
//                          child: FittedBox(
//                            fit: BoxFit.scaleDown,
//                            alignment: Alignment.centerLeft,
//                            child: Text('',
//                              style: titleStyle,
//                            ),
//                          ),
//                        ),*/
//                        ],
//                      ),
//                    ),
//                    // description and share/explore buttons
//                    // share, explore buttons
//                  ),
//                ),
//                SafeArea(
//                  top: true,
//                  bottom: true,
//                  child: Container(
//                    width: 270.0,
//
//                    child: Card(
//                      shape: shapeBorder,
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          SizedBox(
//                            height: 180.0,
//                            child: Stack(
//                              children: <Widget>[
//                                Positioned.fill(
//                                  child: Image.asset(
//                                    'images/back.jpg',
//                                    fit: BoxFit.cover,
//                                  ),
//                                ),
//                              ],
//                            ),
//                          )
//
//                          /*Positioned(
//                          bottom: 16.0,
//                          left: 16.0,
//                          right: 16.0,
//                          child: FittedBox(
//                            fit: BoxFit.scaleDown,
//                            alignment: Alignment.centerLeft,
//                            child: Text('',
//                              style: titleStyle,
//                            ),
//                          ),
//                        ),*/
//                        ],
//                      ),
//                    ),
//                    // description and share/explore buttons
//                    // share, explore buttons
//                  ),
//                ),
//              ]),
            ),

            BlocProvider<CategoryBloc>(
                create: (context) => CategoryBloc(),
                child: BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) => CategoriesWrapperWidget(state)
            ))
          ]),
        ),
      ),
    );
  }

}

class _Drawer extends StatelessWidget {
  const _Drawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new Card(
            child: UserAccountsDrawerHeader(
              accountName: new Text("Naomi A. Schultz"),
              accountEmail: new Text("NaomiASchultz@armyspy.com"),
              onDetailsPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AccountScreen()));
              },
              decoration: new BoxDecoration(
                backgroundBlendMode: BlendMode.difference,
                color: Colors.white30,

                /* image: new DecorationImage(
             //   image: new ExactAssetImage('assets/images/lake.jpeg'),
                fit: BoxFit.cover,
              ),*/
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.fakenamegenerator.com/images/sil-female.png")),
            ),
          ),
          new Card(
            elevation: 4.0,
            child: new Column(
              children: <Widget>[
                new ListTile(
                    leading: Icon(Icons.favorite),
                    title: new Text("name"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductsScreen(toolbarName: "Toolbar",)));
                    }),
                new Divider(),
                new ListTile(
                    leading: Icon(Icons.history),
                    title: new Text("Order History "),


                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Oder_History(toolbarname: ' Order History',)));

                    }),
              ],
            ),
          ),
          new Card(
            elevation: 4.0,
            child: new Column(
              children: <Widget>[
                new ListTile(
                    leading: Icon(Icons.settings),
                    title: new Text("Setting"),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Setting_Screen(toolbarname: 'Setting',)));
                    }),
                new Divider(),
                new ListTile(
                    leading: Icon(Icons.help),
                    title: new Text("Help"),
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Help_Screen(toolbarname: 'Help',)));

                    }),
              ],
            ),
          ),
          new Card(
            elevation: 4.0,
            child: new ListTile(
                leading: Icon(Icons.power_settings_new),
                title: new Text(
                  "Logout",
                  style:
                  new TextStyle(color: Colors.redAccent, fontSize: 17.0),
                ),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Login_Screen()));
                }),
          )
        ],
      ),
    );
  }
}

class CategoriesWrapperWidget extends StatelessWidget {
  final CategoryState state;


  CategoriesWrapperWidget(this.state);

  @override
  Widget build(BuildContext context) {
    if( state is Loaded) {
      return CategoriesWidget(state: state);
    } else if (state is Failed) {
      return SizedBox(
          height: 200.0,
          child: Center(child: Text("${(state as Failed).reason}", style:  Theme.of(context).textTheme.headline6,)));
    } else if ( state is Loading) {
      return SizedBox(
          height: 100.0,
          child: Center(child: CircularProgressIndicator()));
    }
    debugPrint("state is $state");
    assert(false);
  }
}
class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key key,
    @required this.state,
  }) : super(key: key);

  final Loaded state;

  @override
  Widget build(BuildContext context) {
    return Container(
              alignment: Alignment.topCenter,
              height: 700.0,

              child: new GridView.builder(
      itemCount: state.categories.length,
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10.0),
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return CategoryWidget( category: state.categories[index]);
      }),
            );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key key,
    @required this.category,
  }) : super(key: key);

  final CategoryDto category;

  @override
  Widget build(BuildContext context) {

    return new Container(
        margin: EdgeInsets.all(5.0),
        child: new Card(
          elevation: 3.0,
          child: new Container(
            //  mainAxisSize: MainAxisSize.max,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 152.0,
                  child: CategoryCard(category: category),
                ),

                 new Text(category.name, style: TextStyle(
                     fontSize: 18.0,
                     color: Colors.black87,
                     fontWeight:
                     FontWeight.bold),
                 )
              ],
            ),
          ),
        )
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.category,
  }) : super(key: key);

  final CategoryDto category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: WidgetImage(category: category)),
        Container(
          color: Colors.black38,
        ),
        Container(
          //margin: EdgeInsets.only(left: 10.0),
          padding: EdgeInsets.only(
              left: 3.0, bottom: 3.0),
          alignment: Alignment.bottomLeft,
          child: new GestureDetector(
            onTap: () {
              BlocProvider.of<SearchBloc>(context).add(Search(SearchCriteria((b)=> b..category = category.id.toString())));
              debugPrint("category is ${category.id}");
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductsScreen(toolbarName: category.name,)));
            },

          ),
        ),

        /*Positioned(
                    child: FittedBox(

                     fit: BoxFit.fill,
    alignment: Alignment.centerLeft,
    child: Text(photos[index].title,
      style: TextStyle(color: Colors.black87,fontSize: 15.0),
    ),

                  )
                  )*/
      ],
    );
  }
}

class WidgetImage extends StatelessWidget {
  const WidgetImage({
    Key key,
    @required this.category,
  }) : super(key: key);

  final CategoryDto category;

  @override
  Widget build(BuildContext context) {
    return category.image != null ? FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
          image: category.image.src,
          fit: BoxFit.fitHeight,
        ) : Text(category.name.substring(0,1), textScaleFactor: 10.0,);
  }
}


class FeaturedCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedProductBloc.Bloc, FeaturedProductBloc.FeaturedProductState>(
      builder: (context, state) {
        if (state is FeaturedProductBloc.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FeaturedProductBloc.Failed) {
          return Text("Loading Feature products Failed");
        } else if ( state is FeaturedProductBloc.Ready) {
          return Container(
            child: CarouselSlider(
                options: CarouselOptions(autoPlay: true),
                items: state.products.map((product) => _CarouselSlide(product)).toList()
            ),
          );
        } else {
          return Container();
        }
      }
    );
  }
  
}

class _CarouselSlide extends StatelessWidget {
  final ProductDto _product;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Stack(
          children: [
            FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: _product.images[0].src,
                fit:  BoxFit.fill,
            )
          ],
        ),
      ),
    );
  }

  _CarouselSlide(this._product);
}
