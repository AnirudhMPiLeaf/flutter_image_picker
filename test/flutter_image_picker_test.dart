import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_image_picker/flutter_image_picker.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  test('pick image', () {
    final imagePicker = FlutterImagePicker();
    expect(imagePicker.pickImage(source: ImageSource.gallery), '');
    expect(imagePicker.pickImage(source: ImageSource.camera), '');
  });
}
