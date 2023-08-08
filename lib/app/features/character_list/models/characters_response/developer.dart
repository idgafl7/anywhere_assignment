import 'dart:convert';

import 'package:equatable/equatable.dart';

class Developer extends Equatable {
  final String? name;
  final String? type;
  final String? url;

  const Developer({this.name, this.type, this.url});

  factory Developer.fromMap(Map<String, dynamic> data) {
    return Developer(
      name: data['name'] as String?,
      type: data['type'] as String?,
      url: data['url'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'url': url,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Developer].
  factory Developer.fromJson(String data) {
    return Developer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Developer] to a JSON string.
  String toJson() => json.encode(toMap());

  Developer copyWith({
    String? name,
    String? type,
    String? url,
  }) {
    return Developer(
      name: name ?? this.name,
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [name, type, url];
}
