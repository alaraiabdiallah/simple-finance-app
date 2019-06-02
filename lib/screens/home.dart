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
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            BalanceContainer(balance: 1300000),
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
            child: Text("List of account", style: TextStyle(fontSize: 21)),
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
                Text(moneyFormat(account.amount)),
              ],
            ),
          ),
        )
    );
  }

}

class BalanceContainer extends StatelessWidget {
  BalanceContainer({Key key, this.balance}) : super(key: key);

  final double balance;

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
        Text(moneyFormat(balance), style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
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
