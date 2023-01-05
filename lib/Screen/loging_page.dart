
import 'package:flutter/material.dart';
import 'package:life_bank/Custom/color.dart';
import 'package:life_bank/Custom/images.dart';
import 'package:life_bank/Screen/screen.dart';

import 'varify.dart';

class LogingPage extends StatefulWidget {
  const LogingPage({Key? key}) : super(key: key);

  @override
  State<LogingPage> createState() => _LogingPageState();
}

class _LogingPageState extends State<LogingPage> {

  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _LogingKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20,),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Text("Bl", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                  Text("o", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: ColorResource.COLOR_PRIMARY),),
                  Text("od-FCI", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                ],
              )
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 250, left: 20, right: 20,),
            child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Text("Welcome ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                    Row(
                      children: [
                        Text("Bl", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        Text("o", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorResource.COLOR_PRIMARY),),
                        Text("od-FCI", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ],
                    ),
                    Text(" Donation!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                  ],
                ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Form(
              key: _LogingKey,
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold, color: ColorResource.COLOR_PRIMARY,fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: ColorResource.COLOR_PRIMARY,
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY),
                  ),
                  suffixIcon: Icon(Icons.phone, color: ColorResource.COLOR_PRIMARY,),
                ),
              ),
            ),
          ),

          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyCode()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorResource.COLOR_PRIMARY
                ),
                child: Text("Login",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
