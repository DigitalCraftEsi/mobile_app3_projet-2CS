
import 'package:flutter/material.dart';
import 'package:mob3/UI/Widjets/CostumNavBar.dart';
import 'package:mob3/UI/Widjets/FailureCard.dart';
class NotificationCenterScreen extends StatelessWidget {
  const NotificationCenterScreen({Key? key}) : super(key: key);

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
                  Text("My Notifications",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 21),),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 40,bottom: 5,top: 20),
              child: Text("Today",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17),),
            ),
            Column(
              children: [
                FailureCard(adresse:"ID01023 ESI,Oued Smar" , date: "10.28.2023", title:"Detected Failure", time: "11:36 PM", type: "payment", isTypee: true),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 40,bottom: 5,top: 20),
              child: Text("Yesterday",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17),),
            ),
            Column(
              children: [
                FailureCard(adresse:"ID01023 ESI,Oued Smar" , date: "10.28.2023", title:"Theft Attempt", time: "11:36 PM", type: "", isTypee: false),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 40,bottom: 5,top: 20),
              child: Text("Last 7 days",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 17),),
            ),
            Column(
              children: [
                FailureCard(adresse:"ID01023 ESI,Oued Smar" , date: "10.28.2023", title:"Detected Failure", time: "11:36 PM", type: "stock", isTypee: true),
                FailureCard(adresse:"ID01023 ESI,Oued Smar" , date: "10.28.2023", title:"Theft Attempt", time: "11:36 PM", type: "", isTypee: false),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CostumNavBar(index: 0),
    );
  }
}
