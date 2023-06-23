

import 'package:flutter/material.dart';
import 'package:mobile3/UI/Widjets/CostumNavBar.dart';
import 'package:mobile3/UI/Widjets/Task.dart';
import 'package:provider/provider.dart';

import '../../Bloc/PanneBloc.dart';
class MyTasksScreen extends StatefulWidget {
  const MyTasksScreen({Key? key}) : super(key: key);

  @override
  _MyTasksScreenState createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {

  Map<String,dynamic>  Panne={};
  List<dynamic> _listOfTasks=[];
  List<dynamic> ListOfMap = [];
  bool isloading=true;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    Provider.of<PanneBloc>(context, listen: false).GetPanne().then((
        value) {
      if (mounted) {
        setState(() {
          isloading = false;
        });
      };
    });
    Panne = Provider
        .of<PanneBloc>(context, listen: false)
        .data;
    if (Panne["statusCode"] == 200) {
      ListOfMap = Panne["data"];
    }
  }
  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    List<Widget> _listOfTasksWidjets =List.generate(ListOfMap.length, (index) =>
        Task(title: ListOfMap[index]["panne"][0]["description"], startDate: ListOfMap[index]["dateDebut"].substring(0, 10),
          endDate: ListOfMap[index]["dateFin"].substring(0, 10), percentage: ((DateTime.now().difference(DateTime.parse(ListOfMap[index]["dateDebut"].substring(0, 10))).inDays) * 100 )~/
                (DateTime.parse(ListOfMap[index]["dateFin"].substring(0, 10)).difference(DateTime.parse(ListOfMap[index]["dateDebut"].substring(0, 10))).inDays )));

    return  Scaffold(
      body:isloading?Center(child: CircularProgressIndicator(color: Color.fromRGBO(1, 113, 75, 1),)): SingleChildScrollView(
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
            ..._listOfTasksWidjets,
           ],
        ),
      ),
      bottomNavigationBar: CostumNavBar(index: 1),
    );
  }
}
