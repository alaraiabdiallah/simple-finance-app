import 'package:finance/components/TrxItem.dart';
import 'package:finance/models/transaction.dart';
import 'package:flutter/material.dart';

class LastTransaction extends StatelessWidget {

  final List<Transaction> transactions;

  const LastTransaction({Key key, this.transactions}) : super(key: key);
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
    return Column(
      children: <Widget>[
        ...transactions.map((trx){
          return TrxItem(trx: trx, onTap: (){
            print("Tapped "+trx.id.toString());
          });
        }).toList()
      ],
    ); 

  }

}