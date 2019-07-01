import 'package:flutter/material.dart';

class ListItem {
  String title;
  String description;

  ListItem(this.title, this.description);
}

class ListPage extends StatefulWidget {
  final String data;

  ListPage({Key key, @required this.data}) : super(key: key);
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var items = [
    ListItem("Hello", "World"),
    ListItem("Hello", "World"),
    ListItem("Hello", "World"),
    ListItem("Hello", "World"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listing'),
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index].title}'),
              subtitle: Text('${items[index].description}'),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
