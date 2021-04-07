import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:green_app/constants.dart';
import 'package:green_app/screens/authentication/components/bg_image2.dart';
import 'package:green_app/screens/authentication/components/navBg_image.dart';
class UserMenue extends StatefulWidget {
  @override
   _UserMenueState createState() =>  _UserMenueState();
}

class _UserMenueState extends State <UserMenue> {
  @override
    Widget build(BuildContext context) {

    return Drawer(
      
      
      child: 
      
      ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          
          //UsNavBg(),
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 30),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/bottom_img_1.png',
                    ),

      )),
          ),
          
         // Color(Colors.black38),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
  