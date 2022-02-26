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
            const Text('',),
            new SizedBox(
              width: 400.0,
              height: 200.0,
              child: ElevatedButton(
                child: Text('Savings'),
                onPressed: () {
                  Navigator.pushNamed(context,'/second');
                },
              ),
            ),
            const Text('',),

            new SizedBox(
              width: 400.0,
              height: 200.0,
              child: ElevatedButton(
                child: Text('Earnings'),
                onPressed: () {
                  Navigator.pushNamed(context,'/third');
                },
              ),
            ),
            const Text('',),

            new SizedBox(
              width: 400.0,
              height: 200.0,
              child: ElevatedButton(
                child: Text('Spending'),
                onPressed: () {
                  Navigator.pushNamed(context,'/fourth');
                },
              ),
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

// Column is also a layout widget. It takes a list of children and
// arranges them vertically. By default, it sizes itself to fit its
// children horizontally, and tries to be as tall as its parent.
//
// Invoke "debug painting" (press "p" in the console, choose the
// "Toggle Debug Paint" action from the Flutter Inspector in Android
// Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
// to see the wireframe for each widget.
//
// Column has various properties to control how it sizes itself and
// how it positions its children. Here we use mainAxisAlignment to
// center the children vertically; the main axis here is the vertical
// axis because Columns are vertical (the cross axis would be
// horizontal).
