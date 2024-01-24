import 'package:flutter/material.dart';

class Suvidha extends StatefulWidget {
  const Suvidha({Key? key}) : super(key: key);

  @override
  _SuvidhaState createState() => _SuvidhaState();
}



class _SuvidhaState extends State<Suvidha> {
  
  late String valueChoose= "Panaji";
  List listItem = [
    "Panaji","Margao","Vasco","Mapusa","Ponda"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suvidha"),
      backgroundColor: Color.fromARGB(255, 227, 60, 9),),
      body: Center(
       child: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15)
              ),
              child: DropdownButton(
                hint: Text('Select city:'),
                dropdownColor: Colors.white,
                icon: Icon(Icons.arrow_drop_down),
                iconSize: 36,
                isExpanded: true,
                underline: SizedBox(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22
                  ),
                value: valueChoose, 
                onChanged: (newValue){
                  setState(() {
                    valueChoose = newValue as String;
                  });
                },
                items: listItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                    );
                }).toList(),
                ),
            ),
          ],
         ),
       ),
      ),
    );
  }
}
