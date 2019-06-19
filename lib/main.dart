import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'router.dart';
import 'widgets/pages/first_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstPage(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
