import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';

class AudioService {
  final _recorder = FlutterSoundRecorder();
  bool _isInited = false;
  late String _filePath;

  Future<void> init() async {
    if (!_isInited) {
      await _recorder.openRecorder();
      final dir = await getTemporaryDirectory();
      _filePath = '${dir.path}/temp_audio.aac';
      _isInited = true;
    }
  }

  Future<void> startRecording() async {
    await init();
    await _recorder.startRecorder(toFile: _filePath, codec: Codec.aacADTS);
  }

  Future<File> stopRecording() async {
    await _recorder.stopRecorder();
    return File(_filePath);
  }

  void dispose() {
    _recorder.closeRecorder();
  }
}
