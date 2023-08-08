import 'dart:convert';

import 'package:equatable/equatable.dart';

class SrcOptions extends Equatable {
  final String? directory;
  final int? isFanon;
  final int? isMediawiki;
  final int? isWikipedia;
  final String? language;
  final String? minAbstractLength;
  final int? skipAbstract;
  final int? skipAbstractParen;
  final String? skipEnd;
  final int? skipIcon;
  final int? skipImageName;
  final String? skipQr;
  final String? sourceSkip;
  final String? srcInfo;

  const SrcOptions({
    this.directory,
    this.isFanon,
    this.isMediawiki,
    this.isWikipedia,
    this.language,
    this.minAbstractLength,
    this.skipAbstract,
    this.skipAbstractParen,
    this.skipEnd,
    this.skipIcon,
    this.skipImageName,
    this.skipQr,
    this.sourceSkip,
    this.srcInfo,
  });

  factory SrcOptions.fromMap(Map<String, dynamic> data) {
    return SrcOptions(
      directory: data['directory'] as String?,
      isFanon: data['is_fanon'] as int?,
      isMediawiki: data['is_mediawiki'] as int?,
      isWikipedia: data['is_wikipedia'] as int?,
      language: data['language'] as String?,
      minAbstractLength: data['min_abstract_length'] as String?,
      skipAbstract: data['skip_abstract'] as int?,
      skipAbstractParen: data['skip_abstract_paren'] as int?,
      skipEnd: data['skip_end'] as String?,
      skipIcon: data['skip_icon'] as int?,
      skipImageName: data['skip_image_name'] as int?,
      skipQr: data['skip_qr'] as String?,
      sourceSkip: data['source_skip'] as String?,
      srcInfo: data['src_info'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'directory': directory,
      'is_fanon': isFanon,
      'is_mediawiki': isMediawiki,
      'is_wikipedia': isWikipedia,
      'language': language,
      'min_abstract_length': minAbstractLength,
      'skip_abstract': skipAbstract,
      'skip_abstract_paren': skipAbstractParen,
      'skip_end': skipEnd,
      'skip_icon': skipIcon,
      'skip_image_name': skipImageName,
      'skip_qr': skipQr,
      'source_skip': sourceSkip,
      'src_info': srcInfo,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SrcOptions].
  factory SrcOptions.fromJson(String data) {
    return SrcOptions.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SrcOptions] to a JSON string.
  String toJson() => json.encode(toMap());

  SrcOptions copyWith({
    String? directory,
    int? isFanon,
    int? isMediawiki,
    int? isWikipedia,
    String? language,
    String? minAbstractLength,
    int? skipAbstract,
    int? skipAbstractParen,
    String? skipEnd,
    int? skipIcon,
    int? skipImageName,
    String? skipQr,
    String? sourceSkip,
    String? srcInfo,
  }) {
    return SrcOptions(
      directory: directory ?? this.directory,
      isFanon: isFanon ?? this.isFanon,
      isMediawiki: isMediawiki ?? this.isMediawiki,
      isWikipedia: isWikipedia ?? this.isWikipedia,
      language: language ?? this.language,
      minAbstractLength: minAbstractLength ?? this.minAbstractLength,
      skipAbstract: skipAbstract ?? this.skipAbstract,
      skipAbstractParen: skipAbstractParen ?? this.skipAbstractParen,
      skipEnd: skipEnd ?? this.skipEnd,
      skipIcon: skipIcon ?? this.skipIcon,
      skipImageName: skipImageName ?? this.skipImageName,
      skipQr: skipQr ?? this.skipQr,
      sourceSkip: sourceSkip ?? this.sourceSkip,
      srcInfo: srcInfo ?? this.srcInfo,
    );
  }

  @override
  List<Object?> get props {
    return [
      directory,
      isFanon,
      isMediawiki,
      isWikipedia,
      language,
      minAbstractLength,
      skipAbstract,
      skipAbstractParen,
      skipEnd,
      skipIcon,
      skipImageName,
      skipQr,
      sourceSkip,
      srcInfo,
    ];
  }
}
