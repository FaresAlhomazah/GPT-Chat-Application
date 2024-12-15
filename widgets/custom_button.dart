import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({required this.ButtonText,this.onPressed,this.hightOfBut=40});
  final String ButtonText;
  final double? hightOfBut;
 final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18,15,18,10),
      child: ElevatedButton(
        onPressed:onPressed,
        child: Text(ButtonText),
        style: ElevatedButton.styleFrom(
            shape:
               RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            minimumSize: Size(357, hightOfBut!),
            backgroundColor:Colors.white,
            foregroundColor: Colors.black),
      ),
    );    
  }
}







