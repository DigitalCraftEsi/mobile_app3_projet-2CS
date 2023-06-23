
import 'package:flutter/material.dart';
import 'package:mobile3/Data/Services/AnomalieService.dart';
import 'package:mobile3/UI/Widjets/CostumNavBar.dart';
import 'package:mobile3/UI/Widjets/FailureCard.dart';
import 'package:provider/provider.dart';
import '../../Bloc/AnomalieBloc.dart';

class FailuresScreen extends StatefulWidget {
  const FailuresScreen({Key? key}) : super(key: key);

  @override
  _FailuresScreenState createState() => _FailuresScreenState();
}

class _FailuresScreenState extends State<FailuresScreen> {

  Map<String,dynamic>  Anomalie={};
  List<dynamic> _listOfFailures=[];
  List<dynamic> ListOfMap = [];
  bool isloading=true;
  @override
  void initState() {
    super.initState();
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
      ListOfMap = Anomalie["data"];
    }
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> _listOfFailuresWidjets =List.generate(ListOfMap.length, (index) => FailureCard(adresse: "ID0"+ListOfMap[index]["idDistributeur"].toString()+" ${ListOfMap[index]["machine"]["adresse"]}",
        date:  ListOfMap[index]["dateDebut"].substring(0, 10), title:  ListOfMap[0]["anomalie"][0]["description"], time:  ListOfMap[index]["dateDebut"].substring(11, 16)+" PM", type:  ListOfMap[index]["etat"], isTypee: true));

    return Scaffold(
      body: isloading?Center(child: CircularProgressIndicator(color: Color.fromRGBO(1, 113, 75, 1),)):SingleChildScrollView(
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
                  Text("Detected Failures",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 21),),
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
            ..._listOfFailuresWidjets,
          ],
        ),
      ),
      bottomNavigationBar: CostumNavBar(index: 2),
    );
  }
}
