
import 'package:flutter/material.dart';
import 'package:mobile3/UI/Screens/NotificationCenterScreen.dart';
import 'package:mobile3/UI/Widjets/CostumNavBar.dart';
import 'package:mobile3/UI/Widjets/FailureCard.dart';
import 'package:mobile3/UI/Widjets/Task.dart';
import 'package:provider/provider.dart';

import '../../Bloc/AnomalieBloc.dart';
import '../../Bloc/PanneBloc.dart';
import '../../Bloc/UserInfosBloc.dart';
import 'LoginScreen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController controller=PageController(initialPage: 0,

  );
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  List<dynamic> ListOfMap=[];
  Map<String,dynamic>  userInfos={};
  bool isloading2=true;
  bool isloading3=true;
  bool isloading0=true;
  bool isloading=true;

  Map<String,dynamic>  Panne={};
  List<dynamic> _listOfTasks=[];
  List<dynamic> ListOfMap2 = [];
  //
  Map<String,dynamic>  Anomalie={};
  List<dynamic> _listOfFailures=[];
  List<dynamic> ListOfMap3 = [];
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    Provider.of<PanneBloc>(context, listen: false).GetPanne().then((
        value) {
      if (mounted) {
        setState(() {
          isloading0 = false;
        });
      };
    });
    Panne = Provider
        .of<PanneBloc>(context, listen: false)
        .data;
    if (Panne["statusCode"] == 200) {
      ListOfMap2 = Panne["data"];
    }
    // TODO: implement initState
    Provider.of<AnomalieBloc>(context, listen: false).GetAnomalie().then((
        value) {
      if (mounted) {
        setState(() {
          isloading = false;
        });
      };
    });
    Anomalie = Provider
        .of<AnomalieBloc>(context, listen: false)
        .data;
    if (Anomalie["statusCode"] == 200) {
      ListOfMap3 = Anomalie["data"];
    }
    // TODO: implement initState
    if(mounted){
      setState(() {
        isloading3=false;
        isloading2=false;
      }
      );}
    Provider.of<UserInfosBloc>(context,listen: false).getUserInfos().then((value){
      if(mounted){
        setState(() {
          isloading3=false;
          isloading2=false;
        }
        );}
      userInfos=Provider.of<UserInfosBloc>(context,listen: false).data;
      print(userInfos);
     /* if(userInfos["statusCode"]!= 200 ){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("${userInfos["message"]}"),
              actions: <Widget>[
                TextButton(
                  child:  Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      }*/
    }) ;

  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _listOfFailuresWidjets =List.generate(ListOfMap3.length, (index) => FailureCard(adresse: "ID0"+ListOfMap3[index]["idDistributeur"].toString()+" ${ListOfMap3[index]["machine"]["adresse"]}",
        date:  ListOfMap3[index]["dateDebut"].substring(0, 10), title:  ListOfMap3[0]["anomalie"][0]["description"], time:  ListOfMap3[index]["dateDebut"].substring(11, 16)+" PM", type:  ListOfMap3[index]["etat"], isTypee: true));
//
    List<Widget> _listOfTasksWidjets =List.generate(ListOfMap2.length, (index) =>
        Task(title: ListOfMap2[index]["panne"][0]["description"], startDate: ListOfMap2[index]["dateDebut"].substring(0, 10),
            endDate: ListOfMap2[index]["dateFin"].substring(0, 10), percentage: ((DateTime.now().difference(DateTime.parse(ListOfMap2[index]["dateDebut"].substring(0, 10))).inDays) * 100 )~/
                (DateTime.parse(ListOfMap2[index]["dateFin"].substring(0, 10)).difference(DateTime.parse(ListOfMap2[index]["dateDebut"].substring(0, 10))).inDays )));

    var screenWidth=MediaQuery.of(context).size.width;
    var screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: CostumNavBar(index: 0,),
      body: (isloading2||isloading3)?Center(child: CircularProgressIndicator(color: Color.fromRGBO(1, 113, 75, 1),)):SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 60,bottom: 10),
              child: Column(
                children: [
                  Image.asset("lib/UI/assets/images/Logo.png"),
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
                          child:  Image.asset("lib/UI/assets/images/User.jpg",fit: BoxFit.fill,),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi Chamsou berkane",style: TextStyle(fontWeight: FontWeight.w600,color: Color.fromRGBO(0, 98, 59, 1),fontSize: 14),),
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
                children:[..._listOfFailuresWidjets,]
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 25,bottom: 5,top: 10),
              child: Text("Recent Tasks",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 19,letterSpacing: 1,color: Color.fromRGBO(14, 14, 14, 1)),),
            ),
            Column(
              children:[..._listOfTasksWidjets,]
            ),
          ],
        ),
      ),

    );
  }
}
