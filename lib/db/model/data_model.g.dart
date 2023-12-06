// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class moneymodelAdapter extends TypeAdapter<moneymodel> {
  @override
  final int typeId = 0;

  @override
  moneymodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return moneymodel(
      type: fields[0] as String,
      amount: fields[1] as String,
      description: fields[2] as String,
      time: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, moneymodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.amount)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is moneymodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
