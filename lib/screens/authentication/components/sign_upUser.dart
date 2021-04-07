import 'package:flutter/material.dart';
import 'package:green_app/dashboard/user_dashboard.dart';
import 'package:green_app/screens/authentication/registration_page.dart';

import '../../../constants.dart';
import 'bg-image.dart';
import 'custome_text_field.dart';

class UserSignUp extends StatefulWidget {
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PersistentBottomSheetController _sheetController;
  String _user;
  String _email;
  String _confirmPassword;
  String _password;
  String _displayName;
  bool _loading = false;
  bool _autoValidate = false;
  String errorMsg = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        BgImage(),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                 logo(),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        
                        Padding(
                            padding: EdgeInsets.only(bottom: 20, top: 60),
                            child: CustomTextField(
                              onSaved: (input) {
                                _user = input;
                              },
                              //validator:emailValidator,
                               
                              validator: (input) =>
                                  input.isEmpty ? "*Required" : null,
                              icon: Icon(Icons.account_box,),
                              hint: "USER NAME",
                              
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: CustomTextField(
                              onSaved: (input) {
                                _email = input;
                              },
                              validator:emailValidator,
                              icon: Icon(Icons.email),
                              hint: "EMAIL",
                            )),
                        Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: CustomTextField(
                              icon: Icon(Icons.lock),
                              obsecure: true,
                              onSaved: (input) => _password = input,
                              validator: (input) =>
                                  input.isEmpty ? "*Required" : null,
                              hint: "PASSWORD",
                            )),
                            
                        Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: CustomTextField(
                              icon: Icon(Icons.lock),
                              obsecure: true,
                              onSaved: (input) => _confirmPassword = input,
                              validator: (input) =>
                                  input.isEmpty ? "*Required" :_confirmPassword!=_password?"*Not Matched*":null,
                              hint: "CONFIRM PASSWORD",
                            )),
                        SizedBox(
                          height: 20,
                        ),
                                      Padding(
                          padding: EdgeInsets.only(
                              left: 80,
                              right: 80,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: _loading == true
                              ? CircularProgressIndicator(
                                  valueColor: new AlwaysStoppedAnimation<Color>(
                                      kPrimaryColor),
                                )
                              : Container(
                                  child: filledButton(
                                    
                                      "Create",
                                      kTextColor,
                                      kPrimaryColor,
                                      kPrimaryColor,
                                      Colors.white,
                                      _validateRegisterInput),
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
          
                      ],
                      )
                      )
                      ]
                      )
                      )
                      )
                      )
                      ]     
     )
      );
  }

  
  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) return '*Required';
    if (!regex.hasMatch(value))
      return '*Enter a valid email';
    else
      return null;
  }

  Widget filledButton(String text, Color splashColor, Color highlightColor,
      Color fillColor, Color textColor, void function()) {
    return RaisedButton(
      highlightElevation: 0.0,
      splashColor: splashColor,
      highlightColor: highlightColor,
      elevation: 0.0,
      color: fillColor,
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
      ),
      onPressed: () {
         //function();
           Navigator.pushReplacement(
                   context, MaterialPageRoute(builder: (context) => UserDashboard()));

       },
    );
  }



  void _validateRegisterInput() async {
    final FormState form = _formKey.currentState;
    if (_formKey.currentState.validate()) {
      form.save();
      _sheetController.setState(() {
        _loading = true;
      });
      try {
                 _sheetController.setState(() {
                errorMsg = "Sucessfully";
                _loading = false;
              
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text(errorMsg),
                      ),
                    );
                  });
                 });
        // UserCredential user =
        // await FirebaseAuth.instance.createUserWithEmailAndPassword();

        // // UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
        // // userUpdateInfo.displayName = _displayName;
        // // user.updateProfile(userUpdateInfo).then((onValue) {
        // //   Navigator.of(context).pushReplacementNamed('/home'); ok ok ye jub firebase hogi tu pir nagviatom hogi ye code ha 
        // //   Firestore.instance.collection('users').document().setData(
        //       {'email': _email, 'displayName': _displayName}).then((onValue) {
        //     _sheetController.setState(() {
        //       _loading = false;
        //     });
        //   });
        // });
      } catch (error) {
        switch (error.code) {
          case "ERROR_EMAIL_ALREADY_IN_USE":
            {
              _sheetController.setState(() {
                errorMsg = "This email is already in use.";
                _loading = false;
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text(errorMsg),
                      ),
                    );
                  });
            }
            break;
          case "ERROR_WEAK_PASSWORD":
            {
              _sheetController.setState(() {
                errorMsg = "The password must be 6 characters long or more.";
                _loading = false;
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text(errorMsg),
                      ),
                    );
                  });
            }
            break;
          default:
            {
              _sheetController.setState(() {
                errorMsg = "";
              });
            }
        }
      }
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Widget logo() {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 220,
        child: Stack(
          children: <Widget>[
            Positioned(
                child: Container(
              child: Align(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: kPrimaryColor),
                  width: 150,
                  height: 150,
                ),
              ),
              height: 154,
            )),
            Positioned(
              child: Container(
                  height: 150,
                  child: Align(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width * 0.15,
              height: MediaQuery.of(context).size.width * 0.15,
              bottom: MediaQuery.of(context).size.height * 0.046,
              right: MediaQuery.of(context).size.width * 0.22,
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width * 0.08,
              height: MediaQuery.of(context).size.width * 0.08,
              bottom: 0,
              right: MediaQuery.of(context).size.width * 0.32,
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}