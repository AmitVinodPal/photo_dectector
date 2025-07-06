
import 'dart:io';

abstract class PhototEvent {}

class DetectPhoto extends PhototEvent {
  final File image;
  DetectPhoto(this.image);
}
