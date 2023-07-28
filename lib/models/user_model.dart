import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String name;
  final String uid;
  final bool isAuthenticated;
  final String profilePic;
  UserModel({
    required this.name,
    required this.uid,
    required this.isAuthenticated,
    required this.profilePic,
  });

  UserModel copyWith({
    String? name,
    String? uid,
    bool? isAuthenticated,
    String? profilePic,
  }) {
    return UserModel(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      profilePic: profilePic ?? this.profilePic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'isAuthenticated': isAuthenticated,
      'profilePic': profilePic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      uid: map['uid'] as String,
      isAuthenticated: map['isAuthenticated'] as bool,
      profilePic: map['profilePic'] as String,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, uid: $uid, isAuthenticated: $isAuthenticated, profilePic: $profilePic)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.uid == uid &&
        other.isAuthenticated == isAuthenticated &&
        other.profilePic == profilePic;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        uid.hashCode ^
        isAuthenticated.hashCode ^
        profilePic.hashCode;
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
