import 'package:flutter/material.dart';
import 'diary_detail.dart';

  DateTime now = DateTime.now();
  int _year = now.year;
  int _month = now.month;
  int _day = now.day;

//日記一覧画面
class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  List<String> diaryes = [
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( 
      backgroundColor: Color.fromARGB(82, 99, 224, 222),
      leading: Text("button"),
      centerTitle: true,
      title: Text("Diary"),
      actions: [Text("action1"),Text("action2")],
    ),
    body: ListView.builder(
      itemCount: diaryes.length,
      itemBuilder: (context, index) {
        return Card(
          child:ListTile(
            leading: Text('年/月'),
            title: Text('日'),
            subtitle: Text(diaryes[index]),
            onLongPress: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => diary_DetailPage()
                )
              );
            },
          )
        );
      }
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => diary_DetailPage()
          )
        );
      },
      child: Icon(Icons.history_edu)
    )
    );

    //  body:ListView(
    //   children:<Widget>[
    //     Card(
    //       child: ListTile(
    //         leading:Text('$_year/$_month'),
    //         title: Text('$_day'),
    //         subtitle: Text('日記内容'),
    //         onLongPress: (){
    //           Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => diary_DetailPage()));
    //         },
    //       ),
    //     ),
    //   ]
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => diary_DetailPage()));
    //     },
    //     child: Icon(Icons.history_edu)
    //     ),
    // ); 
  }
}
