final String tableEventsPerUser = 'EventsPerUser';

// Name of the columns in the table
class EventsPerUserFields
{
  static final List<String> values = [
    // Add all fields
    userID, eventID
  ];

  static final String userID = 'UserID';
  static final String eventID = 'EventID';
}

class EventsPerUser
{
  final int? userID;
  final int? eventID;

  const EventsPerUser({
    this.userID,
    this.eventID,
  });

  Map<String, Object?> toJson() => {
    EventsPerUserFields.userID: userID,
    EventsPerUserFields.eventID: eventID,
  };

  static EventsPerUser fromJson(Map<String, Object?> json) => EventsPerUser(
    userID: json[EventsPerUserFields.userID] as int?,
    eventID: json[EventsPerUserFields.eventID] as int?,
  );

  EventsPerUser copy({
    int? id,
    String? name,
    DateTime? dateStart,
    DateTime? dateFinish,
    String? location,
    String? QRCode,
  }) =>
      EventsPerUser(
        userID: userID ?? this.userID,
        eventID: eventID ?? this.eventID,
      );
}