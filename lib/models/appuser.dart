import 'dart:convert';

class AppUser {
  AppUser({
    this.id,
    this.nom,
    this.prenom,
    this.sexe,
    this.nationalite,
    this.password,
    this.email,
    this.profession,
    this.connecte,
  });

  int ? id;
  String? nom;
  String? prenom;
  String? sexe;
  String? nationalite;
  String? password;
  String? email;
  String? profession;
  int? connecte;
  Map<String,dynamic> toMap() {


    var map={'nom':nom,
    'prenom':prenom,'sexe':sexe,'nationalite':nationalite,'connecte':connecte,
    'password':password,'email':email,'profession':profession};
    return map;
  }
  factory  AppUser.fromMap(Map<String, dynamic> map)=>AppUser(
      id:map['id'], nom:map['nom'], prenom:map['prenom'],
      sexe:map['sexe'],
      nationalite:map['nationalite'],
      connecte:map['connecte'],
      password:map['password'],
      email:map['email'],
      profession:map['profession'],
      );



  factory AppUser.fromJson(String str) => AppUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());


}