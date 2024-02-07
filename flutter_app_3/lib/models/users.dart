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
}