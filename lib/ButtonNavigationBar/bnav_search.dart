import 'package:flutter/material.dart';
import 'package:life_bank/Custom/color.dart';

import '../Custom/images.dart';
import '../Screen/varify.dart';

class BNav_Search extends StatefulWidget {
  const BNav_Search({Key? key}) : super(key: key);

  @override
  State<BNav_Search> createState() => _BNav_SearchState();
}

class _BNav_SearchState extends State<BNav_Search> {

  int isClick = 0;

  String? DivisionChoose;
  String? DistrictChoise;
  String? UpazilasChoise;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: ColorResource.COLOR_PRIMARY,
            child: Center(child: Text("The address of where the blood will be taken", style: TextStyle(fontSize: 20, color: Colors.white, ),)),
          ),

          //......................Division.................
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: ColorResource.COLOR_PRIMARY),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: DropdownButton(
                  hint: Text("Division", style: TextStyle(color: ColorResource.COLOR_PRIMARY),),
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
          ),

          //...................... Distric.....................
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: ColorResource.COLOR_PRIMARY),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: DropdownButton(
                  hint: Text("District", style: TextStyle(color: ColorResource.COLOR_PRIMARY),),
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
          ),


          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: ColorResource.COLOR_PRIMARY),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: DropdownButton(
                  hint: Text("Upazilas", style: TextStyle(color: ColorResource.COLOR_PRIMARY),),
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
          ),

          //...................... Blood Group...............
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      isClick == 1;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: isClick == 1 ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorResource.COLOR_PRIMARY,
                    ) : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: ColorResource.COLOR_PRIMARY, width: 2)
                    ),
                    child: Center(child: Text("A+", style: TextStyle(color: isClick == 1 ? Colors.white : ColorResource.COLOR_PRIMARY, fontSize: 18, fontWeight: FontWeight.w800),)),
                  ),
                ),

                InkWell(
                  onTap: (){
                    setState(() {
                      isClick == 2;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: isClick == 2 ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorResource.COLOR_PRIMARY,
                    ) : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: ColorResource.COLOR_PRIMARY, width: 2)
                    ),
                    child: Center(child: Text("A-", style: TextStyle(color: isClick == 2 ? Colors.white : ColorResource.COLOR_PRIMARY, fontSize: 18, fontWeight: FontWeight.w800),)),
                  ),
                ),

                InkWell(
                  onTap: (){
                    setState(() {
                      isClick == 3;
                      print("2");
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: isClick == 3 ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorResource.COLOR_PRIMARY,
                    ) : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: ColorResource.COLOR_PRIMARY, width: 2)
                    ),
                    child: Center(child: Text("B+", style: TextStyle(color: isClick == 3 ? Colors.white : ColorResource.COLOR_PRIMARY, fontSize: 18, fontWeight: FontWeight.w800),)),
                  ),
                ),

                InkWell(
                  onTap: (){
                    setState(() {
                      isClick == 4;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: isClick == 4 ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorResource.COLOR_PRIMARY,
                    ) : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: ColorResource.COLOR_PRIMARY, width: 2)
                    ),
                    child: Center(child: Text("B-", style: TextStyle(color: isClick == 4 ? Colors.white : ColorResource.COLOR_PRIMARY, fontSize: 18, fontWeight: FontWeight.w800),)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      isClick == 5;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: isClick == 5 ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorResource.COLOR_PRIMARY,
                    ) : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: ColorResource.COLOR_PRIMARY, width: 2)
                    ),
                    child: Center(child: Text("0+", style: TextStyle(color: isClick == 5 ? Colors.white : ColorResource.COLOR_PRIMARY, fontSize: 18, fontWeight: FontWeight.w800),)),
                  ),
                ),

                InkWell(
                  onTap: (){
                    setState(() {
                      isClick == 6;
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: isClick == 6 ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorResource.COLOR_PRIMARY,
                    ) : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: ColorResource.COLOR_PRIMARY, width: 2),
                    ),
                    child: Center(child: Text("0-", style: TextStyle(color: isClick == 6 ? Colors.white : ColorResource.COLOR_PRIMARY, fontSize: 18, fontWeight: FontWeight.w800),)),
                  ),
                ),

                InkWell(
                  onTap: (){
                    setState(() {
                      isClick == 7;
                      print("2");
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: isClick == 7 ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorResource.COLOR_PRIMARY,
                    ) : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: ColorResource.COLOR_PRIMARY, width: 2)
                    ),
                    child: Center(child: Text("AB+", style: TextStyle(color: isClick == 7 ? Colors.white : ColorResource.COLOR_PRIMARY, fontSize: 18, fontWeight: FontWeight.w800),)),
                  ),
                ),

                InkWell(
                  onTap: (){
                    setState(() {
                      isClick == 8;
                      print("2");
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: isClick == 8 ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorResource.COLOR_PRIMARY,
                    ) : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: ColorResource.COLOR_PRIMARY, width: 2)
                    ),
                    child: Center(child: Text("AB-", style: TextStyle(color: isClick == 8 ? Colors.white : ColorResource.COLOR_PRIMARY, fontSize: 18, fontWeight: FontWeight.w800),)),
                  ),
                ),
              ],
            ),
          ),

          //.....................
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: InkWell(
              onTap: (){

              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ColorResource.COLOR_PRIMARY
                ),
                child: Text("Search Donar",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20,),
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Donar List", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: ColorResource.COLOR_PRIMARY),),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20,),
            child: Container(
              height: 125,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1,
                    spreadRadius: 1,
                  )
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: ColorResource.RED_SHEDO,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(child: Text("AB+", style: TextStyle(color: ColorResource.COLOR_PRIMARY, fontSize: 10, fontWeight: FontWeight.bold),)),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                  child: Text("Md.Nazrul Islam Rakib", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45, top: 5),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Last Donation : 10-06-2022", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 14),),
                                  SizedBox(height: 5,),
                                  Text("Location : Flugazi, Feni", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 14),),
                                  SizedBox(height: 5,),
                                  Container(
                                    height: 30,
                                    width: 140,
                                    decoration: BoxDecoration(
                                      color: ColorResource.COLOR_PRIMARY,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 25,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
