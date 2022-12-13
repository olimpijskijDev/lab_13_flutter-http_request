import 'package:flutter/material.dart';
import 'package:http_example/main_screen/homePage.dart';
import 'package:http_example/api_clients/api_client.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // ApiClient().getPosts();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
