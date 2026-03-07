import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignLanguagePage extends StatefulWidget {
  const SignLanguagePage({super.key});

  @override
  State<SignLanguagePage> createState() => _SignLanguagePageState();
}

class _SignLanguagePageState extends State<SignLanguagePage> {
  File? selectedImage;

  final ImagePicker picker = ImagePicker();

  /// Camera
  Future takePhoto() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      setState(() {
        selectedImage = File(photo.path);
      });
    }
  }

  /// Gallery
  Future uploadPhoto() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            children: [
              const SizedBox(height: 20),

              /// Header
              Row(
                children: [
                  Image.asset(
                    "assets/images/7c3c6d2cb814ec07c053748ad45ae6b4613213b6 (2).jpg",
                    height: 70,
                  ),

                  const Spacer(),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Language",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffB1747C),
                        ),
                      ),

                      Text("Translator", style: TextStyle(fontSize: 16)),
                    ],
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.settings),
                  ),
                ],
              ),

              const SizedBox(height: 50),

              /// Girl Image
              Image.asset(
                "assets/images/42632216493fb1aa3e2f38568714059fffa08835.png",
                height: 200,
              ),

              const SizedBox(height: 30),

              /// Upload Box
              Container(
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300),
                ),

                child: Column(
                  children: [
                    /// Camera
                    GestureDetector(
                      onTap: takePhoto,

                      child: const Row(
                        children: [
                          Icon(Icons.camera_alt_outlined),

                          SizedBox(width: 10),

                          Text("Take Photo", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),

                    const Divider(height: 30),

                    /// Gallery
                    GestureDetector(
                      onTap: uploadPhoto,

                      child: const Row(
                        children: [
                          Icon(Icons.image_outlined),

                          SizedBox(width: 10),

                          Text("Upload photo", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// Image Preview
              selectedImage == null
                  ? const Text(
                      "Upload image will appear here",
                      style: TextStyle(color: Colors.grey),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(selectedImage!, height: 150),
                    ),

              const Spacer(),

              /// Translate Button
              Container(
                width: double.infinity,
                height: 55,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),

                  gradient: const LinearGradient(
                    colors: [Color(0xffC98A92), Color(0xffB1747C)],
                  ),
                ),

                alignment: Alignment.center,

                child: const Text(
                  "Translate",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
