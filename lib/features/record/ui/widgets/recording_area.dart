import 'package:absherthone/common/widgets/pop/caller_alert.dart';
import 'package:absherthone/common/widgets/pop/loader.dart';
import 'package:absherthone/features/record/logic/recording_controller.dart';
import 'package:absherthone/features/record/logic/recording_event.dart';
import 'package:absherthone/features/record/logic/recording_state.dart';
import 'package:absherthone/features/record/ui/widgets/recording_circle.dart';
import 'package:absherthone/features/record/ui/widgets/recording_timer.dart';
import 'package:absherthone/features/record/data/audio_service.dart';
import 'package:absherthone/features/record/data/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecordingButton extends StatefulWidget {
  final double size;
  final Function()? onRecordingComplete;

  const RecordingButton({
    super.key,
    this.size = 0.8,
    this.onRecordingComplete,
  });

  @override
  State<RecordingButton> createState() => _RecordingButtonState();
}

class _RecordingButtonState extends State<RecordingButton> {
  final audioService = AudioService();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    audioService.init();
  }

  @override
  void dispose() {
    audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecordingBloc(),
      child: BlocConsumer<RecordingBloc, RecordingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = context.read<RecordingBloc>();
          final isRecording = state is RecordingInProgress;
          final duration = isRecording ? state.duration : Duration.zero;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140),
              _loading
                  ? const AppIconLoader()
                  : GestureDetector(
                      onLongPressStart: (_) async {
                        await audioService.startRecording();
                        bloc.add(StartRecording());
                      },
                      onLongPressEnd: (_) async {
                        setState(() => _loading = true);
                        final file = await audioService.stopRecording();
                        bloc.add(StopRecording());
                        final result = await analyzeAudio(file);
                        setState(() => _loading = false);
                        if (mounted) {
                          showResultsInAlertDialog(context, result);
                        }
                        widget.onRecordingComplete?.call();
                      },
                      child: RecordingCircle(
                        isRecording: isRecording,
                        size: widget.size,
                      ),
                    ),
              const SizedBox(height: 64),
              RecordingTimer(
                visible: isRecording,
                duration: duration,
              ),
              const SizedBox(height: 70),
            ],
          );
        },
      ),
    );
  }
}
