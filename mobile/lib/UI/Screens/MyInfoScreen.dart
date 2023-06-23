//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile3/UI/Screens/HomeScreen.dart';
import 'package:mobile3/UI/Screens/ProfileScreen.dart';
import 'package:mobile3/UI/Widjets/CostumNavBar.dart';
import 'dart:async';
import 'dart:io';

import 'package:provider/provider.dart';

import '../../Bloc/UserInfosBloc.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({Key? key}) : super(key: key);

  @override
  _MyInfoScreenState createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  File? _image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
  bool _obscureText = true;
  bool _obscureText2 = true;
  final _formKey = GlobalKey<FormState>();
  late String _email, _password, _confirmPassword;
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_password != _confirmPassword) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Passwords don't match"),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      } else {
             await Provider.of<UserInfosBloc>(context, listen: false).setUserInfos(
                  _image, _email);
              Map<String, dynamic> data = Provider.of<UserInfosBloc>(context, listen: false).data;
                 (data) {
                   if (data["statusCode"] == 200 &&
                       data["data"]["role"] == "AM") {
                     Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(
                           builder: (context) =>
                           const HomeScreen()),
                     );
                   }
                 };

      /*  await Provider.of<UserInfosBloc>(context, listen: false).setPassword(
            _password);
        Map<String, dynamic> data2 = Provider
            .of<UserInfosBloc>(context, listen: false)
            .data;
        if (data2["statusCode"] == 200 && data2["data"]["role"] == "AM") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                const HomeScreen()),
          );
        }*/
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 25),
                const Text(
                  "My Info",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 25),
                _image != null
                    ? Image.file(_image!,height: 100,
                  width: 100,)
                    : Image.asset(
                  "lib/UI/assets/images/profile.png",
                  height: 100,
                  width: 100,
                ),

                SizedBox(height: 8),
                TextButton(
                  onPressed: _openImagePicker,
                  child: const Text(
                    "Upload Images",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      color: Color.fromRGBO(1, 113, 75, 1),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 40, left: 20, bottom: 20, right: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(200, 51, 51, 51),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (input) {
                          // handle email input changes
                        },
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!input.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        onSaved: (input) => _email = input!,
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        obscureText: _obscureText,
                        validator: (input) {
                          if (input!.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                        onSaved: (input) => _password = input!,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 51, 51, 51),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        obscureText: _obscureText2,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return 'Please confirm your password';
                          }
                          return null;
                        },
                        onSaved: (value) => _confirmPassword = value!,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: Color.fromARGB(255, 51, 51, 51),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText2 = !_obscureText2;
                              });
                            },
                            child: Icon(
                              _obscureText2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 50,
                      width: 300,
                      child: MaterialButton(
                        onPressed: _submit,
                        color: const Color.fromARGB(255, 33, 130, 97),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.0),
                        ),
                        child: const Text(
                          "Save Changes",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CostumNavBar(index: 3),
    );
  }
}
