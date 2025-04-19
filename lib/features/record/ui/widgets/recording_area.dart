import 'package:flutter/material.dart';
import 'package:absherthone/l10n/app_localizations.dart' show AppLocalizations;

class RecordingButton extends StatefulWidget {
  final Function()? onRecordingComplete;
  final double size;

  const RecordingButton({
    super.key,
    this.onRecordingComplete,
    this.size = 0.8,
  });

  @override
  State<RecordingButton> createState() => _RecordingButtonState();
}

class _RecordingButtonState extends State<RecordingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;
  bool _isRecording = false;
  Duration _recordingDuration = Duration.zero;
  DateTime? _recordingStartTime;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _startRecording() {
    setState(() {
      _isRecording = true;
      _recordingStartTime = DateTime.now();
    });
    _controller.repeat(reverse: true);

    _startTimer();
  }

  void _stopRecording() {
    setState(() {
      _isRecording = false;
      _recordingDuration = Duration.zero;
    });
    _controller.stop();

    if (widget.onRecordingComplete != null) {
      widget.onRecordingComplete!();
    }
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_isRecording && mounted) {
        setState(() {
          _recordingDuration = DateTime.now().difference(_recordingStartTime!);
        });
        _startTimer();
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context);
    final buttonSize = MediaQuery.of(context).size.width * 0.5;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 140),
        GestureDetector(
          onLongPressStart: (_) => _startRecording(),
          onLongPressEnd: (_) => _stopRecording(),
          child: AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              final scale = _isRecording ? _pulseAnimation.value : 1.0;
              return Transform.scale(
                scale: scale,
                child: Container(
                  width: buttonSize,
                  height: buttonSize,
                  decoration: BoxDecoration(
                    gradient: _isRecording
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
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: _isRecording
                            ? colorScheme.error.withOpacity(0.3)
                            : Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                    border: Border.all(
                      color: _isRecording
                          ? colorScheme.error
                          : colorScheme.primary.withOpacity(0.5),
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: _isRecording
                        ? Icon(
                            Icons.mic,
                            size: buttonSize * 0.3,
                            color: Colors.white,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mic,
                                size: buttonSize * 0.25,
                                color: colorScheme.onSurfaceVariant,
                              ),
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
            },
          ),
        ),
        const SizedBox(height: 64),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _isRecording ? 1.0 : 0.0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            decoration: BoxDecoration(
              color: colorScheme.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: colorScheme.error.withOpacity(0.5),
                width: 1.5,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: colorScheme.error,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "${loc.audio_working} · ${_formatDuration(_recordingDuration)}",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 55)
      ],
    );
  }
}
