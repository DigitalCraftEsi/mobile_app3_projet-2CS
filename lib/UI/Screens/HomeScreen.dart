
import 'package:flutter/material.dart';
import 'package:mob3/UI/Screens/NotificationCenterScreen.dart';
import 'package:mob3/UI/Widjets/CostumNavBar.dart';
import 'package:mob3/UI/Widjets/FailureCard.dart';
import 'package:mob3/UI/Widjets/Task.dart';

import 'LoginScreen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(

                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.8,
                              color: Color.fromRGBO(1, 113, 75, 1),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(200))
                        ),
                        width: 45,
                        height: 45,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(200),



                          ),
                          child: Image.asset("lib/UI/assets/Images/User.jpg",fit: BoxFit.fill,),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text("Hi Jane Doe",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(0, 98, 59, 1),fontSize: 14),),
                          Text("Welcome back!",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 16),)
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(

                        color: Colors.blue,
                      ),
                      Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                          width: 13,
                          height: 13,
                          child: Center(child: Text("2",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 9),)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(200)),
                            color: Colors.red,
                          ),
                        ),

                      ),
                      IconButton(onPressed: (){
             Navigator.push(
            context,
    MaterialPageRoute(builder: (context) => NotificationCenterScreen()),
    );
    }
                      ,
                        icon: Icon(Icons.notifications,color: Color.fromRGBO(1, 113, 75, 1),),
                      ),
                    ],
                  ),


                ],

              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 25,bottom: 5,top: 10),
              child: Text("Recent Failures",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 19,letterSpacing: 1,color: Color.fromRGBO(14, 14, 14, 1)),),
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                FailureCard(adresse:"ID01023 ESI,Oued Smar" , date: "10.28.2023", title:"Detected Failure", time: "11:36 PM", type: "payment", isTypee: true),
                FailureCard(adresse:"ID01023 ESI,Oued Smar" , date: "10.28.2023", title:"Detected Failure", time: "11:36 PM", type: "payment", isTypee: true),

              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 25,bottom: 5,top: 10),
              child: Text("Recent Tasks",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 19,letterSpacing: 1,color: Color.fromRGBO(14, 14, 14, 1)),),
            ),
            Column(
              children: [
                Task(title: "Restock Coffee", startDate: "01/01/2023", endDate: "01/02/2023", percentage: 50),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CostumNavBar(index: 0),

    );
  }
}
