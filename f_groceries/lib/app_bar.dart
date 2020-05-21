import 'package:f_groceries/model/menu_bar_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MenuBarModel>(
      builder: (BuildContext context, MenuBarModel model, Widget child) {
        return !model.searching ? _normal(context, model) : _seaching(context, model);
      },
    );
  }
  _normal (BuildContext context, MenuBarModel model) {

    return AppBar(
        title: Text(model.title),
        actions: [
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              model.searching = true;
            },
          ),
          IconButton(
              tooltip: 'Sort',
              icon: const Icon(Icons.sort),
              onPressed: () {}
          ),
          Stack(
            children: [
              IconButton(
                tooltip: 'Cart',
                icon: Icon(Icons.shopping_basket),
                onPressed: (){},
              ),
              Positioned(
                  child: new Stack(
                    children: <Widget>[
                      Icon(Icons.brightness_1,
                          size: 20.0, color: Colors.orange.shade500),
                      Positioned(
                          top: 4.0,
                          right: 5.5,
                          child: new Center(
                            child: new Text(
                              model.purchaseCount.toString(),
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          )),

                    ],
                  )
              )
            ],
          )]);
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  _seaching(BuildContext context, MenuBarModel model) {
    var controller = TextEditingController();
    controller.addListener(() {
      debugPrint(controller.value.text);
    });
    final ThemeData theme = Theme.of(context);
    return AppBar(
      title:
        TextField(
          style: theme.textTheme.headline6,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText:"name...",
            hintStyle: theme.textTheme.headline6.copyWith(color: Colors.black12)
          ),
        ),
      actions: [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () => model.searching = false,
        )
      ],
    );
  }
}
class _CustomSearchHintDelegate extends SearchDelegate<String> {
  _CustomSearchHintDelegate({
    String hintText,
  }) : super(
    searchFieldLabel: hintText,
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
  );


  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    //Add the search term to the searchBloc.
    //The Bloc will then handle the searching and add the results to the searchResults stream.
    //This is the equivalent of submitting the search term to whatever search service you are using

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}