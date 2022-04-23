import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingcart_with_riverpod/constants/app_strings.dart';
import 'package:shoppingcart_with_riverpod/core/modal/cart_screen_input.dart';
import 'package:shoppingcart_with_riverpod/ui/widgets/cart_badge.dart';
import 'package:shoppingcart_with_riverpod/ui/widgets/dropdownbutton.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int apiCalled = 0;
  int apiCompleted = 0;
  List<String> categoryList = [];
  List? itemList;
  List selectedItemList = [];
  String selectedCategory = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppStrings.appTitle,
          ),
          centerTitle: true,

          // actions: [
          // CartBadge(

          // cartScreenInput: CartScreenInput(
          //   removeFromCart: removeFromCart,
          //   resetCart: resetCart,
          //   selectedProducts: selectedItemList,
          //
          // ),
          // )

          // ],

          // leading: Badge(
          //   position: BadgePosition.topEnd(top: 10, end: 10),
          //   badgeContent: null,
          //   child: IconButton(
          //     icon: Icon(Icons.add_shopping_cart),
          //     onPressed: () {},
          //   ),
          // )
        ),
        body: Container(
          height: 62,
          decoration: BoxDecoration(
            color: Colors.greenAccent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppStrings.categories,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ),
              DropDownMenu()
            ],
          ),
        ));
  }
}

// http: ^0.13.4
// flutter_easyloading: ^3.0.3
// badges: ^2.0.2
// rflutter_alert: ^2.0.4
