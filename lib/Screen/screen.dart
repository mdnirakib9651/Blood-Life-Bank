import 'package:flutter/material.dart';

import '../ButtonNavigationBar/bnav_home.dart';
import '../ButtonNavigationBar/bnav_post.dart';
import '../ButtonNavigationBar/bnav_profile.dart';
import '../ButtonNavigationBar/bnav_request.dart';
import '../ButtonNavigationBar/bnav_search.dart';
import '../Custom/buttonnavigatonbar.dart';
import '../Custom/color.dart';
import '../Custom/custom_drawer.dart';
import '../Custom/images.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {

  int _pageIndex = 3;
  late PageController _pageController;
  late List<Widget> _screenList;

  GlobalKey<ScaffoldMessengerState> _navigationKey = GlobalKey();
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController = PageController(initialPage: 2);
    _screenList = [
      BNavPost(),
      BNav_Search(),
      BNavHome(),
      BNavRequest(),
      BNav_Profile(),
    ];
  }

  _setPage(int index){
    setState(() {
      _pageController.jumpToPage(index);
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      endDrawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        leading: Row(
          children: [
            SizedBox(width: 10,),
            Text("Bl", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
            Text("o", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: ColorResource.COLOR_PRIMARY),),
            Text("od-FCI", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
          ],
        ),
        leadingWidth: 150,
        actions: [
          Builder(
            builder: (BuildContext context){
              return Padding(
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: (){
                    _drawerKey.currentState?.openEndDrawer();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.asset(Images.BLOOD_MENU, color: ColorResource.COLOR_PRIMARY,),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 10, left: 5),
        decoration: BoxDecoration(
            color: ColorResource.COLOR_PRIMARY,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(25))
        ),
        child: Row(
          children: [
            BottonNavItem(icon: Icons.post_add, isSelect: _pageIndex == 0, onTap: () => _setPage(0), text: 'Post',),
            BottonNavItem(icon: Icons.search, isSelect: _pageIndex == 1, onTap: () => _setPage(1), text: 'Blood Search',),
            BottonNavItem(icon: Icons.home, isSelect: _pageIndex == 2, onTap: () => _setPage(2), text: 'Home',),
            BottonNavItem(icon: Icons.person_add_alt_1_rounded, isSelect: _pageIndex == 3, onTap: () => _setPage(3), text: 'Request',),
            BottonNavItem(icon: Icons.person, isSelect: _pageIndex == 4, onTap: () => _setPage(4), text: 'Profile',),
          ],
        ),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemBuilder: (BuildContext context, int index){
            return _screenList[index];
          }),
    );
  }
}
