import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => MySetting(),
      child: MaterialApp(
        home: MyApp(),
      ),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<MySetting>(builder: (context, mySettings, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: mySettings.color,
          title: Text("Provider demo"),
        ),
        drawer: Drawer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      mySettings.changeText();
                      Navigator.pop(context);
                    },
                    child: Text('Change text')),
                ElevatedButton(
                    onPressed: () {
                      mySettings.changeColor();
                      Navigator.pop(context);
                    },
                    child: Text('Change color')),
              ],
            ),
          ),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    mySettings.changeText();
                  },
                  child: Text('Change text')),
              Text(mySettings.text)
            ],
          ),
        ),
      );
    });
  }
}

class MySetting extends ChangeNotifier {
  String text = 'Done';
  Color color = Colors.red;

  void changeText() {
    if (text == 'Hello') {
      text = 'World';
    } else {
      text = 'Hello';
    }
    notifyListeners();
  }

  void changeColor() {
    if (color == Colors.red) {
      color = Colors.green;
    } else {
      color = Colors.red;
    }
    notifyListeners();
  }
}
