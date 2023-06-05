import 'package:flutter/material.dart';
import 'diary_detail.dart';

//日記一覧画面
class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  List<String> diaryes = [];
  List<int> M = [];
  List<int> D = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( 
      backgroundColor: Color.fromARGB(82, 99, 224, 222),
      leading: Text("button"),
      centerTitle: true,
      title: Text("Diary"),
      actions: [
        Text("action1"),
        IconButton(
          icon: Icon(Icons.check_circle),
          onPressed:() {}
        ),
        ],
    ),
    body: ListView.builder(
      itemCount: diaryes.length,
      itemBuilder: (context,index) {
        return Card(
          child: ListTile(
            leading: Text(M[index].toString() + '/' ),
            title: Text(diaryes[index]),
            trailing: IconButton(
              onPressed:(){
                setState(() {
                  diaryes.removeAt(index);
                  M.removeAt(index);
                });
              },
              icon: Icon(Icons.delete),
            )
          ),
        );
      },
    ),
    // body: ListView.builder(
    //   itemCount: diaryes.length,
    //   itemBuilder: (context, index) {
    //     return Card(
    //       child:ListTile(
    //         leading: Text('年/月'),
    //         title: Text('日'),
    //         subtitle: Text(diaryes[index]),
    //         onLongPress: (){
    //           Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => diary_DetailPage()
    //             )
    //           );
    //         },
    //       )
    //     );
    //   }
    floatingActionButton: FloatingActionButton(
      onPressed: () async {
        final newListText = await Navigator.of(context).push(
          MaterialPageRoute(builder:(context) {
            return diary_DetailPage();
          }),
        );
        if (newListText != null) {
          setState(() {
            diaryes.add(newListText);
            M.add(newListText);
          });
        }
      },
      child: Icon(Icons.history_edu)
    ),
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
