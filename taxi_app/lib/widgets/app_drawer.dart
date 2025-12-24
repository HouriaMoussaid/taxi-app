import 'package:flutter/material.dart';


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
            onTap:(){}
          ),
          ListTile(
              leading:  Icon(Icons.person),
              title:  Text("Profile Page"),
              onTap:(){} 
          ),
        ],
      ),
    );
  }
}