import 'package:finance/helpers/moneyformat.dart';
import 'package:flutter/material.dart';

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
        color: Colors.grey[400],
        blurRadius: 1,
        offset: new Offset(0, 2)
      ),
      new BoxShadow(
        color: Colors.grey[400],
        blurRadius: 2,
        offset: new Offset(0, 1)
      ),
    ]
  );
    
  Column content(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(moneyFormat(balance), style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500,color: Colors.green)),
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