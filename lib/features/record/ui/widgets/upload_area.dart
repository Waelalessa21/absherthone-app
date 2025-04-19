import 'package:absherthone/common/widgets/custom_shapes/format_info.dart';
import 'package:absherthone/common/widgets/custom_shapes/upload_header.dart';
import 'package:absherthone/features/record/ui/widgets/upload_audio_section.dart';
import 'package:flutter/material.dart';

class AudioFileUploadWidget extends StatelessWidget {
  const AudioFileUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width * 0.88,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              spreadRadius: 0,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: colorScheme.primary.withOpacity(0.05),
              blurRadius: 30,
              spreadRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HeaderSection(colorScheme: colorScheme),
            const SizedBox(height: 28),
            UploadArea(colorScheme: colorScheme),
            const SizedBox(height: 24),
            FileFormatInfo(colorScheme: colorScheme),
          ],
        ),
      ),
    );
  }
}
