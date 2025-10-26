// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elements.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ElementsAdapter extends TypeAdapter<Elements> {
  @override
  final int typeId = 0;

  @override
  Elements read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Elements(
      title: fields[0] as String,
      sub: fields[1] as String,
      assigned: fields[2] as String,
      dateTimeTo: fields[4] as DateTime?,
      dateTimeFrom: fields[3] as DateTime,
      state: fields[5] as String,
      name: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Elements obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.sub)
      ..writeByte(2)
      ..write(obj.assigned)
      ..writeByte(3)
      ..write(obj.dateTimeFrom)
      ..writeByte(4)
      ..write(obj.dateTimeTo)
      ..writeByte(5)
      ..write(obj.state)
      ..writeByte(6)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ElementsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
