import 'package:finance/components/GradientColor.dart';
import 'package:finance/helpers/moneyformat.dart';
import 'package:finance/models/transaction.dart';
import 'package:flutter/material.dart';

class TrxItem extends StatelessWidget{

  final Transaction trx;

  final GestureTapCallback onTap;

  const TrxItem({Key key, this.trx, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Card(
        child: new InkWell(
          onTap: onTap,
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