import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: TextField(
          decoration: InputDecoration(
            hintText: "Enter phone number",
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
