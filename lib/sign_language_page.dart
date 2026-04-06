import 'dart:io';

import 'package:be_kind_project/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignLanguagePage extends StatefulWidget {
  const SignLanguagePage({super.key});

  @override
  State<SignLanguagePage> createState() => _SignLanguagePageState();
}

class _SignLanguagePageState extends State<SignLanguagePage> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickFromCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() => _selectedImage = File(photo.path));
    }
  }

  Future<void> _pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _selectedImage = File(image.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Image.asset(
                    'assets/images/7c3c6d2cb814ec07c053748ad45ae6b4613213b6 (2).jpg',
                    height: 70,
                  ),
                  const Spacer(),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Language',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.rose,
                        ),
                      ),
                      Text('Translator', style: TextStyle(fontSize: 16)),
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
              Image.asset(
                'assets/images/42632216493fb1aa3e2f38568714059fffa08835.png',
                height: 200,
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickFromCamera,
                      child: const Row(
                        children: [
                          Icon(Icons.camera_alt_outlined),
                          SizedBox(width: 10),
                          Text('Take Photo', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                    const Divider(height: 30),
                    GestureDetector(
                      onTap: _pickFromGallery,
                      child: const Row(
                        children: [
                          Icon(Icons.image_outlined),
                          SizedBox(width: 10),
                          Text('Upload photo', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _selectedImage == null
                  ? const Text(
                      'Upload image will appear here',
                      style: TextStyle(color: Colors.grey),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(_selectedImage!, height: 150),
                    ),
              const Spacer(),
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: AppColors.translateButtonGradient,
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Translate',
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
