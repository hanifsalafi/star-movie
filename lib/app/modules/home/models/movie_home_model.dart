import 'dart:ffi';
import 'dart:convert';

class MovieHomeModel {
  final List<Results>? results;

  MovieHomeModel({this.results});

  // MovieHomeModel.fromJson(Map<String, dynamic> json) {
  //   if (json['results'] != null) {
  //     results = <Results>[];
  //     json['results'].forEach((v) {
  //       results?.add(Results.fromJson(v));
  //     });
  //   }
  // }

  static MovieHomeModel fromJson(dynamic json) => MovieHomeModel(
      results: json['results'] == null
          ? null
          : List<Results>.from(
              (json["results"] as List<dynamic>)
                  .map((x) => Results.fromJson(x as Map<String, dynamic>)),
            ));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  String? title;
  String? posterPath;
  List<dynamic>? genreIds = [];
  double? voteAverage;
  bool? adult;

  Results({
    this.id,
    this.title,
    this.voteAverage,
    this.posterPath,
    this.adult,
    this.genreIds,
  });

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    voteAverage = checkDouble(json['vote_average']);
    posterPath = json['poster_path'];
    adult = json['adult'];
    genreIds = json['genre_ids'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['vote_average'] = voteAverage;
    data['poster_path'] = posterPath;
    data['adult'] = adult;
    data['genre_ids'] = genreIds;
    return data;
  }
}

double? checkDouble(dynamic value) {
  if(value is double) return value;
  if(value is int) return value.toDouble();
  if(value is String) return double.tryParse(value);
  return null;
}
int? checkInt(dynamic value) {
  if(value is int) return value;
  if(value is double) return value.toInt();
  if(value is String) return int.tryParse(value);
  return null;
}