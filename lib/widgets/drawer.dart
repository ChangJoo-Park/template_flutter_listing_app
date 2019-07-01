import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/account_state.dart';

/// createDrawer need [context] for navigate other pages.
/// Must need [context]
Drawer createDrawer(BuildContext context) {
  final $account = Provider.of<AccountState>(context);
  return $account.loggedIn
      ? createUserAccountDrawer(context, $account)
      : createGuestDrawer(context);
}

Drawer createUserAccountDrawer(BuildContext context, AccountState account) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text("pcjpcj2@gmail.com"),
          accountName: Text("ChangJoo Park"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              "https://images.clipartlogo.com/files/images/32/325521/mushroom-vector-power_f.png",
            ),
          ),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          title: Text('Second Page'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushNamed('/second', arguments: "Hello there, from HomePage");
          },
        ),
        ListTile(
          title: Text('Logout'),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Logout?"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Logout"),
                        onPressed: () {
                          account.logout();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text("Cancel"),
                        onPressed: () => Navigator.of(context).pop,
                      ),
                    ],
                  );
                });
          },
        ),
      ],
    ),
  );
}

Drawer createGuestDrawer(BuildContext context) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            'Please Sign In',
            style: TextStyle(fontSize: 20),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Login'),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/login');
          },
        ),
      ],
    ),
  );
}
