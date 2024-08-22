import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_class.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataClass(),
      child: MaterialApp(
        title: 'Hello World Demo Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProviderDemoScreen(),
      ),
    );
  }
}

class ProviderDemoScreen extends StatefulWidget {
  const ProviderDemoScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProviderDemoScreenState();
  }
}

class _ProviderDemoScreenState extends State<StatefulWidget> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Demo"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: postModel.loading
            ? const Center(child: LinearProgressIndicator())
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 20),
                      child: Text(
                        postModel.post?.title ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Text(postModel.post?.body ?? "")
                  ],
                ),
              ),
      ),
    );
  }
}
