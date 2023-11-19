import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:flutter/services.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:path_provider/path_provider.dart';
import 'painters/paint.dart';
import 'painters/object_detector_painter.dart';
import 'object_detector_view.dart';
import 'detector_view.dart';

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
        appBar: AppBar(),
        body: const Center(
          child: MyHomePage(title: 'hello'),
          // child: ImageTest(),
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
  String currentImagePath = '';
  int _currentCarNumber = 0;
  int get currentCarNumber => _currentCarNumber;
  set currentCarNumber(int value) {
    _currentCarNumber = value;
    detectObjects(value).then((_) => setState(() {}));
  }
  // create a list of car numbers from 1 to 100. Sort them randomly

  List<int> carNumbers = List<int>.generate(100, (i) => i + 1);
  InputImage? inputImage;
  Image? currentImage;
  // list of bounding boxes
  List<Rect> boundingBoxes = [];

  _MyHomePageState() {
    currentCarNumber = 0;
  }

  //  store bounding box
  Rect boundingBox = const Rect.fromLTWH(0, 0, 0, 0);

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<void> detectObjects(carNumber) async {
    currentImagePath = getCarImagePath(carNumber);
    inputImage = await getInputImageFromFile(currentImagePath);
    currentImage = Image.asset(currentImagePath);
    //print image size from file
    print("image size is ${inputImage?.metadata?.size}");

    //  create detector
    const mode = DetectionMode.single;
    final options = ObjectDetectorOptions(
        mode: mode, classifyObjects: true, multipleObjects: true);
    final detector = ObjectDetector(options: options);

    // get input image and detect objects
    final List<DetectedObject> objects =
        await detector.processImage(inputImage!);

    //print number of objects detected
    print(objects.length);
    boundingBoxes = [];
    for (DetectedObject detectedObject in objects) {
      // boundingBox = bb;
      final trackingId = detectedObject.trackingId;
      // print(detectedObject.boundingBox);
      boundingBoxes.add(detectedObject.boundingBox);

      // for (Label label in detectedObject.labels) {
      //   print('$label.text, $label.confidence, $boundingBox, $trackingId');
      // }
    }
  }

  String getCarImagePath(int carNumber) {
    return 'assets/Cars$carNumber.png';
  }

  Future<InputImage> getInputImageFromFile(String filePath) async {
    // final inputImage = InputImage.fromFile(filePath);
    File imageFile = await getImageFileFromAssets(filePath);
    final inputImage = InputImage.fromFile(imageFile);
    return inputImage;
  }

  @override
  Widget build(BuildContext context) {
    // currentImagePath = getCarImagePath(currentCarNumber);
    // getInputImageFromFile(currentImagePath).then((img) => {inputImage = img});
    // currentImage = Image.asset(currentImagePath);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        SizedBox(
          // width: 300,
          // height: 300,
          child: Stack(
            children: [
              currentImage ?? const Text('no image'),
              Visibility(
                visible: inputImage != null,
                child: BoundingBoxImage(
                  image: Image.asset(currentImagePath),
                  boundingBoxes: boundingBoxes,
                  imageSize: (inputImage?.metadata?.size) ?? const Size(0, 0),
                  rotation: (inputImage?.metadata?.rotation) ??
                      InputImageRotation.rotation0deg,
                  cameraLensDirection: CameraLensDirection.back,
                ),
              ),
            ],
          ),
        ),

        // currentImage ?? const Text('no image'),
        //create two buttons in a row, 'left' and 'right', which will change the image
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //disable button if currentCarNumber is 1
            ElevatedButton(
                onPressed: () {
                  currentCarNumber--;
                },
                child: const Text('Previous')),
            //disable button if currentCarNumber is last
            ElevatedButton(
                onPressed: currentCarNumber == 413
                    ? null
                    : () {
                        currentCarNumber++;
                      },
                child: const Text('Next')),
            ElevatedButton(
                onPressed: () {
                  // set currentCarNumber to a random value in carNumbers
                  currentCarNumber = carNumbers[Random().nextInt(100)];
                },
                child: const Text('Random')),
          ],
        ),


      ],
    );
  }
}
