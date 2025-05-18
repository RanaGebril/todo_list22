class UserModel {
  String userId;
  String firstName;
  String lastName;
  String phone;
  String email;

  UserModel({
    this.userId = " ",
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
  });

  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        userId: json['usedId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        phone: json['phone'],
        email: json['email'],
      );

  Map<String, dynamic> toJson(){
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
    };
  }

}
