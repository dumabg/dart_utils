//
//  Generated code. Do not modify.
//  source: game_points_request.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class GamePointsRequest extends $pb.GeneratedMessage {
  factory GamePointsRequest({
    $core.String? experienceId,
    $core.int? points,
    $core.bool? alwaysRateRanking,
  }) {
    final $result = create();
    if (experienceId != null) {
      $result.experienceId = experienceId;
    }
    if (points != null) {
      $result.points = points;
    }
    if (alwaysRateRanking != null) {
      $result.alwaysRateRanking = alwaysRateRanking;
    }
    return $result;
  }
  GamePointsRequest._() : super();
  factory GamePointsRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GamePointsRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GamePointsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api4'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'experienceId', protoName: 'experienceId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'points', $pb.PbFieldType.OU3)
    ..aOB(3, _omitFieldNames ? '' : 'alwaysRateRanking',
        protoName: 'alwaysRateRanking')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GamePointsRequest clone() => createEmptyInstance();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GamePointsRequest copyWith(void Function(GamePointsRequest) updates) =>
      super.copyWith((message) => updates(message as GamePointsRequest))
          as GamePointsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GamePointsRequest create() => GamePointsRequest._();
  GamePointsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GamePointsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GamePointsRequest>(create);
  static GamePointsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get experienceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set experienceId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasExperienceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearExperienceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get points => $_getIZ(1);
  @$pb.TagNumber(2)
  set points($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPoints() => $_has(1);
  @$pb.TagNumber(2)
  void clearPoints() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get alwaysRateRanking => $_getBF(2);
  @$pb.TagNumber(3)
  set alwaysRateRanking($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAlwaysRateRanking() => $_has(2);
  @$pb.TagNumber(3)
  void clearAlwaysRateRanking() => $_clearField(3);
}

class GamePointsResponse extends $pb.GeneratedMessage {
  factory GamePointsResponse({
    $core.int? position,
  }) {
    final $result = create();
    if (position != null) {
      $result.position = position;
    }
    return $result;
  }
  GamePointsResponse._() : super();
  factory GamePointsResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GamePointsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GamePointsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'api4'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'position', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GamePointsResponse clone() => createEmptyInstance();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GamePointsResponse copyWith(void Function(GamePointsResponse) updates) =>
      super.copyWith((message) => updates(message as GamePointsResponse))
          as GamePointsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GamePointsResponse create() => GamePointsResponse._();
  GamePointsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GamePointsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GamePointsResponse>(create);
  static GamePointsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get position => $_getIZ(0);
  @$pb.TagNumber(1)
  set position($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPosition() => $_has(0);
  @$pb.TagNumber(1)
  void clearPosition() => $_clearField(1);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
