import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
  initialRoute: '/',
  routes:{
    '/': (context) => HomeRoute(),
    '/second': (context) => Savings(),
    '/third': (context) => Earnings(),
    '/fourth': (context) => Spending(),
  },
  ));
  double wallet=0;
}

class HomeRoute extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
        ElevatedButton(
        child: const Text('Savings'),
          onPressed: () {
            Navigator.pushNamed(context,'/second');
          },
        ),
            ElevatedButton(
              child: const Text('Earnings'),
              onPressed: () {
                Navigator.pushNamed(context,'/third');
              },
            ),
            ElevatedButton(
              child: const Text('Spending'),
              onPressed: () {
                Navigator.pushNamed(context,'/fourth');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Savings extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Savings"),
      ),
      body: const Text("Your Savings: "),
    );
  }
}

class Earnings extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Earnings"),
      ),
      body: const Text("Let's Earn!"),
    );
  }
}

class Spending extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spending"),
      ),
      body: const Text("Rewards!"),
    );
  }
}

double amount(double wall, double value){
  wall+=value;
  return wall;
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
