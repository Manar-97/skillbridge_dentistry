import 'package:flutter/material.dart';

class AuthMethods extends StatelessWidget {
  const AuthMethods({super.key, required this.onTap, required this.imageName});
  final Function() onTap;
  final String imageName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage(imageName)),
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
