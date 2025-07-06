import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_dectector/blocs/image_bloc.dart';
import 'package:photo_dectector/blocs/image_event.dart';
import 'package:photo_dectector/blocs/image_state.dart';
import 'package:photo_dectector/widgets/image_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      setState(() => _image = File(file.path));
      context.read<PhototBloc>().add(DetectPhoto(_image!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DetectPhoto Detector")),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        child: const Icon(Icons.camera_alt),
      ),
      body: BlocBuilder<PhototBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PhotoDetected) {
            return ListView.builder(
              itemCount: state.labels.length,
              itemBuilder: (context, index) =>
                  ResultCard(label: state.labels[index]),
            );
          } else if (state is PhotoError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("Take a photo to detect"));
          }
        },
      ),
    );
  }
}
