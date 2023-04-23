
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mob3/UI/Widjets/CostumNavBar.dart';
class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth=MediaQuery.of(context).size.width;
    var screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 35,bottom: 10),
                child: Column(
                  children: [
                    Image.asset("lib/UI/assets/Images/Logo.png"),
                    SizedBox(height: 5,),
                    Text("Task details",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 21),),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: screenWidth/1.3,
                child: Card(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text("Restock Coffee",style: TextStyle(fontWeight: FontWeight.w700,color:Color.fromRGBO(14, 14, 14, 1),fontSize: 20),),
                      ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Distributor ID",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(51, 51, 51, 0.6),fontSize: 12),),
                                Text("Start Date",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(51, 51, 51, 0.6),fontSize: 12),),
                                Text("Due Date",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(51, 51, 51, 0.6),fontSize: 12),),
                                Text("Date",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(51, 51, 51, 0.6),fontSize: 12),),

                    ],
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  Text("6348489404",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(14, 14, 14, 1),fontSize: 12),),
                                  Text("01/01/2023",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(14, 14, 14, 1),fontSize: 12),),
                                  Text("01/02/2023",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(1, 113, 75, 1),fontSize: 12),),
                                  Text("20/03/2023",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(14, 14, 14, 1),fontSize: 12),),

                                ]

                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Description : ",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(51, 51, 51, 0.6),fontSize: 12),),
                            SizedBox(width: 8,),
                            Expanded(child: Text("Coffee stock rupture, needs refill",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(14, 14, 14, 1),fontSize: 12),)),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("50 %",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                            Slider(
                              value: 50,
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
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Localisation",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(1, 113, 75, 1),fontSize: 17),),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text("Esi , Oued Smar",style: TextStyle(fontWeight: FontWeight.w600,color:Color.fromRGBO(14, 14, 14, 1),fontSize: 15),),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Image.asset("lib/UI/assets/Images/map.PNG"),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: SizedBox(
                  width: 230,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Color.fromRGBO(1, 113, 75, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Text('Mark as Done',style: TextStyle(letterSpacing: 0.8,fontWeight: FontWeight.w900,color: Colors.white,fontSize: 16),),
                    onPressed: () {
                      Navigator.pop(
                        context);


                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CostumNavBar(index: 1),
    );
  }
}
