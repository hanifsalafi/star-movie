import 'dart:ffi';

class MovieHomeModel {
  List<Results>? results;

  MovieHomeModel({this.results});

  MovieHomeModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }

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
  String? voteAverage;
  String? posterPath;
  Bool? adult;
  List<String>? genreIds = [];

  Results(
      {this.id,
      this.title,
      this.voteAverage,
      this.posterPath,
      this.adult,
      this.genreIds});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    voteAverage = json['voteAverage'];
    posterPath = json['posterPath'];
    adult = json['adult'];
    genreIds = json['genreIds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['voteAverage'] = voteAverage;
    data['posterPath'] = posterPath;
    data['adult'] = adult;
    data['genreIds'] = genreIds;
    return data;
  }
}
