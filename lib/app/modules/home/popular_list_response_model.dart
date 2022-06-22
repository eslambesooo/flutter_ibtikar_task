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

class Person {
  bool? adult;
  int? gender;
  int? id;
  List<KnownForItem>? knownFor;
  String? knownForDepartment;
  String? name;
  double? popularity;
  String? profilePath;

  Person({this.adult, this.gender, this.id, this.knownFor, this.knownForDepartment, this.name, this.popularity, this.profilePath});

  Person.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    if (json['known_for'] != null) {
      knownFor = <KnownForItem>[];
      json['known_for'].forEach((v) {
        knownFor?.add(KnownForItem.fromJson(v));
      });
    }
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    if (knownFor != null) {
      data['known_for'] = knownFor?.map((v) => v.toJson()).toList();
    }
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    return data;
  }
}

class KnownForItem {
  bool? adult;
  String? backdropPath;

  int? id;
  String? mediaType;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;

  String? name;

  KnownForItem({
    this.adult,
    this.backdropPath,
    this.id,
    this.mediaType,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.name,
  });

  KnownForItem.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];

    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];

    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;

    data['id'] = id;
    data['media_type'] = mediaType;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;

    data['name'] = name;

    return data;
  }
}
