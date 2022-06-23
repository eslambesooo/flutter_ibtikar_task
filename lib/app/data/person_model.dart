import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? profilePath;

  Person({this.id, this.name, this.profilePath});

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    name = json['name'];

    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['id'] = id;

    data['name'] = name;
    data['profile_path'] = profilePath;
    return data;
  }
}
