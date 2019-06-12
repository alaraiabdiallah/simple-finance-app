import 'package:finance/components/GradientColor.dart';
import 'package:finance/data/dummy.dart';
import 'package:finance/helpers/moneyformat.dart';
import 'package:finance/models/account.dart';
import 'package:finance/screens/accountDetail.dart';
import 'package:flutter/material.dart';

class AccountList extends StatelessWidget {

  AccountList({List<Account> accounts});

  BuildContext _ctx;
  
  @override
  Widget build(BuildContext context) {
    _ctx = context;
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

    BoxDecoration cardDecor = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      gradient: definedGradient(account.color),
      boxShadow: [
        new BoxShadow(
          color: Colors.grey[400],
          blurRadius: 2,
          offset: new Offset(0, 2)
        )
      ]
    );


    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        child: new InkWell(
          onTap: (){
            Navigator.push(
              _ctx,
              MaterialPageRoute(builder: (_ctx) => AccountDetail(account: account,)),
            );
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