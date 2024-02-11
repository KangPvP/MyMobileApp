class Users {
  final double id;
  final double phoneNumber;
  final bool connexion;
  final String ?email;
  final String ?country;
  final String language; // (from Device)
  final String ?homeLocation; // (after analyse)
  final String createdAt;
  // numéro de téléphone
  // nom prénom (from contact)
  // list Contact
  // nombre de km parcours ce mois ci

  // Relevé les informations à stocker en local et celle à envoyer au serveur
  // pour le moment les informations seront dupliqué des deux côté

  Users({
    required this.id,
    required this.phoneNumber,
    this.email,
    required this.connexion,
    this.country,
    required this.language,
    this.homeLocation,
    required this.createdAt
  });

  factory Users.fromSQfliteDatabase(Map<String, dynamic> map) => Users(
    id: map['id']?.toInt() ?? 0,
    phoneNumber: map['phonenumber'],
    email: map['email'],
    connexion: map['connexion'],
    country: map['connexion'],
    language: map['language'] ?? 'English',
    homeLocation: map['homelocation'],
    createdAt: DateTime.fromMicrosecondsSinceEpoch(map['created_at']).toIso8601String(),
  
  );

}