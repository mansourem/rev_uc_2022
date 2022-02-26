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