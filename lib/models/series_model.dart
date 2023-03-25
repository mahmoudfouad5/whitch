import 'package:watch_loop/models/series_details.dart';

class SeriesData {
  String? name;
  String? story;
  String? photo;
  int? rate;
  SeriesDetails? details;

  SeriesData({
    this.name,
    this.photo,
    this.story,
    this.rate,
    this.details,
  });

  SeriesData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    story = json['story'];
    rate = json['rate'];
    details = SeriesDetails.fromJson(json['details']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
      'story': story,
      'rate': rate,
      'details': details?.toMap(),
    };
  }
}
