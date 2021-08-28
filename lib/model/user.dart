class User {
  final int? id;
  final String? username;
  final String? email;
  final String? phoneNo;
  final String? profilePictureUrl;
  final String? status;
  final String? activity;

  User({
    this.id,
    this.username,
    this.email,
    this.phoneNo,
    this.profilePictureUrl,
    this.status,
    this.activity,
  });

  String get usernameAndId => "$username#$id";
}
