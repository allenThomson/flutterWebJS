import 'dart:js' as js;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Function to set user attribute using WebEngage JavaScript function
  void setWebEngageUserAttribute(String key, String value) {
    js.context['webengage']['user'].callMethod('setAttribute', [key, value]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web JavaScript Integration',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Web JavaScript Integration'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Call the JavaScript function to set a user attribute
                  setWebEngageUserAttribute('we_email', 'john@doe.com');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('User attribute set via JavaScript!')),
                  );
                },
                child: Text('Set User Attribute'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
