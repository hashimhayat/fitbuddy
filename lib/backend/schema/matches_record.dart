import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'matches_record.g.dart';

abstract class MatchesRecord
    implements Built<MatchesRecord, MatchesRecordBuilder> {
  static Serializer<MatchesRecord> get serializer => _$matchesRecordSerializer;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  bool? get connected;

  @BuiltValueField(wireName: 'primary_user_ref')
  DocumentReference? get primaryUserRef;

  @BuiltValueField(wireName: 'secondary_user_ref')
  DocumentReference? get secondaryUserRef;

  bool? get matched;

  @BuiltValueField(wireName: 'primary_user_name')
  String? get primaryUserName;

  @BuiltValueField(wireName: 'secondary_user_name')
  String? get secondaryUserName;

  @BuiltValueField(wireName: 'prinary_user_image')
  String? get prinaryUserImage;

  @BuiltValueField(wireName: 'secondary_user_image')
  String? get secondaryUserImage;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MatchesRecordBuilder builder) => builder
    ..connected = false
    ..matched = false
    ..primaryUserName = ''
    ..secondaryUserName = ''
    ..prinaryUserImage = ''
    ..secondaryUserImage = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('matches');

  static Stream<MatchesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MatchesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MatchesRecord._();
  factory MatchesRecord([void Function(MatchesRecordBuilder) updates]) =
      _$MatchesRecord;

  static MatchesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMatchesRecordData({
  DateTime? createdAt,
  bool? connected,
  DocumentReference? primaryUserRef,
  DocumentReference? secondaryUserRef,
  bool? matched,
  String? primaryUserName,
  String? secondaryUserName,
  String? prinaryUserImage,
  String? secondaryUserImage,
}) {
  final firestoreData = serializers.toFirestore(
    MatchesRecord.serializer,
    MatchesRecord(
      (m) => m
        ..createdAt = createdAt
        ..connected = connected
        ..primaryUserRef = primaryUserRef
        ..secondaryUserRef = secondaryUserRef
        ..matched = matched
        ..primaryUserName = primaryUserName
        ..secondaryUserName = secondaryUserName
        ..prinaryUserImage = prinaryUserImage
        ..secondaryUserImage = secondaryUserImage,
    ),
  );

  return firestoreData;
}
