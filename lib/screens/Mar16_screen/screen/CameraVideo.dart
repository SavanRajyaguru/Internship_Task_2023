import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class CameraVideoDemo extends StatefulWidget {
  const CameraVideoDemo({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;
  @override
  State<CameraVideoDemo> createState() => _CameraVideoDemoState();
}

class _CameraVideoDemoState extends State<CameraVideoDemo> {

  late CameraController cameraController;
  late Future<void> cameraValue;
  XFile? videoFile;

  @override
  void initState() {
    // TODO: implement initState
    // startCamera();
    cameraController = CameraController(
      widget.cameras[0],
      ResolutionPreset.max,
      enableAudio: true,
    );
    cameraValue = cameraController.initialize();
    super.initState();
  }

  void startCamera() async{
    // widget.cameras = await availableCameras();
    cameraController = CameraController(
      widget.cameras[0],
      ResolutionPreset.max,
      enableAudio: true,
    );
    await cameraController.initialize().then((value) {
      if(!mounted){
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    cameraController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                return Container(
                    height: double.infinity,
                    child: CameraPreview(cameraController)
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  onPressed: () {
                    cameraController.startVideoRecording();
                    print("Play");
                  },
                  child: const Icon(Icons.play_arrow),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  onPressed: () {
                    cameraController.pauseVideoRecording().then((value) {
                      print("Video Pause");
                    });
                    print("Pause");
                  },
                  child: const Icon(Icons.pause),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  onPressed: () {
                    cameraController.stopVideoRecording().then((XFile? file) async{
                      print("PATH:>>>>>>>> ${file!.path}");
                      // await ImageGallerySaver.saveFile(file.path).then((value) {
                      //   print("VALUE>>>>>>> $value");
                      // }).onError((error, stackTrace) {print("ERROR>>>>>>> $error");});
                      await GallerySaver.saveVideo(file.path).then((value) {
                        print("VALUE>>>>>>> $value");
                      }).onError((error, stackTrace) {print("ERROR>>>>>>> $error");});
                    });
                    print("Stop");
                  },
                  child: const Icon(Icons.stop),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
