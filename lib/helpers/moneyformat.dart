import 'package:flutter_money_formatter/flutter_money_formatter.dart';
moneyFormat(double amount){
  FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
      amount: amount,
      settings: MoneyFormatterSettings(
          symbol: 'IDR',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 2
      )
  );
  return "IDR "+fmf.output.withoutFractionDigits.toString();
}