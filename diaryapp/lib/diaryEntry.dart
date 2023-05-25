import 'package:flutter/material.dart';

class diaryEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( 
      backgroundColor: Color.fromARGB(82, 99, 224, 222),
      leading: BackButton(),
      centerTitle: true,
      title: Text("月/日()"),
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
