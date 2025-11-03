class ConnectedAccount {
  final String id;
  final String email;
  final String displayName;

  ConnectedAccount({required this.id, required this.email, required this.displayName});

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'displayName': displayName,
  };

  factory ConnectedAccount.fromJson(Map<String, dynamic> json) => ConnectedAccount(
    id: json['id'] as String,
    email: json['email'] as String,
    displayName: json['displayName'] as String,
  );
}
