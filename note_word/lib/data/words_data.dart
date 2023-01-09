import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class Words extends HiveObject{
  @HiveField(0)
  String word;

  @HiveField(1)
  String meaning;

  @HiveField(2)
  String? Example;

  @HiveField(3)
  int WordsKey;

  Words({required this.word , required this.meaning, required this.WordsKey, this.Example});

}