import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/gmail/v1.dart';
import 'package:http/http.dart' as http;
import 'package:ai_email_sorter/core/constants.dart';

final authServiceProvider = Provider((ref) => AuthService());

/// A small HTTP client that injects Authorization headers. Used to create
/// an authenticated `GmailApi` instance from an access token.
class _AuthenticatedHttpClient extends http.BaseClient {
  final String accessToken;
  final http.Client _inner = http.Client();

  _AuthenticatedHttpClient(this.accessToken);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Authorization'] = 'Bearer $accessToken';
    return _inner.send(request);
  }
}

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: AppConstants.gmailScopes,
  );

  GoogleSignInAccount? _current;

  /// Sign in with Google and return the signed-in account.
  Future<GoogleSignInAccount?> signIn() async {
    try {
      final account = await _googleSignIn.signIn();
      _current = account;
      return account;
    } catch (e) {
      // Leave error handling to caller/UI
      rethrow;
    }
  }

  /// Sign out the current Google account.
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    _current = null;
  }

  /// Returns true if a user is already signed in.
  Future<bool> isSignedIn() => _googleSignIn.isSignedIn();

  /// Get an authenticated GmailApi for the currently signed-in account.
  /// Returns null if no account is signed in or no access token is available.
  Future<GmailApi?> getGmailApi() async {
    final account = _current ?? _googleSignIn.currentUser;
    if (account == null) return null;
    final auth = await account.authentication;
    final accessToken = auth.accessToken;
    if (accessToken == null) return null;
    final client = _AuthenticatedHttpClient(accessToken);
    return GmailApi(client);
  }
}