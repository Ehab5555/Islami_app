import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:islami/tabs/radio/model/radio_model.dart';

class ApiServices {
  Future<RadioModel> getRadios() async {
    final uri = Uri.https('//mp3quran.net', '/api/v3/radios', {
      'language': 'en',
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return RadioModel.fromJson(json);
  }
}
