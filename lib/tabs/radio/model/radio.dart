class Radios {
  final int? id;
  final String? name;
  final String? url;
  final String? recentDate;

  const Radios({this.id, this.name, this.url, this.recentDate});

  factory Radios.fromJson(Map<String, dynamic> json) => Radios(
        id: json['id'] as int?,
        name: json['name'] as String?,
        url: json['url'] as String?,
        recentDate: json['recent_date'] as String?,
      );
}
