import 'package:flutter/material.dart';
import 'package:green_app/dashboard/seller_dashboard.dart';
import 'package:green_app/screens/authentication/components/sign_upUser.dart';

import 'bg-image.dart';
class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    var _formKey;
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
                //  logo(),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[ 
                      Text("SignUp As ",style: TextStyle(color: Colors.green[300],fontSize: 40,fontFamily: "Montserat",fontWeight: FontWeight.bold),),
                      SizedBox(height: 40,),
                        ClipOval(
                          child: Material(
                             color: Colors.blueGrey[300], // button color
                            child: InkWell(
                             splashColor: Colors.green[400], // inkwell color
                             child: SizedBox(width: 130, height: 130, 
                             child:
                              Icon(Icons.store_mall_directory_outlined,color: Colors.white,
                              size: 80,
                              )
                             ),
                             onTap: () {   Navigator.pushReplacement(
                               context, MaterialPageRoute(builder: (context) => SellerDashboard())); },
                            ),
                          ), 
                        ),
                        SizedBox(height: 5),
                        
                      Text("NURSURY",style: TextStyle(color: Colors.white60,fontSize: 30,fontFamily: "Montserat",fontWeight: FontWeight.bold),),
                      SizedBox(height: 40,),
                        ClipOval(
                          child: Material(
                             color: Colors.blueGrey[300], // button color
                            child: InkWell(
                             splashColor: Colors.green[400], // inkwell color
                             child: SizedBox(width: 130, height: 130, 
                             child:
                             
                              Icon(Icons.transfer_within_a_station_rounded,color: Colors.white,
                              size: 80,
                              )
                             ),
                             onTap: () {
                               Navigator.pushReplacement(
                               context, MaterialPageRoute(builder: (context) => UserSignUp()));
                               },
                            ),
                          ), 
                        ),
                        SizedBox(height:5),
                      
                        Text("USER",style: TextStyle(color: Colors.white60,fontSize: 30,fontFamily: "Montserat",fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      
                      ]
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
}