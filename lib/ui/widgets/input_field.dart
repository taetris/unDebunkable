import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:undebunkable/config/config_data.dart';

class MyInputField extends StatelessWidget {
  final String title, hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({Key? key, required this.title, required this.hint, this.controller, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      // alignment: Alignment(0, 5),
      margin: EdgeInsets.only(top: 2, left: 2),
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(title,
              style: subHeadingStyle,
            ),
            
            Container(
              height:52,
              width: 500,
              margin: EdgeInsets.only(bottom: 20, top:2),
              
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 0.8,
                  

                ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(children: [
                Expanded(
                  child: TextFormField(
                    readOnly:widget==null?false:true,
                    autofocus: false,
                    controller: controller,
                    style: hintStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      contentPadding: EdgeInsets.only(left: 10),

                    ),
                  )
                  ),
                  widget==null?Container():Container(child:widget) //for calendar button
                ],
              )
            ),
          ],
          ),
        
    
      );
  }
}