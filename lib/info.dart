import 'package:flutter/material.dart';
import 'info_text.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key, key}): super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Financial Literacy",),),
      body: Padding (
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: Text(heading1, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
          Expanded(child: Text(heading1_body1, style: TextStyle(fontSize: 20, ),maxLines: 4, overflow: TextOverflow.ellipsis,),),
          Expanded(child: Text(heading2, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
          Expanded(child: Text(heading2_body1, style: TextStyle(fontSize: 20, ),maxLines: 4, overflow: TextOverflow.clip,),),
          Expanded(child:Text(heading2_body2, style: TextStyle(fontSize: 20, ),),),
          Expanded(child:Text(heading2_body3, style: TextStyle(fontSize: 20, ),),),
          Expanded(child:Text(heading3, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
          Expanded(child:Text(heading3_body1, style: TextStyle(fontSize: 20, ),),),
          Expanded(child:Text(heading4, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
          Expanded(child:Text(heading4_body1, style: TextStyle(fontSize: 20, ),),),
          Expanded(child:Text(heading5, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
          Expanded(child:Text(heading5_body1, style: TextStyle(fontSize: 20, ),),)
    ],
    ),
    )
    );
  }
}
