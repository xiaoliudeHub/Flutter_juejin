import 'package:flutter/material.dart';

class IndexListHeader extends StatelessWidget {
   final bool hasLogin;
   IndexListHeader(this.hasLogin);

  @override
  Widget build(BuildContext context) {
    if(hasLogin) {
    
    }else {}
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children:[
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text(
                 '热门文章',
                 style: TextStyle(
                   color:Color(0xFF434343),
                   fontSize: 16.0,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               FlatButton(onPressed: (){
                 print('查看更多');
               }, child: Text('查看更多', style: TextStyle(color: Color(0xFF757575)),))
             ],
          ),
        ]
      ),
    );
  }
}