import 'package:flutter/material.dart';
import 'package:flutter_listing_app/states/account_state.dart';
import 'package:flutter_listing_app/states/theme_state.dart';
import 'package:provider/provider.dart';

import 'router.dart';
import 'widgets/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final themeState = ThemeState();
  final accountState = AccountState();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => themeState),
        ChangeNotifierProvider(builder: (_) => accountState),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: themeState.appTheme.brightness,
          primaryColor: themeState.appTheme.primarySwatch,
        ),
        home: HomePage(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
