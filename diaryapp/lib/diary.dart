import 'package:flutter/material.dart';
import 'diary_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

//日記一覧画面
class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  late SharedPreferences _prefs;
  List<String> diaryEntries = [];
  DateTime now = DateTime.now();
  List<String> diaryes = [];
  List<int> Y = [];
  List<int> M = [];
  List<int> D = [];
  @override
  void initState() {
    super.initState();
    loadEntries();
  }

  Future<void> loadEntries() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      diaryEntries = _prefs.getStringList('diaryEntries') ?? [];
    });
  }
  
  Future<void> saveEntries() async {
    await _prefs.setStringList('diaryEntries',diaryEntries);
  }

  void addEntry(String entry) {
    setState(() {
      diaryEntries.add(entry);
      saveEntries();
    });
  }

  Widget build(BuildContext context) {
    int diaryYear = now.year;
    int diaryMonth = now.month;
    int diaryDay = now.day;
    return Scaffold(appBar: AppBar( 
      backgroundColor: Color.fromARGB(82, 99, 224, 222),
      leading: Text("button"),
      centerTitle: true,
      title: Text("Diary"),
      actions: [
        IconButton(
          icon: Icon(Icons.check_circle),
          onPressed:() {}
        ),
        ],
    ),
    body: ListView.builder(
      itemCount: diaryEntries.length,
      itemBuilder: (context,index) {
        return Card(
          child: ListTile(
            leading: Text(Y[index].toString() + '年/' + M[index].toString() + '月'),
            title: Text(D[index].toString() + '日'),
            subtitle: Text(diaryEntries[index]),
            onLongPress:() async {
              final newListText = await Navigator.of(context).push(
                MaterialPageRoute(builder:(context) {
                  return diary_DetailPage();
                })
              );
              if (newListText != null) {
                setState(() {
                  diaryEntries[index] = newListText;
                });
              }
            },
            trailing: IconButton(
              onPressed:(){
                setState(() {
                  diaryEntries.removeAt(index);
                  Y.removeAt(index);
                  M.removeAt(index);
                  D.removeAt(index);
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
            diaryEntries.add(newListText);
            Y.add(diaryYear);
            M.add(diaryMonth);
            D.add(diaryDay);
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
