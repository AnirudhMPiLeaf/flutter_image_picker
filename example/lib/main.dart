import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_picker/flutter_image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ImagePickerScreen(),
    );
  }
}

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  var imagePath = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Image Picker'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: imagePath.isEmpty
                    ? const Text('Image path is empty')
                    : Image.file(
                        File(imagePath),
                      ),
              ),
              ElevatedButton(
                onPressed: () async {
                  imagePath = await FlutterImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                child: const Text('Pick Image Gallery'),
              ),
              ElevatedButton(
                onPressed: () async {
                  imagePath = await FlutterImagePicker()
                      .pickImage(source: ImageSource.camera);
                  setState(() {});
                },
                child: const Text('Pick Image Camera'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
