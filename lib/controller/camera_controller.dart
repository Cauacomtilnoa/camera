import '../model/camera_model.dart';

class CameraController {
    CameraModel camera = CameraModel();
    Future<String?> obterImagem() async {
      await camera.getImageFromCamera();
      return camera.image?.path;
    }

    Future<String?> salvarImagem() async {
      final imagePath = await camera.saveImage();
     
      return imagePath;
    }

}