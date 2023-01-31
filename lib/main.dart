import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'bnb_methods_sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //カウンターから-1する
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  //カウンターから+1する
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //BottomNavigationBarのindexを使って、実行するメソッドを切り替える
  void methodSwitcher(int index) {
    switch (index) {
      case 0:
        //indexが0の場合、_counterを-1する
        _decrementCounter();
        break;
      case 1:
        //indexが1の場合、_counterを+1する
        _incrementCounter();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '-1と+1でカウンターを操作できます:'
              '',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: methodSwitcher,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.exposure_minus_1), label: "引く"),
          BottomNavigationBarItem(icon: Icon(Icons.plus_one), label: "足す"),
        ],
      ),
    );
  }
}
