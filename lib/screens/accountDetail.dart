import 'package:finance/components/AppBarCustom.dart';
import 'package:finance/components/GradientColor.dart';
import 'package:finance/components/TrxItem.dart';
import 'package:finance/data/dummy.dart';
import 'package:finance/helpers/moneyformat.dart';
import 'package:finance/models/account.dart';
import 'package:finance/models/transaction.dart';
import 'package:flutter/material.dart';

class AccountDetail extends StatefulWidget {
  AccountDetail({Key key, this.account}) : super(key: key);

  final Account account;

  @override
  _AccountDetail createState() => _AccountDetail();
}

class _AccountDetail extends State<AccountDetail> with TickerProviderStateMixin{

  String _title;

  bool _appBarVisible = false;

  List<Transaction> transactions; 

  ScrollController _scrollController;

  _scrollListener(){
    bool visible;
    if(_scrollController.offset >= 100){
      visible = true;
    }else{
      visible = false;
    }

    setState(() {
      _appBarVisible = visible;  
    });
  }

  @override
  void initState() {
    super.initState();
    _title = widget.account.name;
    transactions = trxs.where((trx) => trx.accountName == widget.account.name).toList();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarVisible ? customAppBarWithBack(title: _title) : null,
      body: Container(
        child: ListView(
          controller: _scrollController,
          children: <Widget>[
            Stack(
              children: <Widget>[
                _head(),
                _listTrx()
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("addButton pressed");
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.black,),
      ),
    );
  }

  Widget _head(){
    return Container(
      decoration: BoxDecoration(
        gradient: definedGradient(widget.account.color),
      ),
      constraints: BoxConstraints(maxHeight: 220),
      child: Column(
        children: <Widget>[
          TransparentAppBar(title: _title),
          Container(
            margin: EdgeInsets.only(
              top: 30,
            ),
            child: Column(
              children: <Widget>[
                Text(moneyFormat(widget.account.amount),style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
                Text("Current Balance",style: TextStyle(color: Colors.white, fontSize: 15))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _listTrx(){
    return Container(
      margin: EdgeInsets.only( top: 170 ),
      padding: EdgeInsets.only( left: 10, right: 10 ),
      child: Column(
        children: <Widget>[ ..._transactions() ],
      ),
    );
  }

  List<Widget> _transactions(){
    return transactions.map((trx){
      return TrxItem(trx: trx, onTap: (){
        print("Tapped "+trx.id.toString());
      });
    }).toList();
  }

}

