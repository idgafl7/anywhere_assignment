import 'dart:convert';

import 'package:equatable/equatable.dart';

class Maintainer extends Equatable {
  final String? github;

  const Maintainer({this.github});

  factory Maintainer.fromMap(Map<String, dynamic> data) {
    return Maintainer(
      github: data['github'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'github': github,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Maintainer].
  factory Maintainer.fromJson(String data) {
    return Maintainer.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Maintainer] to a JSON string.
  String toJson() => json.encode(toMap());

  Maintainer copyWith({
    String? github,
  }) {
    return Maintainer(
      github: github ?? this.github,
    );
  }

  @override
  List<Object?> get props => [github];
}
