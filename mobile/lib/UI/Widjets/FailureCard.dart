import 'package:flutter/material.dart';
class FailureCard extends StatelessWidget {
  const FailureCard({Key? key, required this.adresse, required this.date, required this.title, required this.time, required this.type, required this.isTypee}) : super(key: key);
  final String adresse;
  final String date;
  final String title;
  final String time;
  final String type;
  final bool isTypee;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$adresse",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),),
              Text("$date",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),)
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("$title",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color.fromRGBO(1, 113, 75, 1)),),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time_filled,size: 19,color: Color.fromRGBO(51, 51, 51, 0.72)),
                  SizedBox(width: 5,),
                  Text("$time",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Color.fromRGBO(51, 51, 51, 0.72)),),
                ],
              ),
             isTypee? Container(
                padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(1, 113, 75, 0.14),
                ),
                child: Text("$type",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color: Color.fromRGBO(1, 113, 75, 1)),),
              ):Container(),
            ],
          ),
        ],
      ),// add your child widget here
    );
  }

}
