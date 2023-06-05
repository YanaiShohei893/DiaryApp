import 'package:flutter/material.dart';

class diary_DetailPage extends StatefulWidget {
  @override
  _diary_DetailPage createState() => _diary_DetailPage();
}

class _diary_DetailPage extends State<diary_DetailPage> {
  String _text = '';
  int _month = 0;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;
    int day = now.day;
    return Scaffold(appBar: AppBar( 
      backgroundColor: Color.fromARGB(82, 99, 224, 222),
      leading: BackButton(),
      centerTitle: true,
      title: Text("$month/$day"),
      actions: [
      ElevatedButton(
        onPressed: _text.length == 0 ? null : (){
          Navigator.of(context).pop(_text);
          Navigator.of(context).pop(_month);
          // Navigator.of(context).pop(_day);
        },
        child:Text('保存')
      ),
      ],
    ),
    body: Container(
      padding: EdgeInsets.all(52),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          TextField(
            onChanged: (String value) {
              setState(() {
                _text = value;
                _month = month;
              });
            },
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),            
        ],
        ),
        ),
    );
  }
}
