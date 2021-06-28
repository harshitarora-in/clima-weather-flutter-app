import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton(
      {required this.onTap,
      required this.buttonText,
      required this.buttonIcon,
      required this.gradientColor1,
      required this.gradientColor2,
      this.topRight = 0,
      this.topLeft = 0,
      this.bottomLeft = 0,
      this.bottomRight = 0});
  final Function onTap;
  final Text buttonText;
  final Icon buttonIcon;
  final Color gradientColor1;
  final Color gradientColor2;
  final double? topRight;
  final double? bottomLeft;
  final double? topLeft;
  final double? bottomRight;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(topRight!),
                  bottomRight: Radius.circular(bottomRight!),
                  topLeft: Radius.circular(topLeft!),
                  bottomLeft: Radius.circular(bottomLeft!)))),
      child: Ink(
        height: 45.0,
        width: 400.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradientColor1, gradientColor2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(topRight!),
                bottomLeft: Radius.circular(bottomLeft!),
                topLeft: Radius.circular(topLeft!),
                bottomRight: Radius.circular(bottomRight!))),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          buttonText,
          SizedBox(width: 14.0),
          buttonIcon,
        ]),
      ),
    );
  }
}
