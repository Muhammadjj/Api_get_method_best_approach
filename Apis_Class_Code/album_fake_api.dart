// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Album {
  int id;
  int userId;
  String title;
  Album({ required this.id,required this.userId,required this.title,});

  Album copyWith({
    int? id,
    int? userId,
    String? title,
  }) {
    return Album(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      id: map['id']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Album.fromJson(String source) => Album.fromMap(json.decode(source));

  @override
  String toString() => 'Album(id: $id, userId: $userId, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Album &&
      other.id == id &&
      other.userId == userId &&
      other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ userId.hashCode ^ title.hashCode;
}
