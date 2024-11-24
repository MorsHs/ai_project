import 'package:camera/camera.dart';

class CameraControllerSetup {
  late CameraDescription _cameraDescription;
  late CameraController _cameraController;

  Future<void> initializeCameraDescription() async{
    final cameras = await availableCameras();
    for(int i = 0; i < cameras.length;i++){
      if(cameras[i].lensDirection == CameraLensDirection.front){
        _cameraDescription = cameras[i];
        break;
      }
    }
  }

  Future<CameraController> cameraController() async{
    await initializeCameraDescription();
    _cameraController = CameraController(_cameraDescription, ResolutionPreset.veryHigh);
    await _cameraController.initialize();
    return _cameraController;
  }
}
