import 'package:finance/components/AppBarCustom.dart';
import 'package:finance/components/GradientColor.dart';
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

class _AccountDetail extends State<AccountDetail> {

  final String _title = "Account";

  bool _appBarVisible = false;

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
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    // super.initState();
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
                Container(
                  margin: EdgeInsets.only(
                    top: 150
                  ),
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10
                  ),
                  child: Column(
                    children: <Widget>[
                      ..._transactions()
                    ],
                  ),      
                ),
              ],
            )
            
          ],
        ),
      ),
    );
  }

  Widget _head(){
    return Container(
      decoration: BoxDecoration(
        gradient: definedGradient(widget.account.color),
      ),
      constraints: BoxConstraints(maxHeight: 200),
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

  List<Widget> _transactions(){
    return trxs.map((trx){
      return trxItem(trx);
    }).toList();
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
                trxType(trx),
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
    String color;
    IconData icon;
    if(trx.type == "Income"){
      color = "green";
      icon  = Icons.attach_money;
    }else{
      color = "red";
      icon  = Icons.compare_arrows;
    }
    return Container(
      margin: EdgeInsets.all(7),
      decoration: new BoxDecoration(
        gradient: definedGradient(color),
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      width: 100,
      height: double.infinity,
      child: Icon(icon,size: 40,color: Colors.white,),
    );
  }

  Widget trxText(Transaction trx){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(trx.name, style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Raleway"
        )),
        Text(trx.accountName),
      ],
    );
  }
}

