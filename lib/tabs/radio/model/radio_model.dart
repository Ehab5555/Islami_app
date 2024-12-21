import 'radio.dart';

class RadioModel {
  final List<Radios>? radios;

  const RadioModel({this.radios});

  factory RadioModel.fromJson(Map<String, dynamic> json) => RadioModel(
        radios: (json['radios'] as List<dynamic>?)
            ?.map((e) => Radios.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
