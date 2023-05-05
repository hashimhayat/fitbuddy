import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'waitlist_record.g.dart';

abstract class WaitlistRecord
    implements Built<WaitlistRecord, WaitlistRecordBuilder> {
  static Serializer<WaitlistRecord> get serializer =>
      _$waitlistRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'joined_on')
  DateTime? get joinedOn;

  String? get type;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(WaitlistRecordBuilder builder) => builder
    ..email = ''
    ..type = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('waitlist');

  static Stream<WaitlistRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<WaitlistRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  WaitlistRecord._();
  factory WaitlistRecord([void Function(WaitlistRecordBuilder) updates]) =
      _$WaitlistRecord;

  static WaitlistRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createWaitlistRecordData({
  String? email,
  DateTime? joinedOn,
  String? type,
}) {
  final firestoreData = serializers.toFirestore(
    WaitlistRecord.serializer,
    WaitlistRecord(
      (w) => w
        ..email = email
        ..joinedOn = joinedOn
        ..type = type,
    ),
  );

  return firestoreData;
}
