import 'package:flutter/material.dart';

import 'package:finance/data/dummy.dart';
import 'package:finance/models/account.dart';
import 'package:finance/models/transaction.dart';
import 'package:finance/helpers/moneyformat.dart';

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            color: Colors.black,
            onPressed: (){
              print("Bell Tapped");
            },
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            AccountList(accounts:accounts),
            BalanceContainer(balance: 1300000),
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
class BalanceContainer extends StatelessWidget {
  BalanceContainer({Key key, this.balance}) : super(key: key);

  final double balance;

  BoxConstraints constraints = BoxConstraints(
    minHeight: 75,
    maxHeight: 125
  );

  BoxDecoration boxDecor = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      new BoxShadow(
        color: Colors.grey,
        blurRadius: 1,
        offset: new Offset(0, 2)
      ),
      new BoxShadow(
        color: Colors.grey,
        blurRadius: 2,
        offset: new Offset(0, 1)
      ),
    ]
  );
    
  Column content(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(moneyFormat(balance), style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
        Padding(
          padding: EdgeInsets.only(
            top: 10
          ),
          child: Text("Total Balance", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        ),
      ],
    );
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      constraints: constraints,
      decoration: boxDecor,
      child: content(),
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
            padding: EdgeInsets.fromLTRB(5,20,5,20),
            child: Text("List of Account", style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700, fontFamily: 'Raleway Black')),
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
      maxWidth: 120,
      maxHeight: 80
    );

   List<Color> colors;

   if (account.color == "blue") {
     colors = [
      Colors.blue[400],
      Colors.blue[300],
      Colors.blue[200],
    ];
   }else if(account.color == "green"){
     colors = [
      Colors.green[400],
      Colors.green[300],
      Colors.green[200]
    ];
   }else if(account.color == "red"){
     colors = [
      Colors.red[400],
      Colors.red[300],
      Colors.red[200]
    ];
   }else{
     colors = [
      Colors.grey[400],
      Colors.grey[200]
    ];
   }

    BoxDecoration cardDecor = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: colors
      ),
    );


    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        child: new InkWell(
          onTap: (){
            print("Tapped");
          },
          child: Container(
            decoration: cardDecor,
            padding: EdgeInsets.all(15),
            constraints: constraints,
            width: 120,
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(account.name,style: TextStyle(color: Colors.white)),
                Text(moneyFormat(account.amount), style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        )
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
            padding: EdgeInsets.fromLTRB(5,20,5,20),
            child: Text("Lastest transaction", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, fontFamily: 'Raleway Black')),
          ),
          _listOfTransaction()
        ],
      ),
    );
  }

  Widget _listOfTransaction(){
    return Container(
      height: 250,
      child: ListView.builder(
        itemCount: trxs.length,
        itemBuilder: (ctx, pos){
          return trxItem(trxs[pos]);
        },
      ),
    );
  }

  Widget trxItem(Transaction trx){
    return Card(
        child: new InkWell(
          onTap: (){
            print("Tapped");
          },
          child: Container(
            width: double.infinity,
            height: 100,
            child: Row(
              children: <Widget>[
                Expanded(flex: 1,child: trxType(trx)),
                Expanded(
                  flex: 2,
                  child: trxText(trx),
                ),
                trxDet(trx)
              ],
            )
          ),
        )
    );
  }

  Widget trxDet(Transaction trx){
    return Padding(
      padding: EdgeInsets.only(
        right: 5
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("3 days ago"),
          Text(moneyFormat(trx.amount))
        ],
      )
    );
  }

  Widget trxType(Transaction trx){
    Color color;
    IconData icon;
    if(trx.type == "Income"){
      color = Colors.green;
      icon  = Icons.attach_money;
    }else{
      color = Colors.redAccent;
      icon  = Icons.compare_arrows;
    }
    return Container(
      margin: EdgeInsets.only(
        right: 10
      ),
      decoration: new BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3),
          bottomLeft: Radius.circular(3)
        )
      ),
      height: double.infinity,
      child: Icon(icon,size: 40),
    );
  }

  Widget trxText(Transaction trx){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(trx.name, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold 
        )),
        Text(trx.accountName),
      ],
    );
  }

}
