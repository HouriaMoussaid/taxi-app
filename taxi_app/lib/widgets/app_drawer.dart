import 'package:flutter/material.dart';
import 'package:taxi_app/widgets/test1.dart';
import 'package:taxi_app/widgets/test2.dart';

class AppDrawer extends StatelessWidget{
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context){
    return Drawer(
      child:ListView(
        children: [
           DrawerHeader(
              child: Center(
                child:
                 Text("wsselna"),
              ),
          ),
          ListTile(
            leading:  Icon(Icons.home),
            title:  Text("Chauffeur"),
            onTap:(){Navigator.push(context,
                MaterialPageRoute(builder: (context)=>
                const Test1(),
                ),
              );}
          ),
          ListTile(
              leading:  Icon(Icons.person),
              title:  Text("Profile Page"),
              onTap:(){Navigator.push(context,
                MaterialPageRoute(builder: (context)=>
                const Test2(),
                ),
              );} 
          ),
        ],
      ),
    );
  }
}