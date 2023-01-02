import 'package:flutter/material.dart';
import 'color.dart';
import 'images.dart';

class ButtonGridview extends StatelessWidget {

  final Image image;
  final String title;
  Function onTab;

  ButtonGridview({Key? key, required this.image, required this.title, required this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => onTab()));
      },
      child: Container(
        height: 105,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    bottom: BorderSide(color: ColorResource.COLOR_PRIMARY, width: 2),
                    top: BorderSide(color: ColorResource.COLOR_PRIMARY, width: 2),
                    left: BorderSide(color: ColorResource.COLOR_PRIMARY, width: 2),
                    right: BorderSide(color: ColorResource.COLOR_PRIMARY, width: 2),
                  )
              ),
              padding: const EdgeInsets.all(10),
              child: image,
            ),
            SizedBox(height: 5,),
            Container(
              height: 20,
              child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: ColorResource.COLOR_PRIMARY),),
            )
          ],
        ),
      ),
    );
  }
}
