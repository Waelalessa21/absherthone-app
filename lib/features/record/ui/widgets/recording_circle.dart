import 'package:flutter/material.dart';
import 'package:absherthone/l10n/app_localizations.dart' show AppLocalizations;

class RecordingCircle extends StatelessWidget {
  final bool isRecording;
  final double size;

  const RecordingCircle({
    super.key,
    required this.isRecording,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);

    final colorScheme = Theme.of(context).colorScheme;
    final buttonSize = MediaQuery.of(context).size.width * 0.5;

    return AnimatedScale(
      scale: isRecording ? 1.15 : 1.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isRecording
              ? LinearGradient(
                  colors: [
                    colorScheme.error.withOpacity(0.7),
                    colorScheme.error,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [
                    colorScheme.surfaceVariant,
                    colorScheme.surfaceVariant.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          boxShadow: [
            BoxShadow(
              color: isRecording
                  ? colorScheme.error.withOpacity(0.3)
                  : Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
          border: Border.all(
            color: isRecording
                ? colorScheme.error
                : colorScheme.primary.withOpacity(0.5),
            width: 3,
          ),
        ),
        child: Center(
          child: isRecording
              ? Icon(Icons.mic, size: buttonSize * 0.3, color: Colors.white)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mic,
                        size: buttonSize * 0.25,
                        color: colorScheme.onSurfaceVariant),
                    const SizedBox(height: 8),
                    Text(
                      loc.hold_to_record,
                      style: TextStyle(
                        fontSize: buttonSize * 0.07,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
