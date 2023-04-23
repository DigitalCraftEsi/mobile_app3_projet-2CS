
import 'package:flutter/material.dart';
import 'package:mob3/UI/Screens/TaskDetailsScreen.dart';
class Task extends StatelessWidget {
  const Task({Key? key, required this.title, required this.startDate, required this.endDate, required this.percentage}) : super(key: key);
  final String title;
  final String startDate;
  final String endDate;
  final int percentage;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TaskDetailsScreen()),
      );
    },

      child: Container(
        margin: EdgeInsets.symmetric(vertical: 13,horizontal: 35),
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(3, 3),
            ),
          ],
          color: Color.fromRGBO(240, 240, 240, 1),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("$title",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color: Color.fromRGBO(14, 14, 14, 1)),),
              ],
            ),
            SizedBox(height: 7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined,size: 19,color: Color.fromRGBO(51, 51, 51, 0.72)),
                    SizedBox(width: 5,),
                    Text("$startDate",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Color.fromRGBO(51, 51, 51, 0.72)),),
                  ],
                ),
                Icon(Icons.arrow_right_alt,color: Color.fromRGBO(51, 51, 51, 0.72)),
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined,size: 19,color: Color.fromRGBO(1, 113, 75, 1)),
                    SizedBox(width: 5,),
                    Text("$endDate",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Color.fromRGBO(1, 113, 75, 1)),),
                  ],
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$percentage %",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                Slider(
                  value: percentage.toDouble(),
                  min: 0,
                  max: 100,
                  divisions: 100,
                  activeColor: Color.fromRGBO(1, 113, 75, 1),
                  inactiveColor: Color.fromARGB(130, 51, 51, 51),
                  onChanged: (double value) {
                  },
                ),
              ],
            ),
          ],
        ),// add your child widget here
      ),
    );
  }
}
