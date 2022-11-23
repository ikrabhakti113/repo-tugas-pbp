// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Watchlist> WatchlistFromJson(String str) => List<Watchlist>.from(json.decode(str).map((x) => Watchlist.fromJson(x)));

String WatchlistToJson(List<Watchlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Watchlist {
    Watchlist({
        required this.watchedMovie,
        required this.movieTitle,
        required this.movieRate,
        required this.releaseDate,
        required this.movieReview,
    });

    bool watchedMovie;
    String movieTitle;
    int movieRate;
    DateTime releaseDate;
    String movieReview;

    factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
        movieTitle: json["fields"]["movie_title"],
        releaseDate: json["fields"]["release_date"],
        movieRate: json["fields"]["movie_rate"],        
        watchedMovie: json["fields"]["watched_movie"],
        movieReview: json["fields"]["movie_review"],
    );

    Map<String, dynamic> toJson() => {
        "movie_title": movieTitle,
        "release_date": releaseDate,      
        "movie_rate": movieRate,
        "watched_movie": watchedMovie,
        "movie_review": movieReview,
    };
}



