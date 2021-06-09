import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'stations_record.g.dart';

abstract class StationsRecord
    implements Built<StationsRecord, StationsRecordBuilder> {
  static Serializer<StationsRecord> get serializer =>
      _$stationsRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(StationsRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stations');

  static Stream<StationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  StationsRecord._();
  factory StationsRecord([void Function(StationsRecordBuilder) updates]) =
      _$StationsRecord;
}

Map<String, dynamic> createStationsRecordData({
  String name,
}) =>
    serializers.serializeWith(
        StationsRecord.serializer, StationsRecord((s) => s..name = name));

StationsRecord get dummyStationsRecord {
  final builder = StationsRecordBuilder()..name = dummyString;
  return builder.build();
}

List<StationsRecord> createDummyStationsRecord({int count}) =>
    List.generate(count, (_) => dummyStationsRecord);
