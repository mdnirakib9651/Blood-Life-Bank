import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:life_bank/Custom/color.dart';
import 'package:life_bank/FireBase%20FireStore%20DataBase/fire_crud.dart';
import 'package:life_bank/Screen/screen.dart';

import '../Custom/datetime.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController timeDonarController = TextEditingController();
  String birthdate = "Birth Date";
  String? selectGender;
  String? selectBloodGroup;
  String lastdate = "What is the last date of blood donation?";
  String? DivisionChoose;
  String? DistrictChoise;
  String? UpazilasChoise;
  String? unionChoise;




  List GenderItem = [
    "Select Gender",
    "Male",
    "Female"
  ];

  List BloodGroup = [
    "Select Blood Group",
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-",
  ];

  List DivisionItem = [
    "Dhaka",
    "Chittagong",
    "Rajshahi",
    "Sylhet",
    "Khulna",
    "Barisal",
    "Rangpur",
    "Mymensingh",
  ];
  List DistrictItem = [
    "Dhaka",
    "Gazipur",
    "Kishoreganj",
    "Manikganj",
    "	Munshiganj",
    "Narayanganj",
    "Narsingdi",
    "Tangail",
    "Faridpur",
    "Gopalganj",
    "Madaripur",
    "Rajbari",
    "Shariatpur",
  ];
  List Upazilas = [
    "Dohar",
    "Keraniganj",
    "Dhamrai",
    "Nawabganj",
    "Savar",
  ];
  List Union = [

  ];

  final GlobalKey<FormState> _ScaffoldKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: ColorResource.COLOR_PRIMARY,
            child: Center(child: Text("SingUp", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),)),
          ),
          SizedBox(height: 20,),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorResource.COLOR_PRIMARY
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Form(
              key: _ScaffoldKey,
              child: Column(
                children: [

                  //.................. Name .........................
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: ColorResource.COLOR_PRIMARY,fontSize: 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: ColorResource.COLOR_PRIMARY,
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY),
                      ),
                      suffixIcon: Icon(Icons.person, color: ColorResource.COLOR_PRIMARY,),
                    ),
                  ),

                  //....................Phone.................
                  SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                    },
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
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY),
                      ),
                      suffixIcon: Icon(Icons.call, color: ColorResource.COLOR_PRIMARY,),
                    ),
                  ),

                  //...................Email.....................
                  SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: ColorResource.COLOR_PRIMARY,fontSize: 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: ColorResource.COLOR_PRIMARY,
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY),
                      ),
                      suffixIcon: Icon(Icons.email, color: ColorResource.COLOR_PRIMARY,),
                    ),
                  ),


                  //....................Birth Date.......................
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () async {
                      DateTime? dateTime = await getDate(context);
                      String? day;
                      String? month;
                      String? year;
                      dateTime!.day<10 ? day='0${dateTime.day}' : day='${dateTime.day}';
                      dateTime.month<10 ? month='0${dateTime.month}' : month='${dateTime.month}';
                      year='${dateTime.year}';
                      birthdate='$day-$month-$year';
                      setState(() {

                      });
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(birthdate, style: TextStyle(fontWeight: FontWeight.bold, color: ColorResource.COLOR_PRIMARY,fontSize: 16),),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //..................... Gender........................
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: DropdownButton(
                        hint: Text("Select Gender", style: TextStyle(color: ColorResource.COLOR_PRIMARY, fontWeight: FontWeight.bold),),
                        icon: Icon(Icons.arrow_drop_down, color: ColorResource.COLOR_PRIMARY,),
                        iconSize: 30,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: ColorResource.COLOR_PRIMARY,
                          fontSize: 18,
                        ),
                        value: selectGender,
                        onChanged: (value){
                          setState(() {
                            selectGender = value as String?;
                          });
                        },
                        items: GenderItem.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  //......................Blood Group........................
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: DropdownButton(
                        hint: Text("Select Blood Group", style: TextStyle(color: ColorResource.COLOR_PRIMARY, fontWeight: FontWeight.bold),),
                        icon: Icon(Icons.arrow_drop_down, color: ColorResource.COLOR_PRIMARY,),
                        iconSize: 30,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: ColorResource.COLOR_PRIMARY,
                          fontSize: 18,
                        ),
                        value: selectBloodGroup,
                        onChanged: (value){
                          setState(() {
                            selectBloodGroup = value as String?;
                          });
                        },
                        items: BloodGroup.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  //.................. Time Donar..........................
                  SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: timeDonarController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'This field is required';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "How many times have you donated blood?",
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, color: ColorResource.COLOR_PRIMARY,fontSize: 16),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorResource.COLOR_PRIMARY),
                      ),
                    ),
                  ),

                  //....................
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: () async {
                      DateTime? dateTime = await getDate(context);
                      String? day;
                      String? month;
                      String? year;
                      dateTime!.day<10 ? day='0${dateTime.day}' : day='${dateTime.day}';
                      dateTime.month<10 ? month='0${dateTime.month}' : month='${dateTime.month}';
                      year='${dateTime.year}';
                      lastdate='$day-$month-$year';
                      setState(() {

                      });
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(lastdate, style: TextStyle(fontWeight: FontWeight.bold, color: ColorResource.COLOR_PRIMARY,fontSize: 16),),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Text("Permanent Address ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: ColorResource.COLOR_PRIMARY),),
                      ],
                    ),
                  ),

                  //.................. Division..................

                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: DropdownButton(
                        hint: Text("Division", style: TextStyle(color: ColorResource.COLOR_PRIMARY, fontWeight: FontWeight.bold),),
                        icon: Icon(Icons.arrow_drop_down, color: ColorResource.COLOR_PRIMARY,),
                        iconSize: 30,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: ColorResource.COLOR_PRIMARY,
                          fontSize: 18,
                        ),
                        value: DivisionChoose,
                        onChanged: (value){
                          setState(() {
                            DivisionChoose = value as String?;
                          });
                        },
                        items: DivisionItem.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  //...................... Distric.....................
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: DropdownButton(
                        hint: Text("District", style: TextStyle(color: ColorResource.COLOR_PRIMARY, fontWeight: FontWeight.bold),),
                        icon: Icon(Icons.arrow_drop_down, color: ColorResource.COLOR_PRIMARY,),
                        iconSize: 30,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: ColorResource.COLOR_PRIMARY,
                          fontSize: 18,
                        ),
                        value: DistrictChoise,
                        onChanged: (value){
                          setState(() {
                            DistrictChoise = value as String?;
                          });
                        },
                        items: DistrictItem.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  //.................Upazilas..........................
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: DropdownButton(
                        hint: Text("Upazilas", style: TextStyle(color: ColorResource.COLOR_PRIMARY, fontWeight: FontWeight.bold),),
                        icon: Icon(Icons.arrow_drop_down, color: ColorResource.COLOR_PRIMARY,),
                        iconSize: 30,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: ColorResource.COLOR_PRIMARY,
                          fontSize: 18,
                        ),
                        value: UpazilasChoise,
                        onChanged: (value){
                          setState(() {
                            UpazilasChoise = value as String?;
                          });
                        },
                        items: Upazilas.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  //,,,,,,,,,,,,,,,,,,,,,,Union..................
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: DropdownButton(
                        hint: Text("Union", style: TextStyle(color: ColorResource.COLOR_PRIMARY, fontWeight: FontWeight.bold),),
                        icon: Icon(Icons.arrow_drop_down, color: ColorResource.COLOR_PRIMARY,),
                        iconSize: 30,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: ColorResource.COLOR_PRIMARY,
                          fontSize: 18,
                        ),
                        value: unionChoise,
                        onChanged: (value){
                          setState(() {
                            unionChoise = value as String?;
                          });
                        },
                        items: Union.map((valueItem){
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  //..................... Registation................
                  SizedBox(height: 40,),
                  InkWell(
                    onTap: () async {
                      if (_ScaffoldKey.currentState!.validate()){
                        var response = await FirebaseCrud.SingUp_CRUD(
                            name: nameController.text,
                            phone: phoneController.text,
                            email: emailController.text,
                            birthdate: birthdate);
                        if(response.code != 200){
                          Fluttertoast.showToast(
                              msg: response.message.toString(),
                            fontSize: 18,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white
                          );
                        }
                        else{
                          Fluttertoast.cancel();
                        }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: ColorResource.COLOR_PRIMARY
                      ),
                      child: Text("Registation Now",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ScreenHome()));
                          },
                          child: Text("Skip >", style: TextStyle(fontWeight: FontWeight.bold, color: ColorResource.COLOR_PRIMARY),)),
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
