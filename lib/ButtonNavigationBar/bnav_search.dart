import 'package:flutter/material.dart';
import 'package:life_bank/Custom/color.dart';

class BNav_Search extends StatefulWidget {
  const BNav_Search({Key? key}) : super(key: key);

  @override
  State<BNav_Search> createState() => _BNav_SearchState();
}

class _BNav_SearchState extends State<BNav_Search> {

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


        ],
      ),
    );
  }
}
