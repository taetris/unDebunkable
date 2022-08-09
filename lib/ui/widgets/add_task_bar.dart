import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/rendering/flex.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:undebunkable/config/config_data.dart';
import 'package:undebunkable/ui/widgets/input_field.dart';
import 'package:undebunkable/ui/widgets/button.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFB746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
      
  int _selectedRemind = 5;
  List <int> remindList = [5, 10, 15, 20];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return 
    // WillPopScope(
    //   onWillPop: (){
    //     moveToLastScreen();
    //   },
    //   child: 
    Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: Container(
        padding: EdgeInsets.only(left:20, right:20, bottom: 40),
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [Container(
              padding: EdgeInsets.only(top: 10, bottom: 20),  //for add a class title padding
              child:Text("Add a class...",

              style: HeadingStyle,
              
              ),
            ),
            MyInputField(title: "Subject", hint: "Enter subject name here.",),
            MyInputField(title: "Note", hint: "Enter note here."),
            MyInputField(title: "Date", hint: DateFormat.yMd().format(_selectedDate), 
            widget: IconButton(
              icon: Icon(Icons.calendar_today_outlined),
              color: Colors.grey,
              onPressed: (){_getDatefromUser();}
            ,),
            ),
            Row(children: [
              Expanded(
                child: MyInputField(
                  title: "Start Time", 
                  hint: _startTime, 
                  widget: IconButton(
                    onPressed: (){
                      _getTimefromUser(isStartTime: true);
                    },
                    icon: Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey
                    ),
                    
                  )
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: MyInputField(
                  title: "End Time", 
                  hint: _endTime, 
                  widget: IconButton(
                    onPressed: (){
                      _getTimefromUser(isStartTime: false);
                    },
                    icon: Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey
                    ),
                    
                  )
                ),
              )
            ],
          ),
            MyInputField(
                title: "Remind",
                hint: "$_selectedRemind minutes early",
                widget: DropdownButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                    ),
                    iconSize: 32,
                    iconEnabledColor: Colors.white,
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRemind = int.parse(newValue!);
                      });
                    },
                    elevation: 4,
                    style: subHeadingStyle,
                    items:
                        remindList.map<DropdownMenuItem<String>>((int value) {
                      return DropdownMenuItem<String>(
                        value: value.toString(),
                        child: Text(value.toString()),
                      );
                    }).toList()),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _colorPalette(),
                MyButton(label: "Create Class", onTap: ()=> _classSubmit()),
                ],
              ),
            ],
          ),
        ),
      ),
    // )
    );
  }
  _classSubmit(){
    if(_titleController.text.isNotEmpty && _noteController.text.isNotEmpty){
      //add it to database
      Get.back();
    }
    else if(_titleController.text.isEmpty || _noteController.text.isEmpty){
      Get.snackbar("Required", "All fields required!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue[400],
      icon: Icon(Icons.warning_amber_rounded),
      );
    }
  }
  _colorPalette(){
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Color", style: subHeadingStyle),
                      const SizedBox(
                        height: 7,
                      ),
                      Wrap(
                        children: List<Widget>.generate(
                          3,
                          (int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = index;
                                  debugPrint("Index : $_selectedColor");
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CircleAvatar(
                                    child: _selectedColor == index
                                        ? const Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 16,
                                          )
                                        : Container(),
                                    radius: 14,
                                    backgroundColor: index == 0
                                        ? primaryClr
                                        : index == 1
                                            ? pinkClr
                                            : yellowClr),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                
  }
  _getDatefromUser() async{
    DateTime? _pickerDate = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2019), 
      lastDate: DateTime(2121)
      );

    if(_pickerDate!=null){
      setState((){
        _selectedDate = _pickerDate;
      });
    }
    else{
      print("SOmething went wrong");
    }
  }
  _getTimefromUser({required bool isStartTime}) async{

    var pickedTime = await _showTimePicker();
    String _formattedTime = pickedTime.format(context);

    if(pickedTime == null)
      print("Time cancelled");
    else if(isStartTime == true){
      setState((){
        _startTime = _formattedTime;
      });
    }
    else if(isStartTime == false){
      setState((){
        _endTime = _formattedTime;
      });
    }

  }
  _showTimePicker(){
    return showTimePicker(
      context: context, 
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]), 
        minute: int.parse(_startTime.split(":")[1].split(" ")[0])));
  }



  appBar(){
  
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: (){
          moveToLastScreen();
        },
        child: Icon(Icons.arrow_back_ios_new_rounded,
        color: Colors.black),
        )
    );
  }

  moveToLastScreen(){
    Navigator.pop(context);
  }

}