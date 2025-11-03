class AppConstants {
  static const String appName = 'AI Email Sorter';
  static const String appDescription = 'Intelligent email categorization and management';
  
  // OAuth scopes for Gmail API
  static const List<String> gmailScopes = [
    'https://www.googleapis.com/auth/gmail.readonly',
    'https://www.googleapis.com/auth/gmail.modify',
    'https://www.googleapis.com/auth/gmail.labels',
  ];
  
  // Client configuration for OAuth
  // TODO: Replace with actual client ID and secret
  static const String clientId = 'YOUR_CLIENT_ID';
  static const String clientSecret = 'YOUR_CLIENT_SECRET';
}