class FavoriteModel {
  String? favoriteId;
  String? favoriteTitle;
  String? favoritePoster;
  String? favoriteYear;
  String? favoriteImdbID;
  String? favoriteUserId;

  FavoriteModel(
      {this.favoriteId,
      this.favoriteTitle,
      this.favoritePoster,
      this.favoriteYear,
      this.favoriteImdbID,
      this.favoriteUserId});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteTitle = json['favorite_title'];
    favoritePoster = json['favorite_poster'];
    favoriteYear = json['favorite_year'];
    favoriteImdbID = json['favorite_imdbID'];
    favoriteUserId = json['favorite_userId'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['favorite_id'] = this.favoriteId;
  //   data['favorite_title'] = this.favoriteTitle;
  //   data['favorite_poster'] = this.favoritePoster;
  //   data['favorite_year'] = this.favoriteYear;
  //   data['favorite_imdbID'] = this.favoriteImdbID;
  //   data['favorite_userId'] = this.favoriteUserId;
  //   return data;
  // }
}
