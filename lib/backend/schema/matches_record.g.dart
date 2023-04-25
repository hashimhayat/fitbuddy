// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MatchesRecord> _$matchesRecordSerializer =
    new _$MatchesRecordSerializer();

class _$MatchesRecordSerializer implements StructuredSerializer<MatchesRecord> {
  @override
  final Iterable<Type> types = const [MatchesRecord, _$MatchesRecord];
  @override
  final String wireName = 'MatchesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MatchesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.connected;
    if (value != null) {
      result
        ..add('connected')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.primaryUserRef;
    if (value != null) {
      result
        ..add('primary_user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.secondaryUserRef;
    if (value != null) {
      result
        ..add('secondary_user_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.matched;
    if (value != null) {
      result
        ..add('matched')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.primaryUserName;
    if (value != null) {
      result
        ..add('primary_user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.secondaryUserName;
    if (value != null) {
      result
        ..add('secondary_user_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.prinaryUserImage;
    if (value != null) {
      result
        ..add('prinary_user_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.secondaryUserImage;
    if (value != null) {
      result
        ..add('secondary_user_image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MatchesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MatchesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'connected':
          result.connected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'primary_user_ref':
          result.primaryUserRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'secondary_user_ref':
          result.secondaryUserRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'matched':
          result.matched = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'primary_user_name':
          result.primaryUserName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'secondary_user_name':
          result.secondaryUserName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'prinary_user_image':
          result.prinaryUserImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'secondary_user_image':
          result.secondaryUserImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MatchesRecord extends MatchesRecord {
  @override
  final DateTime? createdAt;
  @override
  final bool? connected;
  @override
  final DocumentReference<Object?>? primaryUserRef;
  @override
  final DocumentReference<Object?>? secondaryUserRef;
  @override
  final bool? matched;
  @override
  final String? primaryUserName;
  @override
  final String? secondaryUserName;
  @override
  final String? prinaryUserImage;
  @override
  final String? secondaryUserImage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MatchesRecord([void Function(MatchesRecordBuilder)? updates]) =>
      (new MatchesRecordBuilder()..update(updates))._build();

  _$MatchesRecord._(
      {this.createdAt,
      this.connected,
      this.primaryUserRef,
      this.secondaryUserRef,
      this.matched,
      this.primaryUserName,
      this.secondaryUserName,
      this.prinaryUserImage,
      this.secondaryUserImage,
      this.ffRef})
      : super._();

  @override
  MatchesRecord rebuild(void Function(MatchesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MatchesRecordBuilder toBuilder() => new MatchesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchesRecord &&
        createdAt == other.createdAt &&
        connected == other.connected &&
        primaryUserRef == other.primaryUserRef &&
        secondaryUserRef == other.secondaryUserRef &&
        matched == other.matched &&
        primaryUserName == other.primaryUserName &&
        secondaryUserName == other.secondaryUserName &&
        prinaryUserImage == other.prinaryUserImage &&
        secondaryUserImage == other.secondaryUserImage &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, connected.hashCode);
    _$hash = $jc(_$hash, primaryUserRef.hashCode);
    _$hash = $jc(_$hash, secondaryUserRef.hashCode);
    _$hash = $jc(_$hash, matched.hashCode);
    _$hash = $jc(_$hash, primaryUserName.hashCode);
    _$hash = $jc(_$hash, secondaryUserName.hashCode);
    _$hash = $jc(_$hash, prinaryUserImage.hashCode);
    _$hash = $jc(_$hash, secondaryUserImage.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MatchesRecord')
          ..add('createdAt', createdAt)
          ..add('connected', connected)
          ..add('primaryUserRef', primaryUserRef)
          ..add('secondaryUserRef', secondaryUserRef)
          ..add('matched', matched)
          ..add('primaryUserName', primaryUserName)
          ..add('secondaryUserName', secondaryUserName)
          ..add('prinaryUserImage', prinaryUserImage)
          ..add('secondaryUserImage', secondaryUserImage)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MatchesRecordBuilder
    implements Builder<MatchesRecord, MatchesRecordBuilder> {
  _$MatchesRecord? _$v;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  bool? _connected;
  bool? get connected => _$this._connected;
  set connected(bool? connected) => _$this._connected = connected;

  DocumentReference<Object?>? _primaryUserRef;
  DocumentReference<Object?>? get primaryUserRef => _$this._primaryUserRef;
  set primaryUserRef(DocumentReference<Object?>? primaryUserRef) =>
      _$this._primaryUserRef = primaryUserRef;

  DocumentReference<Object?>? _secondaryUserRef;
  DocumentReference<Object?>? get secondaryUserRef => _$this._secondaryUserRef;
  set secondaryUserRef(DocumentReference<Object?>? secondaryUserRef) =>
      _$this._secondaryUserRef = secondaryUserRef;

  bool? _matched;
  bool? get matched => _$this._matched;
  set matched(bool? matched) => _$this._matched = matched;

  String? _primaryUserName;
  String? get primaryUserName => _$this._primaryUserName;
  set primaryUserName(String? primaryUserName) =>
      _$this._primaryUserName = primaryUserName;

  String? _secondaryUserName;
  String? get secondaryUserName => _$this._secondaryUserName;
  set secondaryUserName(String? secondaryUserName) =>
      _$this._secondaryUserName = secondaryUserName;

  String? _prinaryUserImage;
  String? get prinaryUserImage => _$this._prinaryUserImage;
  set prinaryUserImage(String? prinaryUserImage) =>
      _$this._prinaryUserImage = prinaryUserImage;

  String? _secondaryUserImage;
  String? get secondaryUserImage => _$this._secondaryUserImage;
  set secondaryUserImage(String? secondaryUserImage) =>
      _$this._secondaryUserImage = secondaryUserImage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MatchesRecordBuilder() {
    MatchesRecord._initializeBuilder(this);
  }

  MatchesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createdAt = $v.createdAt;
      _connected = $v.connected;
      _primaryUserRef = $v.primaryUserRef;
      _secondaryUserRef = $v.secondaryUserRef;
      _matched = $v.matched;
      _primaryUserName = $v.primaryUserName;
      _secondaryUserName = $v.secondaryUserName;
      _prinaryUserImage = $v.prinaryUserImage;
      _secondaryUserImage = $v.secondaryUserImage;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MatchesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MatchesRecord;
  }

  @override
  void update(void Function(MatchesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MatchesRecord build() => _build();

  _$MatchesRecord _build() {
    final _$result = _$v ??
        new _$MatchesRecord._(
            createdAt: createdAt,
            connected: connected,
            primaryUserRef: primaryUserRef,
            secondaryUserRef: secondaryUserRef,
            matched: matched,
            primaryUserName: primaryUserName,
            secondaryUserName: secondaryUserName,
            prinaryUserImage: prinaryUserImage,
            secondaryUserImage: secondaryUserImage,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
