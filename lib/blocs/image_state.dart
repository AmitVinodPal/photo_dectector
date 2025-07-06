import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

abstract class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoDetected extends PhotoState {
  final List<ImageLabel> labels;
  PhotoDetected(this.labels);
}

class PhotoError extends PhotoState {
  final String message;
  PhotoError(this.message);
}
