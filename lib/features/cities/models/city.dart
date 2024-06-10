import 'package:murshed_admin_panel/core/models/translation.dart';

class City {
  final Translation? title;
  final String? image;

  City({
    this.title,
    this.image,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      title: json['title'] != null ? Translation.fromJson(json['title']) : null,
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (image != null) {
      data['image'] = image;
    }

    return data;
  }

  @override
  String toString() {
    return 'City{title: $title, image: $image}';
  }
}
