import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class IconBox extends StatelessWidget {
  const IconBox(
      {required this.apiData, required this.labelText, required this.iconName});

  final Text apiData;
  final String? labelText;
  final IconData? iconName;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(iconName, size: 32.0, color: Colors.white),
          SizedBox(height: 6.0),
          apiData,
          SizedBox(height: 3.0),
          Text(
            labelText!,
            style: kIconLabelTextStyle,
          )
        ],
      ),
    );
  }
}
