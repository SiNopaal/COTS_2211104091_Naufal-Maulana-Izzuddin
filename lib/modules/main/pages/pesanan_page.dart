import 'package:flutter/material.dart';

class PesananPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pesanan"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.fastfood),
            title: Text("Ayam Bensu"),
            subtitle: Text("Kedjendralan"),
            trailing: Text("Rp25,000"),
          ),
        ],
      ),
    );
  }
}
