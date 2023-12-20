// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class notemodelAdapter extends TypeAdapter<notemodel> {
  @override
  final int typeId = 1;

  @override
  notemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return notemodel(
      title: fields[1] as String,
      date: fields[2],
      description: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, notemodel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is notemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
