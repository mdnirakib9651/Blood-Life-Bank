import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:life_bank/Screen/signup.dart';

import '../Custom/color.dart';
import 'loging_page.dart';
import 'screen.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {

  TextEditingController verifyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 150, left: 20, right: 20,),
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("Verification Code", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)),
                  Expanded(child: Text("We have send the code verification code to", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey[600]),)),
                  Row(
                    children: [
                      Text("Change Phone number?", style: TextStyle(color: ColorResource.COLOR_PRIMARY, fontSize: 16, fontWeight: FontWeight.bold),),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LogingPage()));
                          },
                          child: Text("01858949651", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 16),)),
                    ],
                  )
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),

            child: Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: ColorResource.COLOR_PRIMARY
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY)
                        ),
                      ),
                      onSaved: (pin1){},
                      style: Theme.of(context).textTheme.headline3,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),



                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: ColorResource.COLOR_PRIMARY
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY)
                        ),
                      ),
                      onSaved: (pin2){},
                      style: Theme.of(context).textTheme.headline3,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),


                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: ColorResource.COLOR_PRIMARY
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY)
                        ),
                      ),
                      onSaved: (pin3){},
                      style: Theme.of(context).textTheme.headline3,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),


                  SizedBox(
                    height: 68,
                    width: 64,
                    child: TextFormField(
                      onChanged: (value){
                        if(value.length == 1){
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: ColorResource.COLOR_PRIMARY
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY)
                        ),
                      ),
                      onSaved: (pin4){},
                      style: Theme.of(context).textTheme.headline3,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          //..............Verify..................
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorResource.COLOR_PRIMARY
                ),
                child: Text("Verify",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
