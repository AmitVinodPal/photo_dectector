import 'package:flutter/material.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';

class ResultCard extends StatelessWidget {
  final ImageLabel label;

  const ResultCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        title: Text(label.label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text("Confidence: ${(label.confidence * 100).toStringAsFixed(2)}%"),
      ),
    );
  }
}
