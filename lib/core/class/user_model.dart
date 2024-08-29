class UsersModel {
  String? usersId;
  String? usersName;
  String? usersEmail;
  String? usersPassword;
  String? usersPhone;

  UsersModel(
      {this.usersId,
      this.usersName,
      this.usersEmail,
      this.usersPassword,
      this.usersPhone});

  UsersModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersPassword = json['users_password'];
    usersPhone = json['users_phone'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['users_id'] = this.usersId;
  //   data['users_name'] = this.usersName;
  //   data['users_email'] = this.usersEmail;
  //   data['users_password'] = this.usersPassword;
  //   data['users_phone'] = this.usersPhone;
  //   return data;
  // }
}
