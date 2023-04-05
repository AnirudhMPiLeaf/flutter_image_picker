library flutter_image_picker;

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class FlutterImagePicker {
  ///if return is empty string there was an error in picking the image
  static Future<String> pickImage({
    required ImageSource source,
    int? imageQuality = 100,
  }) async {
    XFile? res = await ImagePicker().pickImage(
      source: source,
      imageQuality: imageQuality,
    );
    if (res != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: res.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );

      return croppedFile?.path.toString() ?? res.path;
    } else {
      return '';
    }
  }
}
