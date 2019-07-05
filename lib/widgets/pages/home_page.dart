import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../drawer.dart';
import '../../states/account_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final $account = Provider.of<AccountState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Routing App'),
      ),
      drawer: createDrawer(context),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'First Page',
              style: TextStyle(fontSize: 50),
            ),
            Text(
              'Login Status : ${$account.loggedIn}',
            ),
            $account.loggedIn
                ? RaisedButton(
                    child: Text('Logout'),
                    onPressed: Provider.of<AccountState>(context).logout,
                  )
                : RaisedButton(
                    child: Text('Login'),
                    onPressed: Provider.of<AccountState>(context).login,
                  ),
            $account.loggedIn
                ? RaisedButton(
                    child: Text('Go to second'),
                    onPressed: () => Navigator.of(context).pushNamed('/listing',
                        arguments: 'Hello there from the first page!'),
                  )
                : RaisedButton(
                    child: Text('Go to Login'),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
                  ),
            RaisedButton(
              child: Text("Run Background"),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text("Stop Background"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
