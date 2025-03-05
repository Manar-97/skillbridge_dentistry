import 'dart:io';
import 'package:flutter/material.dart';
import 'package:skillbridge_dentistry/ui/utils/widgets/appButton.dart';

class ImagePreviewScreen extends StatelessWidget {
  final File imageFile;

  const ImagePreviewScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
                width: 80,
                height: 35,
                child: AppButton(text: 'Save', onTap: () {})),
          )
        ],
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.file(
            imageFile,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
