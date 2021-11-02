class UserModel {
  String? uid;
  String? nama;
  int? noHP;
  String? email;
  String? password;

  UserModel({
    this.uid,
    this.nama,
    this.noHP,
    this.email,
    this.password,
  });

  //menerima data dari server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      nama: map['nama'],
      noHP: map['noHP'],
      email: map['email'],
      password: map['password'],
    );
  }

  //sending data ke server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nama': nama,
      'noHP': noHP,
      'email': email,
      'password': password,
    };
  }
}
