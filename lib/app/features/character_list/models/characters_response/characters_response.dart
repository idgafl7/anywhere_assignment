import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'meta.dart';
import 'related_topic.dart';

class CharactersResponse extends Equatable {
  final String? abstract;
  final String? abstractSource;
  final String? abstractText;
  final String? abstractUrl;
  final String? answer;
  final String? answerType;
  final String? definition;
  final String? definitionSource;
  final String? definitionUrl;
  final String? entity;
  final String? heading;
  final String? image;
  final int? imageHeight;
  final int? imageIsLogo;
  final int? imageWidth;
  final String? infobox;
  final String? redirect;
  final List<RelatedTopic>? relatedTopics;
  final List<dynamic>? results;
  final String? type;
  final Meta? meta;

  const CharactersResponse({
    this.abstract,
    this.abstractSource,
    this.abstractText,
    this.abstractUrl,
    this.answer,
    this.answerType,
    this.definition,
    this.definitionSource,
    this.definitionUrl,
    this.entity,
    this.heading,
    this.image,
    this.imageHeight,
    this.imageIsLogo,
    this.imageWidth,
    this.infobox,
    this.redirect,
    this.relatedTopics,
    this.results,
    this.type,
    this.meta,
  });

  factory CharactersResponse.fromMap(Map<String, dynamic> data) {
    return CharactersResponse(
      abstract: data['Abstract'] as String?,
      abstractSource: data['AbstractSource'] as String?,
      abstractText: data['AbstractText'] as String?,
      abstractUrl: data['AbstractURL'] as String?,
      answer: data['Answer'] as String?,
      answerType: data['AnswerType'] as String?,
      definition: data['Definition'] as String?,
      definitionSource: data['DefinitionSource'] as String?,
      definitionUrl: data['DefinitionURL'] as String?,
      entity: data['Entity'] as String?,
      heading: data['Heading'] as String?,
      image: data['Image'] as String?,
      imageHeight: data['ImageHeight'] as int?,
      imageIsLogo: data['ImageIsLogo'] as int?,
      imageWidth: data['ImageWidth'] as int?,
      infobox: data['Infobox'] as String?,
      redirect: data['Redirect'] as String?,
      relatedTopics: (data['RelatedTopics'] as List<dynamic>?)
          ?.map((e) => RelatedTopic.fromMap(e as Map<String, dynamic>))
          .toList(),
      results: data['Results'] as List<dynamic>?,
      type: data['Type'] as String?,
      meta: data['meta'] == null
          ? null
          : Meta.fromMap(data['meta'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Abstract': abstract,
      'AbstractSource': abstractSource,
      'AbstractText': abstractText,
      'AbstractURL': abstractUrl,
      'Answer': answer,
      'AnswerType': answerType,
      'Definition': definition,
      'DefinitionSource': definitionSource,
      'DefinitionURL': definitionUrl,
      'Entity': entity,
      'Heading': heading,
      'Image': image,
      'ImageHeight': imageHeight,
      'ImageIsLogo': imageIsLogo,
      'ImageWidth': imageWidth,
      'Infobox': infobox,
      'Redirect': redirect,
      'RelatedTopics': relatedTopics?.map((e) => e.toMap()).toList(),
      'Results': results,
      'Type': type,
      'meta': meta?.toMap(),
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CharactersResponse].
  factory CharactersResponse.fromJson(String data) {
    return CharactersResponse.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CharactersResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  CharactersResponse copyWith({
    String? abstract,
    String? abstractSource,
    String? abstractText,
    String? abstractUrl,
    String? answer,
    String? answerType,
    String? definition,
    String? definitionSource,
    String? definitionUrl,
    String? entity,
    String? heading,
    String? image,
    int? imageHeight,
    int? imageIsLogo,
    int? imageWidth,
    String? infobox,
    String? redirect,
    List<RelatedTopic>? relatedTopics,
    List<dynamic>? results,
    String? type,
    Meta? meta,
  }) {
    return CharactersResponse(
      abstract: abstract ?? this.abstract,
      abstractSource: abstractSource ?? this.abstractSource,
      abstractText: abstractText ?? this.abstractText,
      abstractUrl: abstractUrl ?? this.abstractUrl,
      answer: answer ?? this.answer,
      answerType: answerType ?? this.answerType,
      definition: definition ?? this.definition,
      definitionSource: definitionSource ?? this.definitionSource,
      definitionUrl: definitionUrl ?? this.definitionUrl,
      entity: entity ?? this.entity,
      heading: heading ?? this.heading,
      image: image ?? this.image,
      imageHeight: imageHeight ?? this.imageHeight,
      imageIsLogo: imageIsLogo ?? this.imageIsLogo,
      imageWidth: imageWidth ?? this.imageWidth,
      infobox: infobox ?? this.infobox,
      redirect: redirect ?? this.redirect,
      relatedTopics: relatedTopics ?? this.relatedTopics,
      results: results ?? this.results,
      type: type ?? this.type,
      meta: meta ?? this.meta,
    );
  }

  @override
  List<Object?> get props {
    return [
      abstract,
      abstractSource,
      abstractText,
      abstractUrl,
      answer,
      answerType,
      definition,
      definitionSource,
      definitionUrl,
      entity,
      heading,
      image,
      imageHeight,
      imageIsLogo,
      imageWidth,
      infobox,
      redirect,
      relatedTopics,
      results,
      type,
      meta,
    ];
  }
}
