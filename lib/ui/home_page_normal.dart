import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:undebunkable/config/config_data.dart';
import 'package:undebunkable/ui/widgets/button.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:undebunkable/ui/widgets/add_task_bar.dart';

// import 'package:flutter/lib/src/widgets/preferred_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(
      
      ),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          // _showClass(),
      ],
    )
  );
  }
}
// _showClass(){
//   return Expanded(
//     child:(){Obx(
//       return ListView.builder(
//         itemBuilder: (_, context){
//           return Container(
//             width: 100,
//             height: 50,
//             color: Colors.green,
//             margin: const EdgeInsets.only(bottom:10));
//           }
//         );
//       }
//     ),
//   );
// }
_addDateBar(){
  DateTime _selectedDate = DateTime.now(); //here
  
  return Container(
    margin: const EdgeInsets.only(top:20, bottom: 20, left:20, right:10),
    child: DatePicker(
      DateTime.now(),
      height: 100,
      width: 80,
      initialSelectedDate: DateTime.now(),
      selectionColor: Color.fromARGB(230, 59, 196, 10),
      selectedTextColor: Colors.white,
      dateTextStyle: GoogleFonts.lato( 
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.grey,

        ),
      ),
      onDateChange: (date){
        _selectedDate = date;
      },

            ),);
}
_addTaskBar(){
  return Container(

    margin: const EdgeInsets.only(left: 20, right:20, top:20),
    child:Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Container(
        // margin: const EdgeInsets.symmetric(horizontal:20, vertical:10),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Text(DateFormat.yMMMMd().format(DateTime.now()),
        style: subHeadingStyle,),
        Text("Today",
        style: HeadingStyle,)
      ],)
      ),
      // MyButton(label: " + Add Class", onTap: (){tapped();})
    ],)
);
}

tapped(){
  print("adding...");
  // Get.to(AddTaskPage());
  
}
_appBar(){

  return AppBar(
    elevation: 0,
    backgroundColor: Colors.black,//Color.fromARGB(199, 122, 227, 245),
    leading: GestureDetector(
      onTap: (){
        print("tapped");
      },
      child: Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.white,
      ),
      )
  );
}

