import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class CameraModel {
  XFile? _image;
  final picker = ImagePicker();

  XFile? get image => _image;

Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
        _image = XFile(pickedFile.path);
        
      }
  }

Future<String?> saveImage() async {
  if (_image == null) return null;

  final directory = await getApplicationDocumentsDirectory();
  final imagePath = '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.png';

  final File newImage = File(imagePath);
  await newImage.writeAsBytes(await _image!.readAsBytes());

  return imagePath;
}

}