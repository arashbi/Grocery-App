import 'package:f_groceries/blocs/cart/cart_bloc.dart';
import 'package:f_groceries/blocs/menu/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MenuBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (BuildContext context, state) {
        return (state is RestingState)
            ? _normal(context, state)
            : _seaching(context, state);
      },
    );
  }

  _normal(BuildContext context, RestingState state) {

    return AppBar(title: Text(state.title), actions: [
      IconButton(
        tooltip: 'Search',
        icon: const Icon(Icons.search),
        onPressed: () async {
          Provider.of<MenuBloc>(context).add(SearchStarted());
        },
      ),
      IconButton(
          tooltip: 'Sort', icon: const Icon(Icons.sort), onPressed: () {}),
      Stack(
        children: [
          IconButton(
            tooltip: 'Cart',
            icon: Icon(Icons.shopping_basket),
            onPressed: () {},
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
                    child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) => Text(
                        (state as Ready).products.length.toString(),
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 11.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )),
            ],
          ))
        ],
      )
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  _seaching(BuildContext context, MenuState state) {
    var controller = TextEditingController();
    controller.addListener(() {
      debugPrint(controller.value.text);
    });
    final ThemeData theme = Theme.of(context);
    return AppBar(
      title: TextField(
        style: theme.textTheme.headline6,
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "name...",
            hintStyle:
                theme.textTheme.headline6.copyWith(color: Colors.black12)),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Provider.of<MenuBloc>(context)
              .add(SearchUpdated(controller.text)),
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
