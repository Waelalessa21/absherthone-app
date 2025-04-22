import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

Future<Map<String, dynamic>> analyzeAudio(File audioFile) async {
  final uri = Uri.parse("http://172.24.9.163:8000/analyze-audio");
  final mimeType = lookupMimeType(audioFile.path) ?? "audio/aac";

  final request = http.MultipartRequest("POST", uri)
    ..files.add(await http.MultipartFile.fromPath(
      'file',
      audioFile.path,
      contentType: MediaType.parse(mimeType),
    ));

  final streamedResponse = await request.send();
  final response = await http.Response.fromStream(streamedResponse);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Failed to analyze audio");
  }
}
