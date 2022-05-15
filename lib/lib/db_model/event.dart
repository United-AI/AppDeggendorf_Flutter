final String tableEvents = 'events';

// Name of the columns in the table
class EventFields
{
  static final List<String> values = [
    // Add all fields
    id, name, dateStart, dateFinish, location, QRCode
  ];

  static final String id = 'ID';
  static final String name = 'Name';
  static final String dateStart = 'DateStart';
  static final String dateFinish = 'DateFinish';
  static final String location = 'Location';
  static final String QRCode= 'QRCode';
}

class Event
{
  final int? id;
  final String name;
  final DateTime dateStart;
  final DateTime dateFinish;
  final String location;
  final String? QRCode;

  const Event({
    this.id,
    required this.name,
    required this.dateStart,
    required this.dateFinish,
    required this.location,
    this.QRCode,
  });

  String getName(){
    return name;
  }

  Map<String, Object?> toJson() => {
    EventFields.id: id,
    EventFields.name: name,
    EventFields.dateStart: dateStart.toIso8601String(),
    EventFields.dateFinish: dateFinish.toIso8601String(),
    EventFields.location: location,
    EventFields.QRCode: QRCode,
  };

  static Event fromJson(Map<String, Object?> json) => Event(
    id: json[EventFields.id] as int?,
    name: json[EventFields.name] as String,
    dateStart: DateTime.parse(json[EventFields.dateStart] as String),
    dateFinish: DateTime.parse(json[EventFields.dateFinish] as String),
    location: json[EventFields.location] as String,
    QRCode: json[EventFields.QRCode] as String,
  );

  Event copy({
    int? id,
    String? name,
    DateTime? dateStart,
    DateTime? dateFinish,
    String? location,
    String? QRCode,
  }) =>
      Event(
        id: id ?? this.id,
        name: name ?? this.name,
        dateStart: dateStart ?? this.dateStart,
        dateFinish: dateFinish ?? this.dateFinish,
        location: location ?? this.location,
        QRCode: QRCode ?? this.QRCode,
      );
}