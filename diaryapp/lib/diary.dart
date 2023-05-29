import 'package:flutter/material.dart';
import 'diaryEntry.dart';

class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int _year = now.year;
    int _month = now.month;
    int _day = now.day;

    return Scaffold(appBar: AppBar( 
      backgroundColor: Color.fromARGB(82, 99, 224, 222),
      leading: Text("button"),
      centerTitle: true,
      title: Text("Diary"),
      actions: [Text("action1"),Text("action2")],
    ),
    body:ListView(
      children:<Widget>[
        Card(
          child: ListTile(
            leading:Text('$_year/$_month'),
            title: Text('$_day'),
            subtitle: Text('日記内容'),
            onLongPress: (){
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => diaryEntryPage()));
            },
          ),
        ),
      ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => diaryEntryPage()));
        },
        child: Icon(Icons.history_edu)
        ),
    );
  }
}
