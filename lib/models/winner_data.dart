class WinnerData {
  String avatarUrl;
  String name;
  String company;
  String location;
  String bio;
  int publicRepos;
  int followers;
  int following;

  WinnerData({
    this.avatarUrl,
    this.name,
    this.company,
    this.location,
    this.bio,
    this.publicRepos,
    this.followers,
    this.following,
  });

  WinnerData.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatar_url'];
    name = json['name'];
    company = json['company'];
    location = json['location'];
    bio = json['bio'];
    publicRepos = json['public_repos'];
    followers = json['followers'];
    following = json['following'];
  }
}
