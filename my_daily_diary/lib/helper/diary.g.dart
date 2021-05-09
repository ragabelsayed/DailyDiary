// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/diary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiaryAdapter extends TypeAdapter<Diary> {
  @override
  final int typeId = 0;

  @override
  Diary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Diary(
      id: fields[0] as String,
      name: fields[1] as String,
      image: fields[2] != null ? File(fields[2]) : null,
      customColor: Color(fields[3]),
      chapters: (fields[4] as HiveList).castHiveList(),
      onClickDiary: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Diary obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image?.path)
      ..writeByte(3)
      ..write(obj.customColor.value)
      ..writeByte(4)
      ..write(obj.chapters)
      ..writeByte(5)
      ..write(obj.onClickDiary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
