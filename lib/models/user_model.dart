class UserModel {
  String? uid;
  String? email;
  String? fullName;
  int? batchNo;
  int? phoneNumber;
  // String? streetAddress;
  // String? city;
  // int? zipcode;
  // bool? isAdmin;

  UserModel(
      {this.uid,
      this.email,
      this.fullName,
      this.batchNo,
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
        batchNo: map['batchNo'],
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
      'batchNo': batchNo,
      'phoneNumber': phoneNumber,
      // 'streetAddress': streetAddress,
      // 'city': city,
      // 'zipcode': zipcode,
      // 'isAdmin': isAdmin,
    };
  }

  // static UserModel fromMap(Map<String, dynamic> map) => UserModel(
  //       uid: map['uid'],
  //       email: map['email'],
  //       fullName: map['fullName'],
  //       batchNo: map['batchNo'],
  //       phoneNumber: map['phoneNumber'],
  //       // streetAddress: map['streetAddress'],
  //       // city: map['city'],
  //       // zipcode: map['zipcode'],
  //       // isAdmin: map['isAdmin'],
  // );
}
