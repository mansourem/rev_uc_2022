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
      '/fifth':(context) => Info(),
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
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.pushNamed(context,'/fifth');
        },
        child: const Icon(Icons.info_outline),
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
            const Text(''),
            Text('Amount Earned: \$${globals.wallet}', style: const TextStyle(fontSize: 24.0)),
            Text('Amount Saved: \$${globals.savings}', style: const TextStyle(fontSize: 24.0))
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
  void save5(amount) {
    double amount_diff = globals.wallet - amount;
    if (amount_diff >= 0)
    {
      setState(() {
        globals.savings+=amount;
        globals.wallet-=amount;
      });
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Amount"),));
    }
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
            const Text('',),
            const Text('Let\'s Start Saving!', style: TextStyle(fontSize: 20.0)),
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
            Text('Savings: \$${globals.savings}')
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
            const Text('Let\'s Earn Some Money!', style: TextStyle(fontSize: 20.0)),
            SizedBox(
              width: 400.0,
              height: 100.0,
              child: ElevatedButton(
                child: const Text('\$5    Take Out The Trash'),
                onPressed: earn5,
              ),
            ),
            const Text('',),
            SizedBox(
              width: 400.0,
              height: 100.0,
              child: ElevatedButton(
                child: const Text('\$5    Mop the Floor'),
                onPressed: earn5,
              ),
            ),
            const Text('',),
            SizedBox(
              width: 400.0,
              height: 100.0,
              child: ElevatedButton(
                child: const Text('\$5    Do Something'),
                onPressed: earn5,
              ),
            ),
            Text('Earned: \$${globals.wallet}')
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
  void spend(amount) {
    double amount_diff = globals.wallet - amount;
    if (amount_diff >= 0)
    {
      setState(() {
        globals.wallet-=amount;
      });
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Not Enough Earned"),));
    }
  }
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
    body: Center(
      child: Column(
        children: <Widget>[
          const Text('',),
          const Text('Rewards!', style: TextStyle(fontSize: 20.0)),
          Text('Earned: \$${globals.wallet}'),
          const Text('',),
          const Text('Lets Start Spending!',),
          SizedBox(
            width: 400.0,
            height: 100.0,
            child: ElevatedButton(
              child: const Text('TV Time! - \$5'),
                onPressed: (){
                  spend(5);
                },
            ),
          ),
          Text('Earned: ${globals.wallet}')
        ],
      ),
    ),
    );
  }
}

class Info extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _InfoState();
  }
}
class _InfoState extends State<Info>{
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info"),
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
            const Text('Rewards!', style: TextStyle(fontSize: 20.0)),

            Text('Earned: \$${globals.wallet}')
          ],
        ),
      ),
    );
  }
}