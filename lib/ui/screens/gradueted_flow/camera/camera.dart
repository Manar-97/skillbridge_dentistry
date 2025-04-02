import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'imagemethods.dart';
import 'imagepreview.dart';

class CameraCases extends StatefulWidget {
  const CameraCases({super.key});
  static const String routeName = 'camera';
  @override
  State<CameraCases> createState() => _CameraCasesState();
}

class _CameraCasesState extends State<CameraCases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageMethods(
                icon: Icons.camera_alt_outlined,
                text: 'Camera',
                onTap: () {
                  pickImageFromCamera();
                },
              ),
              ImageMethods(
                icon: Icons.image_outlined,
                text: 'Gallery',
                onTap: () {
                  pickImageFromGallery();
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.716,
                child: GridView.builder(
                  itemCount: 50,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 75,
                      width: 75,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/case.png'),
                              fit: BoxFit.contain)),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      _goToPreviewScreen(File(image.path));
    } else {
      print('No image taken.');
    }
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _goToPreviewScreen(File(image.path));
    } else {
      print('No image selected.');
    }
  }

  void _goToPreviewScreen(File imageFile) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImagePreviewScreen(imageFile: imageFile),
      ),
    );
  }
}
