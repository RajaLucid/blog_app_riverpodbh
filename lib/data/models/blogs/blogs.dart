import 'dart:convert';

import 'package:flutter/foundation.dart';

class Blogs {
  final List<Blog> blogs;
  Blogs({
    required this.blogs,
  });

  Blogs copyWith({
    List<Blog>? blogs,
  }) {
    return Blogs(
      blogs: blogs ?? this.blogs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'blogs': blogs.map((x) => x.toMap()).toList(),
    };
  }

  factory Blogs.fromMap(Map<String, dynamic> map) {
    return Blogs(
      blogs: List<Blog>.from(map['blogs']?.map((x) => Blog.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Blogs.fromJson(String source) => Blogs.fromMap(json.decode(source));

  @override
  String toString() => 'Blogs(blogs: $blogs)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Blogs &&
      listEquals(other.blogs, blogs);
  }

  @override
  int get hashCode => blogs.hashCode;
}

class Blog {
  final String title;
  final int userid;
  final String body;
  final int id;
  Blog({
    required this.title,
    required this.userid,
    required this.body,
    required this.id,
  });

  Blog copyWith({
    String? title,
    int? userid,
    String? body,
    int? id,
  }) {
    return Blog(
      title: title ?? this.title,
      userid: userid ?? this.userid,
      body: body ?? this.body,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'user_id': userid,
      'body': body,
      'id': id,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      title: map['title'] ?? '',
      userid: map['user_id']?.toInt() ?? 0,
      body: map['body'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Blog(title: $title, user_id: $userid, body: $body, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Blog &&
      other.title == title &&
      other.userid == userid &&
      other.body == body &&
      other.id == id;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      userid.hashCode ^
      body.hashCode ^
      id.hashCode;
  }
}