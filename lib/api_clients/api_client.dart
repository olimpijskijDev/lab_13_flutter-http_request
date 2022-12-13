import 'dart:convert';
import 'dart:io';
import '../http/post.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Post>> getPosts() async {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/users/1/posts');

    // try {
    final request = await client.getUrl(uri);
    final responce = await request.close();

    final jsonStrings = await responce.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as List<dynamic>;
    final posts =
        json.map((e) => Post.fromJson(e as Map<String, dynamic>)).toList();
    // print(posts);
    return posts;
    // } catch (error) {
    // print(error);
    // }
  }

  Future<Post> createPost({required String title, required String body}) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final parameters = <String, dynamic>{
      'title': title,
      'body': body,
      'userId': 109
    };
    final request = await client.postUrl(url);
    request.headers.set('Content-type', 'application/json; charset=UTF-8');
    request.write(jsonEncode(parameters));
    final responce = await request.close();
    final jsonStrings = await responce.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final post = Post.fromJson(json);
    return post;
  }
}
