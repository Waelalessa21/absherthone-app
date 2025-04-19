import 'package:flutter/material.dart';

class RecordButton extends StatelessWidget {
  final ColorScheme colorScheme;
  final bool isRecording;

  const RecordButton({
    super.key,
    required this.colorScheme,
    this.isRecording = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.9),
          ),
          child: Center(
            child: Icon(
              isRecording ? Icons.insert_drive_file : Icons.mic,
              color: colorScheme.primary,
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}
