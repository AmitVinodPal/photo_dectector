import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_dectector/blocs/image_event.dart';
import 'package:photo_dectector/blocs/image_state.dart';
import 'package:photo_dectector/services/ai_service.dart';


class PhototBloc extends Bloc<PhototEvent, PhotoState> {
  final MLService mlService;

  PhototBloc(this.mlService) : super(PhotoInitial()) {
    on<DetectPhoto>((event, emit) async {
      emit(PhotoLoading());
      try {
        final result = await mlService.detectLabels(event.image);
        emit(PhotoDetected(result));
      } catch (e) {
        emit(PhotoError('Detection failed'));
      }
    });
  }
}
