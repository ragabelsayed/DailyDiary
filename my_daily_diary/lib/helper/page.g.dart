// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/page.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterPageAdapter extends TypeAdapter<ChapterPage> {
  @override
  final int typeId = 2;

  @override
  ChapterPage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterPage(
      id: fields[0] as String,
      name: fields[1] as String,
      date: fields[2] as DateTime,
      image: fields[3] != null ? File(fields[3]) : null,
      customColor: Color(fields[4]),
      writingArea: (fields[5] as List)
          .map((dynamic e) => (e as Map).cast<String, String>())
          .toList(),
      currenTextColor: Color(fields[6]),
      // textAlign: fields[7] as TextAlign,
      textAlign: TextAlign.values
          .firstWhere((textAlign) => textAlign.index == fields[7]),
      fontweight: fields[8] as bool,
      fontStyle: fields[9] as bool,
      fontName: fields[10] as String,
      isSelected1: (fields[11] as List).cast<bool>(),
      isSelected2: (fields[12] as List).cast<bool>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChapterPage obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.image?.path)
      ..writeByte(4)
      ..write(obj.customColor.value)
      ..writeByte(5)
      ..write(obj.writingArea)
      ..writeByte(6)
      ..write(obj.currenTextColor.value)
      ..writeByte(7)
      ..write(obj.textAlign.index)
      ..writeByte(8)
      ..write(obj.fontweight)
      ..writeByte(9)
      ..write(obj.fontStyle)
      ..writeByte(10)
      ..write(obj.fontName)
      ..writeByte(11)
      ..write(obj.isSelected1)
      ..writeByte(12)
      ..write(obj.isSelected2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterPageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
