import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottonNavItem extends StatelessWidget {

  final IconData icon;
  String? text;
  final bool isSelect;
  late Function() onTap;

  BottonNavItem({Key? key, required this.icon,required this.text, required this.isSelect, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          onTap();
        },
        child: Column(
          children: [
            Icon(icon, color: Colors.white,),
            Text(text!, style: TextStyle(color: Colors.white),),
          ],
        ),
      ),
    );
  }
}