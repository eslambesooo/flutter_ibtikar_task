import '../../data/person_model.dart';

class PopularListResponse {
  int? page;
  List<Person>? persons;
  int? totalPages;
  int? totalResults;

  PopularListResponse({this.page, this.persons, this.totalPages, this.totalResults});

  PopularListResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      persons = <Person>[];
      json['results'].forEach((v) {
        persons?.add(Person.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    if (persons != null) {
      data['results'] = persons?.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
