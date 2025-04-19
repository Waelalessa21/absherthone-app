import 'package:absherthone/features/record/ui/widgets/app_bar.dart';
import 'package:absherthone/features/record/ui/widgets/recording_area.dart';
import 'package:absherthone/features/record/ui/widgets/upload_area.dart';
import 'package:flutter/material.dart';
import 'package:absherthone/common/layout/main_screen.dart';
import 'package:absherthone/l10n/app_localizations.dart' show AppLocalizations;

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => RecordScreenState();
}

class RecordScreenState extends State<RecordScreen>
    with SingleTickerProviderStateMixin {
  bool _isRecording = false;
  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  void updateContent(bool isRecording) {
    setState(() {
      _isRecording = isRecording;
    });

    if (isRecording) {
      _flipController.forward();
    } else {
      _flipController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final loc = AppLocalizations.of(context);

    return MainScreen(
      showHeader: true,
      child: Column(
        children: [
          Text(
            _isRecording ? loc.audio_title : loc.be_careful_title,
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 30),
          AnimatedBuilder(
            animation: _flipAnimation,
            builder: (context, child) {
              final showFront = _flipAnimation.value < 0.5;

              final frontRotation = showFront
                  ? _flipAnimation.value * 2 * 3.14159 / 2
                  : 3.14159 / 2;
              final backRotation = showFront
                  ? -3.14159 / 2
                  : ((_flipAnimation.value - 0.5) * 2) * 3.14159 / 2 -
                      3.14159 / 2;

              return Stack(
                alignment: Alignment.center,
                children: [
                  Visibility(
                    visible: showFront || _flipAnimation.value < 0.51,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateX(frontRotation),
                      child: const AudioFileUploadWidget(),
                    ),
                  ),
                  Visibility(
                    visible: !showFront || _flipAnimation.value > 0.49,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateX(backRotation),
                      child: const RecordingButton(),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 30),
          FloatingActionBar(
            onRecordingChanged: updateContent,
          ),
        ],
      ),
    );
  }
}
