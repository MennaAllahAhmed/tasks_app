import 'package:hive/hive.dart';

part 'elements.g.dart';

@HiveType(typeId: 0)
class Elements {
  @HiveField(0)
  String title;
  @HiveField(1)
  String sub;
  @HiveField(2)
  String assigned;
  @HiveField(3)
  DateTime dateTimeFrom;
  @HiveField(4)
  DateTime? dateTimeTo;
  @HiveField(5)
  String state;
  @HiveField(6)
  String name;
  Elements({
    required this.title,
    required this.sub,
    required this.assigned,
    required this.dateTimeFrom, required this.state, // ignore: always_put_required_named_parameters_first
    required this.name, this.dateTimeTo
  });
}
