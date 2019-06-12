
import 'package:flutter/material.dart';

AppBar customAppBar({String title, String type}){
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(title, style: TextStyle(color: Colors.black)),
    leading: _appBarLeading(),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.notifications_none),
        color: Colors.black,
        onPressed: (){
          print("Bell Tapped");
        },
      )
    ],
  );
}

AppBar customAppBarWithBack({String title, BuildContext ctx}){
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(title, style: TextStyle(color: Colors.black)),
    leading: _appBarLeadingBack(ctx),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.notifications_none),
        color: Colors.black,
        onPressed: (){
          print("Bell Tapped");
        },
      )
    ],
  );
}

class TransparentAppBar extends StatelessWidget{
 
  
  final String title;

  const TransparentAppBar({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Row(
        children: <Widget>[
          _leading(context),
          _title(),
          _actions()    
        ]
      )
    );
  }
  Widget _title(){
    return Expanded(
      flex: 3,
      child: Center(
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 20),),
      ),
    );
  }

  Widget _leading(BuildContext ctx){
    return Expanded(
      flex: 1,
      child: IconButton(
        color: Colors.white,
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(ctx);
        },
      )
    );
  }

  Widget _actions(){
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            color: Colors.white,
            onPressed: (){
              print("Bell Tapped");
            },
          )   
        ],
      ),
    );
  }

}

Widget _appBarLeading(){
    return IconButton(
      color: Colors.black,
      icon: Icon(Icons.menu),
      onPressed: () {
        print("menu pressed");
      },
    );
  }

Widget _appBarLeadingBack(BuildContext ctx){
  return IconButton(
    color: Colors.black,
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.pop(ctx);
    },
  );
}