import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile3/UI/Widjets/CostumNavBar.dart';
import 'package:provider/provider.dart';

import '../../Bloc/UserInfosBloc.dart';
import 'MyInfoScreen.dart';
import 'SettingsScreen.dart';




class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.image, required this.full_name}) : super(key: key);
  final String image;
  final String full_name;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> userInfos=Provider.of<UserInfosBloc>(context,listen: false).data;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        toolbarHeight: 230,
        backgroundColor: Color.fromRGBO(1, 113, 75, 1),
        flexibleSpace: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 25),
            const Text(
              "My Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
            SizedBox(height: 25),
            Container(

              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(200))
              ),
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(200),



                ),
                child:Image.asset(
                  "lib/UI/assets/Images/User.jpg",
                  fit: BoxFit.fill,
                ),
                //child:  userInfos["data"]["picture"]==null?Image.asset("lib/UI/assets/Images/user.png",fit: BoxFit.fill,):Image.network("${userInfos["data"]["picture"]}",fit: BoxFit.fill,),
              ),
            ),
            SizedBox(height: 8),
            Text("Chamsou berkane",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,fontFamily: 'Poppins', color: Colors.white,),
            ),
          ],
        )),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 350,
                height: 70,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 240, 240, 240),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const MyInfoScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "lib/UI/assets/images/1.png", height: 20, width: 20,),
                          SizedBox(width: 10,),
                          Text(
                            'My info',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward_ios, color: Colors.black,),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10,),
              SizedBox(
                width: 350,
                height: 70,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 240, 240, 240),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          const SettingsScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "lib/UI/assets/images/3.png",
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                height: 70,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 240, 240, 240),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Button action
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "lib/UI/assets/images/4.png",
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Help Center',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CostumNavBar(index: 3),
    );
  }
}
