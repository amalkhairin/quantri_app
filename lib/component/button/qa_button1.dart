import 'package:flutter/material.dart';
import 'package:quantri_app/constant/color.dart';

enum QAButtonStyle {
  PRIMARY,
  SECONDARY,
}

class QAButton1 extends StatelessWidget {
  final Key? key;
  final Widget? label;
  final Widget? icon;
  final QAButtonStyle? style;
  final Function()? onPressed;
  const QAButton1({ this.key, @required this.label, this.icon, this.style, @required this.onPressed }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    
    return SizedBox(
      height: 52,
      width: screenSize.width,
      child: ElevatedButton(
        onPressed: onPressed?? null,
        style: style == QAButtonStyle.PRIMARY || style == null
        ? ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: primaryColor,
          onPrimary: secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
        )
        : ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: secondaryColor,
          onPrimary: primaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: primaryColor),
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon?? Container(),
            icon != null? SizedBox(width: 8,) : Container(),
            label!
          ],
        ),
      ),
    );
  }
}