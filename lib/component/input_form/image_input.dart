import 'package:flutter/material.dart';

class QAImageInputField extends StatelessWidget {
  final Widget? label;
  final Function()? onPressed;
  final Widget? icon;
  final Color? fillColor;
  const QAImageInputField({ 
    Key? key, 
    @required this.label, 
    @required this.onPressed, 
    this.fillColor = Colors.grey,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label!,
        SizedBox(height: 14,),
        InkWell(
          onTap: onPressed,
          child: Ink(
            height: 200,
            width: screenSize.width,
            decoration: BoxDecoration(
              color: fillColor!.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10)
            ),
            child: icon,
          ),
        ),
      ],
    );
  }
}