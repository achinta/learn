import '../constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.buttonTitle, this.onTap});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: Center(child: Text(buttonTitle, style: kLargeButtonTextStyle)),
          color: kBottomContainerColor,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(bottom: 20.0),
          width: double.infinity,
          height: kBottomContainerHeight),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 0.0,
        shape: CircleBorder(),
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
        fillColor: Color(0xFF4C4F5E),
        child: Icon(icon));
  }
}
