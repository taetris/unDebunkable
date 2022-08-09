import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:undebunkable/ui/widgets/input_field.dart';
import 'package:undebunkable/config/config_data.dart';
import 'package:undebunkable/ui/widgets/button.dart';
import 'package:undebunkable/ui/home_page_admin.dart';

class InitInput extends StatefulWidget {
  const InitInput({Key? key}) : super(key: key);

  @override
  State<InitInput> createState() => _InitInputState();
}

class _InitInputState extends State<InitInput> {
  List <String> year = ['I', 'II', 'III', 'IV',];
  List <String> dept = ['BEI', 'BME', 'BCT', 'BEL'];
  String _selectedYear = 'III', _selectedDept = 'BEI';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left:20, right:20, top: 20),
        child: Center(
          child: Column(
          
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Container(
                padding: EdgeInsets.only(left:20, right:20, bottom: 60),
                child: Text("Choose your Routine",
                style: mainTitleStyle,
                ),
              ),
              Container(
                // padding: EdgeInsets.only(left:20, right:20, bottom: 10, top: 50),
                child:Expanded(
                
                  child: MyInputField(
                    title: "Department",
                    hint: "BEI",
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
                            // _selectedDept = newValue;
                          });
                        },
                        elevation: 4,
                        style: subHeadingStyle,
                        items:
                            dept.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(value.toString()),
                          );
                        }).toList()),
              ),),
              ),

            Container(
              // padding: EdgeInsets.only(left:20, right:20, bottom: 50, top: 10),
              child:Expanded(
              child: MyInputField(
                  title: "Year",
                  hint: "I",
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
                          // _selectedDept = newValue;
                        });
                      },
                      elevation: 4,
                      style: subHeadingStyle,
                      items:
                          year.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value.toString(),
                          child: Text(value.toString()),
                        );
                      }).toList()),
            ),),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              child: MyButton(label: "Submit", onTap: ()=> submit()),
            ),
          ],
        )
      )
      ),
    );
  }

  submit(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ));
  }
}

