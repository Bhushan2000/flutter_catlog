import 'package:flutter/material.dart';
import 'package:flutter_catlog/core/store.dart';
import 'package:flutter_catlog/pages/cart_page.dart';
import 'package:flutter_catlog/pages/home_details_page.dart';
import 'package:flutter_catlog/pages/home_page.dart';
import 'package:flutter_catlog/pages/login_page.dart';
import 'package:flutter_catlog/utils/routes.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    VxState(
      store: MyStore(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context basically a piece of info. that gives the position of widget inside widget tree.

    // navigator 2.0
    return MaterialApp.router(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      darkTheme: MyTheme.darkTheme(context),
      theme: MyTheme.lightTheme(context),

      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          "/": (_, s) => MaterialPage(child: LoginPage()),
          MyRoutes.homeRoute: (_, s) => MaterialPage(child: HomePage()),
          MyRoutes.homeDetailsRoute: (uri, _) {
            final catalog = (VxState.store as MyStore)
                .catalog!
                .getByID(int.parse(uri.queryParameters["id"].toString()));

            return MaterialPage(
                child: HomeDetailsPage(
              catalog:
                  catalog, // params means we pass catalog to the homedetails page from catalog list
            ));
          },

          MyRoutes.loginRoute: (_, s) => MaterialPage(child: LoginPage()),
          MyRoutes.cartRoute: (_, s) => MaterialPage(
              child: CartPage()), // s is noting to sense i.e., blank
        },
      ),

      // initialRoute: MyRoutes.loginRoute, //by default it is "/" but you can
      // routes: {
      //   // by default route is => "/" but if you already declare "Page" in MaterialApp() widget and here also then it gives error
      //   // you can either give default route here or inside MaterialApp() widget
      //   // if both declare then it gives error

      //   MyRoutes.homeRoute: (context) => HomePage(), // by default
      //   MyRoutes.loginRoute: (context) => LoginPage(),
      //   MyRoutes.cartRoute: (context) => CartPage(),
      // },
    );
  }

  // bringVegitables({@required bool thaila = false, int rupees = 100}) {
  //   // this an example of method
  //   // inside this curly braces it is optional
  //   // when we call this method anywhere then,the parameter is not give compulsory then it assume it as default i.e., the values inside curly braces
  //   // if @required is given then only we need to give parameter value when method is called.

  // }
}
