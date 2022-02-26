import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  Widget build (BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: Text("Home"),
      ),
      body: ElevatedButton(
        child: Text('Savings'),
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => new Savings()),
          );
        }
      )
    );
  }
}

class Savings extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Savings"),
      ),
      body: Text("Your Savings: "),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter+=0.05;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RevUC.2022'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                child: Text('Completed', style:TextStyle(fontSize:20.0),),
                // color: Colors.blue,
                onPressed: _incrementCounter,
              )
            ),
            const Text('Take Out the Trash',),
            Text('$_counter', style: Theme.of(context).textTheme.headline4,),
            const Text('Clean Your Room',),
            Text('$_counter', style: Theme.of(context).textTheme.headline4,),
          ],
        ),
      ),
    );
  }
}
