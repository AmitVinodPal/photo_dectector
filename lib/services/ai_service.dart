import 'dart:io';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

class MLService {
  final _labeler = ImageLabeler(options: ImageLabelerOptions(confidenceThreshold: 0.5));

  Future<List<ImageLabel>> detectLabels(File image) async {
    final inputImage = InputImage.fromFile(image);
    final labels = await _labeler.processImage(inputImage);
    return labels;
  }

  void dispose() {
    _labeler.close();
  }
}
