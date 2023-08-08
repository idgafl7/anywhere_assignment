import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'developer.dart';
import 'maintainer.dart';
import 'src_options.dart';

class Meta extends Equatable {
  final dynamic attribution;
  final dynamic blockgroup;
  final dynamic createdDate;
  final String? description;
  final dynamic designer;
  final dynamic devDate;
  final String? devMilestone;
  final List<Developer>? developer;
  final String? exampleQuery;
  final String? id;
  final dynamic isStackexchange;
  final String? jsCallbackName;
  final dynamic liveDate;
  final Maintainer? maintainer;
  final String? name;
  final String? perlModule;
  final dynamic producer;
  final String? productionState;
  final String? repo;
  final String? signalFrom;
  final String? srcDomain;
  final int? srcId;
  final String? srcName;
  final SrcOptions? srcOptions;
  final dynamic srcUrl;
  final String? status;
  final String? tab;
  final List<dynamic>? topic;
  final int? unsafe;

  const Meta({
    this.attribution,
    this.blockgroup,
    this.createdDate,
    this.description,
    this.designer,
    this.devDate,
    this.devMilestone,
    this.developer,
    this.exampleQuery,
    this.id,
    this.isStackexchange,
    this.jsCallbackName,
    this.liveDate,
    this.maintainer,
    this.name,
    this.perlModule,
    this.producer,
    this.productionState,
    this.repo,
    this.signalFrom,
    this.srcDomain,
    this.srcId,
    this.srcName,
    this.srcOptions,
    this.srcUrl,
    this.status,
    this.tab,
    this.topic,
    this.unsafe,
  });

  factory Meta.fromMap(Map<String, dynamic> data) {
    return Meta(
      attribution: data['attribution'] as dynamic,
      blockgroup: data['blockgroup'] as dynamic,
      createdDate: data['created_date'] as dynamic,
      description: data['description'] as String?,
      designer: data['designer'] as dynamic,
      devDate: data['dev_date'] as dynamic,
      devMilestone: data['dev_milestone'] as String?,
      developer: (data['developer'] as List<dynamic>?)
          ?.map((e) => Developer.fromMap(e as Map<String, dynamic>))
          .toList(),
      exampleQuery: data['example_query'] as String?,
      id: data['id'] as String?,
      isStackexchange: data['is_stackexchange'] as dynamic,
      jsCallbackName: data['js_callback_name'] as String?,
      liveDate: data['live_date'] as dynamic,
      maintainer: data['maintainer'] == null
          ? null
          : Maintainer.fromMap(data['maintainer'] as Map<String, dynamic>),
      name: data['name'] as String?,
      perlModule: data['perl_module'] as String?,
      producer: data['producer'] as dynamic,
      productionState: data['production_state'] as String?,
      repo: data['repo'] as String?,
      signalFrom: data['signal_from'] as String?,
      srcDomain: data['src_domain'] as String?,
      srcId: data['src_id'] as int?,
      srcName: data['src_name'] as String?,
      srcOptions: data['src_options'] == null
          ? null
          : SrcOptions.fromMap(data['src_options'] as Map<String, dynamic>),
      srcUrl: data['src_url'] as dynamic,
      status: data['status'] as String?,
      tab: data['tab'] as String?,
      topic: data['topic'] as List<dynamic>?,
      unsafe: data['unsafe'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'attribution': attribution,
      'blockgroup': blockgroup,
      'created_date': createdDate,
      'description': description,
      'designer': designer,
      'dev_date': devDate,
      'dev_milestone': devMilestone,
      'developer': developer?.map((e) => e.toMap()).toList(),
      'example_query': exampleQuery,
      'id': id,
      'is_stackexchange': isStackexchange,
      'js_callback_name': jsCallbackName,
      'live_date': liveDate,
      'maintainer': maintainer?.toMap(),
      'name': name,
      'perl_module': perlModule,
      'producer': producer,
      'production_state': productionState,
      'repo': repo,
      'signal_from': signalFrom,
      'src_domain': srcDomain,
      'src_id': srcId,
      'src_name': srcName,
      'src_options': srcOptions?.toMap(),
      'src_url': srcUrl,
      'status': status,
      'tab': tab,
      'topic': topic,
      'unsafe': unsafe,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Meta].
  factory Meta.fromJson(String data) {
    return Meta.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Meta] to a JSON string.
  String toJson() => json.encode(toMap());

  Meta copyWith({
    dynamic attribution,
    dynamic blockgroup,
    dynamic createdDate,
    String? description,
    dynamic designer,
    dynamic devDate,
    String? devMilestone,
    List<Developer>? developer,
    String? exampleQuery,
    String? id,
    dynamic isStackexchange,
    String? jsCallbackName,
    dynamic liveDate,
    Maintainer? maintainer,
    String? name,
    String? perlModule,
    dynamic producer,
    String? productionState,
    String? repo,
    String? signalFrom,
    String? srcDomain,
    int? srcId,
    String? srcName,
    SrcOptions? srcOptions,
    dynamic srcUrl,
    String? status,
    String? tab,
    List<String>? topic,
    int? unsafe,
  }) {
    return Meta(
      attribution: attribution ?? this.attribution,
      blockgroup: blockgroup ?? this.blockgroup,
      createdDate: createdDate ?? this.createdDate,
      description: description ?? this.description,
      designer: designer ?? this.designer,
      devDate: devDate ?? this.devDate,
      devMilestone: devMilestone ?? this.devMilestone,
      developer: developer ?? this.developer,
      exampleQuery: exampleQuery ?? this.exampleQuery,
      id: id ?? this.id,
      isStackexchange: isStackexchange ?? this.isStackexchange,
      jsCallbackName: jsCallbackName ?? this.jsCallbackName,
      liveDate: liveDate ?? this.liveDate,
      maintainer: maintainer ?? this.maintainer,
      name: name ?? this.name,
      perlModule: perlModule ?? this.perlModule,
      producer: producer ?? this.producer,
      productionState: productionState ?? this.productionState,
      repo: repo ?? this.repo,
      signalFrom: signalFrom ?? this.signalFrom,
      srcDomain: srcDomain ?? this.srcDomain,
      srcId: srcId ?? this.srcId,
      srcName: srcName ?? this.srcName,
      srcOptions: srcOptions ?? this.srcOptions,
      srcUrl: srcUrl ?? this.srcUrl,
      status: status ?? this.status,
      tab: tab ?? this.tab,
      topic: topic ?? this.topic,
      unsafe: unsafe ?? this.unsafe,
    );
  }

  @override
  List<Object?> get props {
    return [
      attribution,
      blockgroup,
      createdDate,
      description,
      designer,
      devDate,
      devMilestone,
      developer,
      exampleQuery,
      id,
      isStackexchange,
      jsCallbackName,
      liveDate,
      maintainer,
      name,
      perlModule,
      producer,
      productionState,
      repo,
      signalFrom,
      srcDomain,
      srcId,
      srcName,
      srcOptions,
      srcUrl,
      status,
      tab,
      topic,
      unsafe,
    ];
  }
}
