import 'package:flutter/material.dart';
import 'global_wallet.dart' as globals;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes:{
      '/': (context) => HomeRoute(),
      '/second': (context) => Savings(),
      '/third': (context) => Earnings(),
      '/fourth': (context) => Spending(),
    },
  ));

}


class HomeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _HomeRouteState();
  }
}
class _HomeRouteState extends State<HomeRoute>{
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
            SizedBox(
              width: 400.0,
              height: 200.0,
              child: ElevatedButton(
                child: const Text('Savings'),
                onPressed: () {
                  Navigator.pushNamed(context,'/second');
                },
              ),
            ),
            const Text('',),

            SizedBox(
              width: 400.0,
              height: 200.0,
              child: ElevatedButton(
                child: const Text('Earnings'),
                onPressed: () {
                  Navigator.pushNamed(context,'/third');
                },
              ),
            ),
            const Text('',),

            SizedBox(
              width: 400.0,
              height: 200.0,
              child: ElevatedButton(
                child: const Text('Spending'),
                onPressed: () {
                  Navigator.pushNamed(context,'/fourth');
                },
              ),
            ),
            Text('Amount Earned: ${globals.wallet}'),
            Text('Amount Saved: ${globals.savings}')
          ],
        ),
      ),
    );
  }
}

class Savings extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _SavingsState();
  }
}

class _SavingsState extends State<Savings>{
  save5(value) {
    setState(() {
      globals.savings+=value;
    });
  }
  TextEditingController saveAmount = TextEditingController();
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Savings"),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context,'/');
              },
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('',),
            TextField(
              keyboardType: TextInputType.number,
              controller: saveAmount,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Save Amount',
              ),
            ),
            const Text('Lets Start Saving!',),
            SizedBox(
              width: 400.0,
              height: 100.0,
              child: ElevatedButton(
                child: const Text('Save'),
                onPressed: (){
                  double i=double.parse(saveAmount.text);
                  save5(i);
                }
              ),
            ),
            Text('Savings: ${globals.savings}')
          ],
        ),
      ),
    );
  }
}
class Earnings extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _EarningsState();
  }
}

class _EarningsState extends State<Earnings>{
  void earn5() {
    setState(() {
      globals.wallet+=5;
    });
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Earnings"),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context,'/');
              },
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('',),
            const Text('Lets Start Saving!',),
            SizedBox(
              width: 400.0,
              height: 100.0,
              child: ElevatedButton(
                child: const Text('Take Out The Trash'),
                onPressed: earn5,
              ),
            ),
            Text('Earned: ${globals.wallet}')
          ],
        ),
      ),
    );
  }
}

class Spending extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _SpendingState();
  }
}
class _SpendingState extends State<Spending>{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spending"),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context,'/');
              },
            );
          },
        ),
      ),
      body: const Text("Rewards!"),
    );
  }
}