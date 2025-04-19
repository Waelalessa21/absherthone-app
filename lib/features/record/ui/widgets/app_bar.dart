import 'package:absherthone/common/routing/extensions.dart';
import 'package:absherthone/common/routing/routes.dart';
import 'package:absherthone/common/widgets/buttons/action_button.dart';
import 'package:absherthone/common/widgets/buttons/record_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FloatingActionBar extends StatefulWidget {
  final Function(bool isRecording) onRecordingChanged;

  const FloatingActionBar({
    super.key,
    required this.onRecordingChanged,
  });

  @override
  State<FloatingActionBar> createState() => _FloatingActionBarState();
}

class _FloatingActionBarState extends State<FloatingActionBar> {
  bool _isRecording = false;

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;
    });

    widget.onRecordingChanged(_isRecording);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final loc = AppLocalizations.of(context)!;

    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(99),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 24,
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.reports);
                },
                child: ActionButton(
                  icon: Icons.report,
                  label: loc.reports,
                  color: colorScheme.primary,
                  isEnabled: !_isRecording,
                ),
              ),
            ),
            Positioned(
              right: 24,
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(Routes.settings);
                },
                child: ActionButton(
                  icon: Icons.settings,
                  label: loc.settings,
                  color: colorScheme.secondary,
                  isEnabled: !_isRecording,
                ),
              ),
            ),
            GestureDetector(
              onTap: _toggleRecording,
              child: RecordButton(
                isRecording: _isRecording,
                colorScheme: colorScheme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
