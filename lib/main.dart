import 'package:demo/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/counter.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => MySettings()),
      ChangeNotifierProvider(create: (_) => Counter())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: context.watch<MySettings>().isDark
            ? Brightness.dark
            : Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Provider'),
        actions: [
          Switch(
              value: context.watch<MySettings>().isDark,
              onChanged: (newValue) {
                // context.read<MySettings>().setBrightness(newValue);
                Provider.of<MySettings>(context, listen: false)
                    .setBrightness(newValue);
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              context.watch<Counter>().myCounter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<Counter>().add();
        },
      ),
    );
  }
}