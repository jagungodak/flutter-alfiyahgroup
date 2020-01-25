class UserModel{
  String id_user;
  String nama_user;
  String error;
  String error_msg;

  UserModel({
    this.id_user,
    this.nama_user,
    this.error,
    this.error_msg,
  });

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    Map<String, dynamic> json = parsedJson['pesan'];
    return UserModel(
      id_user: json['id_user'],
      nama_user: json['nama_user'],
      error: json['error'].toString(),
      error_msg: json['error_msg'],
    );
  }
}