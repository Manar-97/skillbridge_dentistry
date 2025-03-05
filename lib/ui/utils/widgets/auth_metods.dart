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
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 10, spreadRadius: 3),
            ],
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage(imageName)),
            borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
