import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
CustomButton({this.onTap,required this.text});
VoidCallback? onTap;
String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(height: 45,
          decoration: BoxDecoration(color: Colors.amber,shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(15)),
          child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),),
      ));
                                          
  }
}