final String tableUsers = 'users';

// Name of the columns in the table
class UserFields
{
  static final List<String> values = [
    // Add all fields
    id, location, username, password, passwordSalt, passwordHashAlgorithm,
    firstName, lastName, email, phoneNumber
  ];

  static final String id = 'ID';
  static final String location = 'Location';
  static final String username = 'Username';
  static final String password = 'Password';
  static final String passwordSalt = 'PasswordSalt';
  static final String passwordHashAlgorithm = 'PasswordHashAlgorithm';
  static final String firstName = 'FirstName';
  static final String lastName = 'LastName';
  static final String email = 'Email';
  static final String phoneNumber = 'PhoneNumber';
}

class User
{
  final int? id;
  final String location;
  final String username;
  final String password;
  final String passwordSalt;
  final String passwordHashAlgorithm;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  const User({
    this.id,
    required this.location,
    required this.username,
    required this.password,
    required this.passwordSalt,
    required this.passwordHashAlgorithm,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, Object?> toJson() => {
    UserFields.id: id,
    UserFields.location: location,
    UserFields.username: username,
    UserFields.password: password,
    UserFields.passwordSalt: passwordSalt,
    UserFields.passwordHashAlgorithm: passwordHashAlgorithm,
    UserFields.firstName: firstName,
    UserFields.lastName: lastName,
    UserFields.email: email,
    UserFields.phoneNumber: phoneNumber,
    //UserFields.boolean: boolean ? 1 : 0,
    //UserFields.dateTime createdTime.toIso8601String();
  };

  static User fromJson(Map<String, Object?> json) => User(
    id: json[UserFields.id] as int?,
    location: json[UserFields.location] as String,
    username: json[UserFields.username] as String,
    password: json[UserFields.password] as String,
    passwordSalt: json[UserFields.passwordSalt] as String,
    passwordHashAlgorithm: json[UserFields.passwordHashAlgorithm] as String,
    firstName: json[UserFields.firstName] as String,
    lastName: json[UserFields.lastName] as String,
    email: json[UserFields.email] as String,
    phoneNumber: json[UserFields.phoneNumber] as String,

    // createdTime: DateTime.parse(json[UserFields.dateTime] as String),
    // boolean: json[UserFields.boolean] == 1,
  );

  User copy({
    int? id,
    String? location,
    String? username,
    String? password,
    String? passwordSalt,
    String? passwordHashAlgorithm,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
  }) =>
      User(
        id: id ?? this.id,
        location: location ?? this.location,
        username: username ?? this.username,
        password: password ?? this.password,
        passwordSalt: passwordSalt ?? this.passwordSalt,
        passwordHashAlgorithm: passwordHashAlgorithm ?? this.passwordHashAlgorithm,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
  );
}