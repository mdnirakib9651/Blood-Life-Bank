import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../FireBase FireStore DataBase/fire_crud.dart';
import 'color.dart';
import 'images.dart';

class CustomDrawer extends StatelessWidget {
   CustomDrawer({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> collectionReference = FirebaseCrud.SingUp_read();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: collectionReference,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if (snapshot.hasData){
          return Drawer(
            child: ListView(
              children: snapshot.data!.docs.map((e){
                return Column(
                  children: [
                    Container(
                      height: 230,
                      decoration: BoxDecoration(
                        color: ColorResource.COLOR_PRIMARY,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 40,),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(Images.DOCTOR_IMAGE, fit: BoxFit.cover,),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(e['SingUp_name'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(height: 5,),
                          Text(e['SingUp_phone'], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ListTile(
                      leading: Icon(
                        Icons.bloodtype_outlined,color: ColorResource.COLOR_PRIMARY,
                      ),
                      title: Text("Blood group : AB+",style: TextStyle(color: Colors.black,fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(Icons.mail,color: ColorResource.COLOR_PRIMARY,),
                      title: Text(e['SingUp_email'],style: TextStyle(color: Colors.black,fontSize: 16),),
                    ),
                    ListTile(
                      leading: Icon(Icons.calendar_month,color: ColorResource.COLOR_PRIMARY,),
                      title: Text("Last blood donation : ",style: TextStyle(color: Colors.black,fontSize: 18),),
                    ),

                    ListTile(
                      leading: Icon(
                        Icons.directions_walk_outlined,color: ColorResource.COLOR_PRIMARY,
                      ),
                      title: Text("How many times blood donate : ",style: TextStyle(color: Colors.black,fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.create_outlined,color: ColorResource.COLOR_PRIMARY,
                      ),
                      title: Text("Update blood donation date : ",style: TextStyle(color: Colors.black,fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.create_outlined,color: ColorResource.COLOR_PRIMARY,
                      ),
                      title: Text("Update profile",style: TextStyle(color: Colors.black,fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.logout_outlined,color: ColorResource.COLOR_PRIMARY,
                      ),
                      title: Text("Log out",style: TextStyle(color: Colors.black,fontSize: 18),),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.people_outlined,color: ColorResource.COLOR_PRIMARY,
                      ),
                      title: Text("About Developer",style: TextStyle(color: Colors.black,fontSize: 18),),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.share_outlined,color: ColorResource.COLOR_PRIMARY,
                      ),
                      title: Text("Share",style: TextStyle(color: Colors.black,fontSize: 18),),
                    ),
                  ],
                );
              }).toList()

            ),
          );} return Container();
      }
    );
  }
}