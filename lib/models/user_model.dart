class UserModel {
  String? uid;
  String? email;
  String? fullName;
  // int? birthDay;
  int? phoneNumber;
  // String? streetAddress;
  // String? city;
  // int? zipcode;
  // bool? isAdmin;

  UserModel(
      {this.uid,
      this.email,
      this.fullName,
      // this.birthDay,
      this.phoneNumber,
      // this.streetAddress,
      // this.city,
      // this.zipcode,
      // this.isAdmin
      });

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        fullName: map['fullName'],
        // birthDay: map['birthDay'],
        phoneNumber: map['phoneNumber'],
        // streetAddress: map['streetAddress'],
        // city: map['city'],
        // zipcode: map['zipcode'],
        // isAdmin: map['isAdmin']
        );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      // 'birthDay': birthDay,
      'phoneNumber': phoneNumber,
      // 'streetAddress': streetAddress,
      // 'city': city,
      // 'zipcode': zipcode,
      // 'isAdmin': isAdmin,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        uid: json['uid'],
        email: json['email'],
        fullName: json['fullName'],
        // birthDay: json['birthDay'],
        phoneNumber: json['phoneNumber'],
        // streetAddress: json['streetAddress'],
        // city: json['city'],
        // zipcode: json['zipcode'],
        // isAdmin: json['isAdmin'],
  );
}
