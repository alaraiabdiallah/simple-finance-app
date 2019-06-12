import "package:finance/models/account.dart";
import "package:finance/models/transaction.dart";

List<Transaction> trxs = [
  Transaction(id:1,name:"Salary", type: "Income",amount: 1000000, accountName: "BNI"),
  Transaction(id:2,name:"Withdraw", type: "Outcome",amount: 50000, accountName: "BNI"),
  Transaction(id:3,name:"Withdraw", type: "Income",amount: 50000, accountName: "Wallet"),
  Transaction(id:4,name:"Food", type: "Outcome",amount: 11000, accountName: "Wallet"),
  Transaction(id:5,name:"Food", type: "Outcome",amount: 11000, accountName: "Wallet"),
];

double getAccountAmount(String accountName){
    List<Transaction> trxAcc = trxs.where((r) => r.accountName == accountName).toList();
    double income = 0;
    double outcome = 0;

    for(var i = 0;i < trxAcc.length; i++){
      if(trxAcc[i].type == "Income")
        income += trxAcc[i].amount;
      
      if(trxAcc[i].type == "Outcome")
        outcome += trxAcc[i].amount;
    }
  
    return income - outcome;
}

double getTotalAmount(){
    double total = 0;
    for(var i = 0;i < accounts.length; i++){
      total += accounts[i].amount;
    }
    return total;
}



List<Account> accounts = [
  Account(id:1,name:"Wallet",amount: getAccountAmount("Wallet"), color: "green"),
  Account(id:2,name:"BNI",amount: getAccountAmount("BNI"), color: "blue"),
  Account(id:3,name:"Mandiri",amount: getAccountAmount("Mandiri"), color: "red"),
];