import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_bank/Custom/color.dart';

Future<DateTime?> getDate(BuildContext context) async {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2010, 12,12),
    lastDate: DateTime(2040, 7, 15),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(
            primary: ColorResource.COLOR_PRIMARY,
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child!,
      );
    },
  );
}