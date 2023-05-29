import 'package:flutter/material.dart';

class diaryEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int _year = now.year;
    int _month = now.month;
    int _day = now.day;
 
    return Scaffold(appBar: AppBar( 
      backgroundColor: Color.fromARGB(82, 99, 224, 222),
      leading: BackButton(),
      centerTitle: true,
      title: Text("$_month/$_day"),
      actions: [Text("action1"),Text("action2")],
    ),
    body: Container(
      padding: EdgeInsets.all(52),
      child:Column(
        children:<Widget>[
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
        ],))
    );
  }
}
