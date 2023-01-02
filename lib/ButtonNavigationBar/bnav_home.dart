import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Custom/button_gridview.dart';
import '../Custom/color.dart';
import '../Custom/custom_drawer.dart';
import '../Custom/images.dart';
import 'bnav_profile.dart';
import 'bnav_search.dart';

class BNavHome extends StatefulWidget {
  const BNavHome({Key? key}) : super(key: key);

  @override
  State<BNavHome> createState() => _BNavHomeState();
}

class _BNavHomeState extends State<BNavHome> {

  // GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
  List SlideList = [
    {'id': 1, "image_path" : "assets/image/slider4.jpg"},
    {'id': 2, "image_path" : "assets/image/slider5.jpg"},
    {'id': 3, "image_path" : "assets/image/search7.png"},
    {'id': 4, "image_path" : "assets/image/slider6.jpg"},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      // key: _drawerKey,
      // endDrawer: CustomDrawer(),
      body: ListView(
        children: [
          // Container(
          //   height: 70,
          //   width: MediaQuery.of(context).size.width,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.all(14),
          //         child: Container(
          //           child: Row(
          //             children: [
          //               Text("Bl", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          //               Text("o", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorResource.COLOR_PRIMARY),),
          //               Text("od-FCI", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          //             ],
          //           ),
          //         ),
          //       ),
          //       //..............Drawer.............
          //       Builder(
          //         builder: (BuildContext context){
          //           return Padding(
          //             padding: EdgeInsets.all(8),
          //             child: InkWell(
          //               onTap: (){
          //                 _drawerKey.currentState?.openEndDrawer();
          //               },
          //               child: Container(
          //                 height: 40,
          //                 width: 40,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10),
          //                 ),
          //                 child: Padding(
          //                   padding: EdgeInsets.all(8),
          //                   child: Image.asset(Images.BLOOD_MENU, color: ColorResource.COLOR_PRIMARY,),
          //                 ),
          //               ),
          //             ),
          //           );
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height/3,
          //     width: MediaQuery.of(context).size.width,
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: ColorResource.COLOR_PRIMARY,
          //     ),
          //   ),
          // ),
          SizedBox(height: 10,),
          Stack(
            children: [
              InkWell(
                onTap: (){
                  print(currentIndex);
                },
                child: CarouselSlider(
                    items: SlideList.map(
                          (item) => Image.asset(
                              item['image_path'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                    ).toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason){
                        setState(() {
                          currentIndex = index;
                        });
                      }
                    )),
              ),
              Positioned(
                bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: SlideList.asMap().entries.map((entry){
                      print(entry);
                      print(entry.key);
                      return GestureDetector(
                        onTap: () => carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key? 17 : 7,
                          height: 7,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == entry.key
                              ? ColorResource.COLOR_PRIMARY : ColorResource.COLOR_PRIMARY
                          ),
                        ),
                      );
                    }).toList(),
                  ))
            ],
          ),

          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                height: MediaQuery.of(context).size.height/2.3,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: ColorResource.COLOR_PRIMARY, width: 2),
                    top: BorderSide(color: ColorResource.COLOR_PRIMARY, width: 2),
                    left: BorderSide(color: ColorResource.COLOR_PRIMARY, width: 2),
                    bottom: BorderSide(color: ColorResource.COLOR_PRIMARY, width: 2),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GridView.count(
                      crossAxisCount: 3,
                    padding: EdgeInsets.only(top: 50),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: [
                      ButtonGridview(image: Image.asset(Images.B_SEARCH), title: "Blood Search", onTab: () => BNav_Search()),
                      ButtonGridview(image: Image.asset(Images.B_POST), title: "Post For Blood", onTab: () => BNav_Profile()),
                      ButtonGridview(image: Image.asset(Images.B_ACTIVITIES), title: "Our Activities", onTab: () => BNav_Profile()),
                      ButtonGridview(image: Image.asset(Images.B_COMMUNICATION), title: "Communication", onTab: () => BNav_Profile()),
                      ButtonGridview(image: Image.asset(Images.B_SUPPLY), title: "Blood Supply", onTab: () => BNav_Profile()),
                      ButtonGridview(image: Image.asset(Images.B_INFORMATION), title: "Blood Information", onTab: () => BNav_Profile()),
                    ],
                  ),
                ),
          ),

        ],
      ),
    );
  }
}
