import 'package:flutter/material.dart';
import 'package:http_example/api_clients/api_client.dart';

import '../http/post.dart';

class ExampleWidgetModel extends ChangeNotifier {
  final apiClient = ApiClient();
  var _posts = const <Post>[];

  List<Post> get posts => _posts;

  Future<void> reloadPosts() async {
    final listPosts = await apiClient.getPosts();
    _posts += listPosts;
    notifyListeners();
  }

  void createPosts() async {
    final listPosts = await apiClient.createPost(
      title: 'sdsd',
      body: 'sdsd',
    );
  }
}

class ExampleModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;
  const ExampleModelProvider(
      {required this.model, Key? key, required Widget child})
      : super(key: key, child: child, notifier: model);

  static ExampleModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ExampleModelProvider>();
  }

  static ExampleModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ExampleModelProvider>()
        ?.widget;
    return widget is ExampleModelProvider ? widget : null;
  }
}
