import 'package:finance/components/AccountList.dart';
import 'package:finance/components/AppBarCustom.dart';
import 'package:finance/components/BalanceContainer.dart';
import 'package:finance/components/LastTransaction.dart';
import 'package:flutter/material.dart';

import 'package:finance/data/dummy.dart';
import 'package:finance/models/transaction.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Transaction> _lastTrxs;

  @override
  void initState(){
    super.initState();
    trxs.sort((c,n)=> n.id.compareTo(c.id));
    _lastTrxs = trxs.take(4).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: widget.title),
      body: Container(
        child: ListView(
          children: <Widget>[
            AccountList(accounts:accounts),
            BalanceContainer(balance: getTotalAmount()),
            LastTransaction(transactions: _lastTrxs,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("addButton pressed");
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add,color: Colors.black,),
      ),
    );
  }
}
