import 'package:flutter/material.dart';
import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:path_provider/path_provider.dart';
import 'utils/paint.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Scaffold(
        appBar: AppBar(
            // title: const Text('Flutter Demo Home Page'),
            ),
        body: const Center(
          child: MyHomePage(title: 'hello'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  // final mode = DetectionMode.stream or DetectionMode.single;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String currentImagePath = 'assets/Cars0.png';

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  void detectObjects(String filePath) async {
    //  create detector
    const mode = DetectionMode.single;
    final options = ObjectDetectorOptions(
        mode: mode, classifyObjects: true, multipleObjects: true);
    final detector = ObjectDetector(options: options);

    // create input image
    File imageFile = await getImageFileFromAssets(filePath);
    final inputImage = InputImage.fromFile(imageFile);

    // detect objects
    final List<DetectedObject> objects =
        await detector.processImage(inputImage);

    //print number of objects detected
    print(objects.length);
    for (DetectedObject detectedObject in objects) {
      final rect = detectedObject.boundingBox;
      final trackingId = detectedObject.trackingId;

      for (Label label in detectedObject.labels) {
        print('$label.text, $label.confidence, $rect, $trackingId');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(currentImagePath),
        ElevatedButton(
            onPressed: () {
              detectObjects(currentImagePath);
            },
            child: const Text('Detect')),
        BoundingBoxImage(
          imageProvider: Image.asset(currentImagePath).image,
          boundingBox: const Rect.fromLTWH(0, 0, 100, 100),
        ),
      ],
    ));
  }
}
