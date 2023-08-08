import 'dart:convert';

import 'package:equatable/equatable.dart';

class Icon extends Equatable {
  final String? height;
  final String? url;
  final String? width;

  const Icon({this.height, this.url, this.width});

  factory Icon.fromMap(Map<String, dynamic> data) {
    return Icon(
      height: data['Height'] as String?,
      url: data['URL'] as String?,
      width: data['Width'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Height': height,
      'URL': url,
      'Width': width,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Icon].
  factory Icon.fromJson(String data) {
    return Icon.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Icon] to a JSON string.
  String toJson() => json.encode(toMap());

  Icon copyWith({
    String? height,
    String? url,
    String? width,
  }) {
    return Icon(
      height: height ?? this.height,
      url: url ?? this.url,
      width: width ?? this.width,
    );
  }

  @override
  List<Object?> get props => [height, url, width];
}
