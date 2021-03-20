import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kSplash = Color(0xff0F6657);
const kText = Color(0xffFBA808);

final kStyle = GoogleFonts.inter(
  color: kText,
  fontSize: 50,
  fontWeight: FontWeight.w800,
);

Widget button({
  BuildContext context,
  VoidCallback onPressed,
  MaterialStateProperty<Color> buttonColor,
  Color borderColor,
  String buttonText,
  TextStyle bTextStyle,
  MaterialStateProperty<EdgeInsets> padding,
}) {
  return ElevatedButton(
    style: ButtonStyle(
        backgroundColor: buttonColor,
        padding: padding,
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            /*side: BorderSide(
              color: borderColor,
              width: 2,
            ),*/
            borderRadius: BorderRadius.circular(20)))),
    onPressed: onPressed,
    child: Text(
      buttonText,
      style: bTextStyle,
    ),
  );
}
