import 'package:ai_project/camera_widget.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CameraControllerSetup sc = CameraControllerSetup();
  late Future<CameraController> _controller;

  @override
  void initState() {
    _controller = sc.cameraController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    sc.initializeCameraDescription();
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: _controller,
          builder:(context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if(snapshot.hasData) {
              return CameraPreview(snapshot.data!);
            }
            else{
              return Center(child: Text("FUCKING DIES"),);
            }
          },
        ),
      ),
    );
  }
}
