import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width:120,
        height:60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF4e5ae8),
        ),
      child: Container(margin: const EdgeInsets.only(left: 10, right:10, top:18, bottom: 15)
      ,child: Center(child:Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          )
            
          )
        ),)
        
      )
    );
  }
}

