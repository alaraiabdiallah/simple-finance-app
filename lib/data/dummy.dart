import "package:finance/models/account.dart";
import "package:finance/models/transaction.dart";

List<Account> accounts = [
  Account(id:1,name:"Wallet",amount: 110000, color: "green"),
  Account(id:2,name:"BNI",amount: 120000, color: "blue"),
  Account(id:3,name:"Mandiri",amount: 350000, color: "red"),
];

List<Transaction> trxs = [
  Transaction(id:1,name:"Salary", type: "Income",amount: 110000, accountName: "BNI"),
  Transaction(id:2,name:"Food", type: "Outcome",amount: 11000, accountName: "Wallet"),
];