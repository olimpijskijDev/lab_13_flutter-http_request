import 'package:flutter/material.dart';
import 'package:http_example/api_clients/api_client.dart';
import 'package:http_example/example/example_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final model = ExampleWidgetModel();

  void onPressed() {
    // _DisplayPosts();
  }

  @override
  Widget build(BuildContext context) {
    final model = ExampleWidgetModel();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ExampleModelProvider(
        model: model,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const _ReloadButton(),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: _PostsWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () =>
            ExampleModelProvider.read(context)?.model.reloadPosts(),
        child: const Text('Обновить посты'));
  }
}

class _PostsWidget extends StatelessWidget {
  const _PostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ExampleModelProvider.watch(context)?.model.posts.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return _PostsRowWidget(index: index);
      },
    );
  }
}

class _PostsRowWidget extends StatelessWidget {
  final int index;
  const _PostsRowWidget({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    final post = ExampleModelProvider.read(context)!.model.posts[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(post.id.toString()),
        const SizedBox(height: 10),
        Text(post.title.toString()),
        const SizedBox(height: 10),
        Text(post.body.toString()),
        const SizedBox(height: 10),
      ],
    );
  }
}
