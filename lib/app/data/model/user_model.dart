class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? uid;

  UserModel({this.firstName, this.lastName, this.uid, this.email});

  //receiving data from firestore
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map["uid"],
      firstName: map["firstname"],
      lastName: map["lastname"],
      email: map["email"],
    );
  }

  // sending data to firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstname': firstName,
      'lastname': lastName,
      'email': email,
    };
  }
}
