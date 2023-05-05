// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waitlist_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WaitlistRecord> _$waitlistRecordSerializer =
    new _$WaitlistRecordSerializer();

class _$WaitlistRecordSerializer
    implements StructuredSerializer<WaitlistRecord> {
  @override
  final Iterable<Type> types = const [WaitlistRecord, _$WaitlistRecord];
  @override
  final String wireName = 'WaitlistRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, WaitlistRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.joinedOn;
    if (value != null) {
      result
        ..add('joined_on')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
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
  WaitlistRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WaitlistRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'joined_on':
          result.joinedOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
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

class _$WaitlistRecord extends WaitlistRecord {
  @override
  final String? email;
  @override
  final DateTime? joinedOn;
  @override
  final String? type;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$WaitlistRecord([void Function(WaitlistRecordBuilder)? updates]) =>
      (new WaitlistRecordBuilder()..update(updates))._build();

  _$WaitlistRecord._({this.email, this.joinedOn, this.type, this.ffRef})
      : super._();

  @override
  WaitlistRecord rebuild(void Function(WaitlistRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WaitlistRecordBuilder toBuilder() =>
      new WaitlistRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WaitlistRecord &&
        email == other.email &&
        joinedOn == other.joinedOn &&
        type == other.type &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, joinedOn.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WaitlistRecord')
          ..add('email', email)
          ..add('joinedOn', joinedOn)
          ..add('type', type)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class WaitlistRecordBuilder
    implements Builder<WaitlistRecord, WaitlistRecordBuilder> {
  _$WaitlistRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  DateTime? _joinedOn;
  DateTime? get joinedOn => _$this._joinedOn;
  set joinedOn(DateTime? joinedOn) => _$this._joinedOn = joinedOn;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  WaitlistRecordBuilder() {
    WaitlistRecord._initializeBuilder(this);
  }

  WaitlistRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _joinedOn = $v.joinedOn;
      _type = $v.type;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WaitlistRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WaitlistRecord;
  }

  @override
  void update(void Function(WaitlistRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WaitlistRecord build() => _build();

  _$WaitlistRecord _build() {
    final _$result = _$v ??
        new _$WaitlistRecord._(
            email: email, joinedOn: joinedOn, type: type, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
