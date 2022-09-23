class MoviesModel {
  List<Movies>? movies;

  MoviesModel({this.movies});

  MoviesModel.fromJson(Map<String, dynamic> json) {
    if (json['movies'] != null) {
      movies = <Movies>[];
      json['movies'].forEach((v) {
        movies!.add( Movies.fromJson(v));
      });
    }
  }
}

class Movies {
  dynamic id;
  dynamic title;
  dynamic year;
  List<String>? genres;
  List<int>? ratings;
  dynamic poster;
  dynamic contentRating;
  dynamic duration;
  dynamic releaseDate;
  dynamic averageRating;
  dynamic originalTitle;
  dynamic storyline;
  List<String>? actors;
  dynamic imdbRating;
  dynamic posterurl;

  Movies(
      {this.id,
        this.title,
        this.year,
        this.genres,
        this.ratings,
        this.poster,
        this.contentRating,
        this.duration,
        this.releaseDate,
        this.averageRating,
        this.originalTitle,
        this.storyline,
        this.actors,
        this.imdbRating,
        this.posterurl});

  Movies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    genres = json['genres'].cast<String>();
    ratings = json['ratings'].cast<int>();
    poster = json['poster'];
    contentRating = json['contentRating'];
    duration = json['duration'];
    releaseDate = json['releaseDate'];
    averageRating = json['averageRating'];
    originalTitle = json['originalTitle'];
    storyline = json['storyline'];
    actors = json['actors'].cast<String>();
    imdbRating = json['imdbRating'];
    posterurl = json['posterurl'];
  }

}
