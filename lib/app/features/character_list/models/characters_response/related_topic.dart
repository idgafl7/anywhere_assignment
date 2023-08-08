import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'icon.dart';

class RelatedTopic extends Equatable {
  final String? firstUrl;
  final Icon? icon;
  final String? result;
  final String? text;

  const RelatedTopic({this.firstUrl, this.icon, this.result, this.text});

  factory RelatedTopic.fromMap(Map<String, dynamic> data) {
    return RelatedTopic(
      firstUrl: data['FirstURL'] as String?,
      icon: data['Icon'] == null
          ? null
          : Icon.fromMap(data['Icon'] as Map<String, dynamic>),
      result: data['Result'] as String?,
      text: data['Text'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'FirstURL': firstUrl,
      'Icon': icon?.toMap(),
      'Result': result,
      'Text': text,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RelatedTopic].
  factory RelatedTopic.fromJson(String data) {
    return RelatedTopic.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RelatedTopic] to a JSON string.
  String toJson() => json.encode(toMap());

  RelatedTopic copyWith({
    String? firstUrl,
    Icon? icon,
    String? result,
    String? text,
  }) {
    return RelatedTopic(
      firstUrl: firstUrl ?? this.firstUrl,
      icon: icon ?? this.icon,
      result: result ?? this.result,
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props => [firstUrl, icon, result, text];
}
