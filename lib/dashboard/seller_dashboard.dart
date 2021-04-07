import 'package:flutter/material.dart';
import 'package:green_app/screens/authentication/components/category_chosen.dart';
class SellerDashboard extends StatefulWidget {
  @override
  _SellerDashboardState createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
   
  String value;
  Card makeDashboardsItem(String title, IconData icon) {
    return Card(
        elevation: 2.0,
        margin: new EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
          child: new InkWell(
            onTap: () {
              if (title=='Sign Out')
              {
                  Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Category()));
              }
              else if(title=='Add Post')
              {// Navigator.pushReplacement(
                 //context, MaterialPageRoute(builder: (context) => CameraConnect()));
              }
                else if(title=='Settings')
              { //Navigator.pushReplacement(
                // context, MaterialPageRoute(builder: (context) => SellerSettings()));
              }

            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 40.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.black,
                )),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(title,
                      style:
                          new TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
             appBar: new AppBar(
        backgroundColor: Colors.blueGrey[900],
        elevation: 1,
        title: Text("Dashboard",style: TextStyle(fontSize: 20),),  
             actions: [
               IconButton(
                 icon: Icon(
                   Icons.send,
                   color: Colors.blueGrey[200],
                 ),
                 onPressed: (){
      //Navigator.pushReplacement(
                  //context, MaterialPageRoute(builder: (context) =>()));
                  },
               ),
             ],  
      ),
        body:  Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
         crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
          
             Card(
            
              margin:  const EdgeInsets.all(0.0),
            color: Colors.blueGrey,
            child: ListTile(
              onTap: (){
                //go to profile edit
              },
              title: Text("Company Name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              ),
              leading: CircleAvatar(
                radius: 20,
                backgroundImage:   new NetworkImage(
                                          "https://i.tribune.com.pk/media/images/nurseries1593552436-0/nurseries1593552436-0.jpg"
                                          
                ),
              ),),
            ),
        
            makeDashboardsItem("Views", Icons.view_agenda),
            makeDashboardsItem("Status", Icons.online_prediction_outlined),            
            makeDashboardsItem("Add Post", Icons.add_photo_alternate_outlined),
            makeDashboardsItem("Stock", Icons.store_mall_directory_outlined),
            makeDashboardsItem("FeedBack", Icons.mark_chat_read_sharp),
            makeDashboardsItem("Settings", Icons.settings),
            makeDashboardsItem("Sign Out", Icons.logout,)
          
          ],
          ),
        
        ),      
          
              );  
    
  }
}