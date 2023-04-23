

import 'package:flutter/material.dart';
import 'package:mob3/UI/Widjets/CostumNavBar.dart';
import 'package:mob3/UI/Widjets/Task.dart';
class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({Key? key}) : super(key: key);

  @override
  _MyTasksScreenState createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 60,bottom: 10),
              child: Column(
                children: [
                  Image.asset("lib/UI/assets/Images/Logo.png"),
                  SizedBox(height: 5,),
                  Text("My Tasks",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 21),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(

                    width: 210,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 0.5,
                          blurRadius: 1,
                          offset: Offset(3, 3),
                        ),
                      ],
                      color: Color.fromRGBO(242, 242, 242, 1),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(242, 242, 242, 1),
                        contentPadding: EdgeInsets.symmetric(vertical: 0),
                        prefixIcon: Icon(Icons.search,size: 20,color: Color.fromRGBO(51, 51, 51, 0.74),),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Color.fromRGBO(51, 51, 51, 0.74),),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.filter_list_rounded,size: 30,color: Color.fromRGBO(1, 113, 75, 1),),
                  ),
                ],
              ),
            ),
            Task(title: "Restock Coffee", startDate: "01/01/2023", endDate: "01/02/2023", percentage: 50),
            Task(title: "Restock Coffee", startDate: "01/01/2023", endDate: "01/02/2023", percentage: 50),
            Task(title: "Restock Coffee", startDate: "01/01/2023", endDate: "01/02/2023", percentage: 50),
            Task(title: "Restock Coffee", startDate: "01/01/2023", endDate: "01/02/2023", percentage: 50),
           ],
        ),
      ),
      bottomNavigationBar: CostumNavBar(index: 1),
    );
  }
}
