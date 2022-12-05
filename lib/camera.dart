import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

enum WidgetState { none, loading, loaded, error }

class _CameraScreenState extends State<CameraScreen> {
  WidgetState _widgetState = WidgetState.none;
  List<CameraDescription> _cameras = <CameraDescription>[];
  late CameraController _cameraController;

  @override
  void initState() {
    super.initState();

    initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    switch (_widgetState) {
      case WidgetState.none:
      case WidgetState.loading:
        return _buildScalffold(
            context: context,
            body: const Center(child: CircularProgressIndicator()));
      case WidgetState.loaded:
        return _buildScalffold(
            context: context, body: CameraPreview(_cameraController));
      case WidgetState.error:
        return _buildScalffold(
            context: context,
            body: const Center(
                child: Text("The camera can't start :(, reopen the app.")));
    }
  }

  Widget _buildScalffold(
      {required BuildContext context, required Widget body}) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CAMERA JIJIJIJA"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.camera),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // METHODS
  Future initializeCamera() async {
    _widgetState = WidgetState.loading;
    if (mounted) {
      setState(() {});
    }
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.high);

    await _cameraController.initialize();
    if (_cameraController.value.hasError) {
      _widgetState = WidgetState.error;
      if (mounted) {
        setState(() {});
      } else {
        _widgetState = WidgetState.loaded;
      }
    }
  }
}

class CameraFunctions {
  static final imagePicker = ImagePicker();
  static Future<XFile?> openCamera({Function? callback}) async {
    XFile? picture = await imagePicker.pickImage(source: ImageSource.camera);
    debugPrint(picture.toString());
    if (callback != null) {
      callback(picture);
    }
    return picture;
  }

  static Future<XFile?> openGallery({Function? callback}) async {
    XFile? picture = await imagePicker.pickImage(source: ImageSource.gallery);
    debugPrint(picture.toString());
    if (callback != null) {
      callback(picture);
    }
    return picture;
  }
}
