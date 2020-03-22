import 'package:flutter/material.dart';

void main() {
  runApp(Dissmiss());
}

class Dissmiss extends StatelessWidget {
  final items = List<String>.generate(20, (i) => "Items ${i + 1}");
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Dismissing Items',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dismissing Items'),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Dismissible(
                key: Key(item),
                onDismissed: (direction) {
                  items.removeAt(index);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("$item dismissed"),
                  ));
                },
                background: Container(
                  color: Colors.red,
                ),
                child: ListTile(
                  title: Text("$item"),
                ),
              );
            }),
      ),
    );
  }
}
