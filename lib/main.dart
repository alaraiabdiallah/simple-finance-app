import 'package:flutter/material.dart';
import 'data/dummy.dart';
import 'models/account.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Dashboard'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
        leading: _appBarLeading(),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            BalanceContainer(balance: "1.300.000"),
            AccountList(accounts:accounts),
            LastTransaction()
          ],
        ),
      ),
    );
  }


  Widget _appBarLeading(){
    return IconButton(
          color: Colors.black,
          icon: Icon(Icons.menu),
          onPressed: () {
            print("menu pressed");
          },
    );
  }

}

class LastTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Padding(
            padding: EdgeInsets.all(5),
            child: Text("Lastest transaction", style: TextStyle(fontSize: 21)),
          ),
        ],
      ),
    );
  }

}

class AccountList extends StatelessWidget {

  AccountList({List<Account> accounts});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(2, 10, 2, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Text("List of Account", style: TextStyle(fontSize: 21)),
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: accounts.length,
              itemBuilder: (ctx,pos){
                return _accountItem(accounts[pos]);
              },
            )
          )
        ],
      ),
    );
  }

  Widget _accountItem(Account account){
    BoxConstraints constraints = BoxConstraints(
      maxWidth: 100,
      maxHeight: 100
    );

    return Card(
        child: new InkWell(
          onTap: (){
            print("Tapped");
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(5,10,5,10),
            constraints: constraints,
            width: 100,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(account.name),
                Text(account.amount.toString()),
              ],
            ),
          ),
        )
    );
  }

}

class BalanceContainer extends StatelessWidget {
  BalanceContainer({Key key, this.balance}) : super(key: key);

  final String balance;

  BoxConstraints constraints = BoxConstraints(
    minHeight: 150,
    maxHeight: 200
  );

  BoxDecoration boxDecor = BoxDecoration(
    color: Colors.lightBlue,
    boxShadow: [
      new BoxShadow(
        color: Colors.grey,
        blurRadius: 5,
        offset: new Offset(0, 1)
      ),
    ]
  );
    
  Column content(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Current Balance", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
        Text("Rp. ${balance}", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
      ],
    );
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      decoration: boxDecor,
      child: content(),
    );
  }
}