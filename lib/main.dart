import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parent_kids_finance/auth.dart';
import 'firebase_options.dart';
import 'global_wallet.dart' as globals;
import 'info_text.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  print('-- WidgetsFlutterBinding.ensureInitialized');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  print('-- main: Firebase.initializeApp');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes:{
      '/': (context) => LoginPage(),
      '/home': (context) => HomeRoute(),
      '/second': (context) => Savings(),
      '/third': (context) => Earnings(),
      '/fourth': (context) => Spending(),
      '/fifth':(context) => Info(),
    },
  ));

}
class HomeRoute extends StatefulWidget {
  const HomeRoute({Key? key}) : super(key: key);

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
        automaticallyImplyLeading: false,
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
                child: const Text('Checking Account', style: TextStyle(fontSize: 24.0),),
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
                child: const Text('Savings Account', style: TextStyle(fontSize: 24.0),),
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
                child: const Text('Spend', style: TextStyle(fontSize: 24.0),),
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

Widget _buildPopupDialog(BuildContext context, value) {
  return AlertDialog(
    title: const Text('Money Tip'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Recommend Amount To Save: \$${value/2}"),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        //textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}

class Savings extends StatefulWidget{
  const Savings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return _SavingsState();
  }
}

class _SavingsState extends State<Savings>{
  void save(amount) {
    double amountDiff = globals.wallet - amount;
    if (amountDiff >= 0)
    {
      setState(() {
        globals.savings+=amount;
        globals.wallet-=amount;
      });
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid Amount"),));
    }
  }
  TextEditingController saveAmount = TextEditingController();
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Savings Account"),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context,'/home');
              },
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('',),
            const Text('Let\'s Start Saving!', style: TextStyle(fontSize: 20.0)),
            const Text('',),
            SizedBox(
              width:400.0,
              height:50.0,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: saveAmount,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Save Amount',
                ),
              ),
            ),
            SizedBox(
              width: 400.0,
              height: 30.0,
              child: ElevatedButton(
                  child: const Text('Save',style: TextStyle(fontSize: 16.0),),
                  onPressed: (){
                    double i=double.parse(saveAmount.text);
                    save(i);
                  }
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

class Earnings extends StatefulWidget{
  const Earnings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return _EarningsState();
  }
}
class _EarningsState extends State<Earnings>{
  earn(value) {
    setState(() {
      globals.wallet+=value;
    },
    );
    showDialog(
      context: context,
      builder: (BuildContext context) => _buildPopupDialog(context,value),
    );
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checking Account"),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context,'/home');
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
            const Text('',),
            SizedBox(
              width: 400.0,
              height: 100.0,
              child: ElevatedButton(
                  child: const Text('Take Out The Trash - \$2.5',style: TextStyle(fontSize:24.0),),
                  onPressed: (){
                    earn(2.5);}
              ),
            ),
            const Text('',),
            SizedBox(
              width: 400.0,
              height: 100.0,
              child: ElevatedButton(
                  child: const Text('Clean Your Room - \$10',style: TextStyle(fontSize:24.0),),
                  onPressed: () {
                    earn(10);}
              ),
            ),
            const Text('',),
            SizedBox(
              width: 400.0,
              height: 100.0,
              child: ElevatedButton(
                  child: const Text('Do the Dishes - \$5',style: TextStyle(fontSize:24.0),),
                  onPressed: (){
                    earn(5);}
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

class Spending extends StatefulWidget{
  const Spending({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return _SpendingState();
  }
}
class _SpendingState extends State<Spending>{
  void spend(amount) {
    double amountDiff = globals.wallet - amount;
    if (amountDiff >= 0)
    {
      setState(() {
        globals.wallet-=amount;
      });
    }
    else
    {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Not Enough Earned"),));
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
                Navigator.pushNamed(context,'/home');
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
            const Text('',),
            SizedBox(
              width: 400.0,
              height: 100.0,
              child: ElevatedButton(
                child: const Text('TV Time! - \$5', style: TextStyle(fontSize: 24.0)),
                onPressed: (){
                  spend(5);
                },
              ),
            ),
            const Text(''),
            SizedBox(
              width: 400.0,
              height: 100.0,
              child: ElevatedButton(
                child: const Text('Sweet Treat! - \$10', style:TextStyle(fontSize: 24.0)),
                onPressed: (){
                  spend(10);
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

// ignore: use_key_in_widget_constructors
class Info extends StatelessWidget{
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
                Navigator.pushNamed(context,'/home');
              },
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('',),
            Text(heading1, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text(heading1_body1, style: const TextStyle(fontSize: 14, ),),
            const Text('',),
            const Text('',),
            Text(heading2, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text(heading2_body1, style: const TextStyle(fontSize: 14, ),),
            const Text('',),
            const Text('',),
            Text(heading3, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text(heading3_body1, style: const TextStyle(fontSize: 14,),),
            const Text('',),
            const Text('',),
            Text(heading4, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text(heading4_body1, style: const TextStyle(fontSize: 14,),),
            const Text('',),
            const Text('',),
            Text(heading5, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text(heading5_body1, style: const TextStyle(fontSize: 14,),)
          ],
        ),
      ),
    );
  }
}
