
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:green_app/navbars/user_navbar.dart';
import 'package:green_app/screens/authentication/components/navBg_image.dart';
import 'package:green_app/screens/details/components/body.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:green_app/screens/authentication/components/bg-image.dart';
import 'package:green_app/screens/authentication/components/bg_image1.dart';
import 'package:green_app/screens/authentication/components/bg_image2.dart';
class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
  
}

class _UserDashboardState extends State<UserDashboard> {

 CameraController _control;
  Future<void> _future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initApp();
  }

  void _initApp() async
  {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCam = cameras.first;

    _control = CameraController(
      firstCam,
      ResolutionPreset.high,
    );

    _future = _control.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _control.dispose();
  }



   int index = 0;
    List<Widget> _widgets = [screen1(), screen2(), screen3()];
    tapped(int tappedIndex) {
      
        setState(() {index = tappedIndex;});
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:const EdgeInsets.only(right:12.0),
          child:
          new IconButton(icon: Icon(Icons.menu), 
          onPressed: (){
             Navigator.pushReplacement(
                   context, MaterialPageRoute(builder: (context) => UserMenue()));
         
          },)),
        title: Text('Page title'),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: new IconButton(icon:Icon(Icons.search),
            onPressed: (){
              
            },),
            
          ),
        ],
      ),
          body:
           
          _widgets[index],

                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.green[100],
                currentIndex: index,
                onTap: tapped,
                items: [
                    BottomNavigationBarItem(icon: new Icon(Icons.home), title: Text('Home')),
                    BottomNavigationBarItem(icon: new Icon(Icons.chat_bubble_sharp), title: Text('Chat')),
                    BottomNavigationBarItem(icon: new Icon(Icons.camera_alt_rounded), title: Text('Camera'),
                    backgroundColor:Colors.blueGrey[400]),
                                  ],
             ),
         
    
    );
  }
}
screen1() {
    // return Scaffold(
    //   body:Stack(
    //   fit: StackFit.expand,
    //   children: <Widget>[
    //     BgImage(),
    //     Center(
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: SingleChildScrollView(
    //           child: Column(
    //             children: <Widget>[
    //        ]))))])
    // );



}
screen2() {
     return Scaffold(
      body:Stack(
      fit: StackFit.expand,
      children: <Widget>[
        BgImage1(),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  
           ]))))])
    );
}
screen3() {
         var _future;
         return Scaffold(
      body:Stack(
      fit: StackFit.expand,
      children: <Widget>[
        BgImage2(),
        Body(),
       
])
    );
}


 class DisplayPicture extends StatelessWidget {
  String imagepath;
  DisplayPicture({this.imagepath});

  @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(title: Text('Display the Picture')),
        // The image is stored as a file on the device. Use the `Image.file`
        // constructor with the given path to display the image.
        body:Stack (
         
        children: <Widget>[
           Image.file(File(imagepath)),
        ]
      ));
    }
  }