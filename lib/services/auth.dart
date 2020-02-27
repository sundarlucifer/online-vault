import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<FirebaseUser> googleSignIn() async {

    GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleAccount.authentication;

    AuthCredential authCredential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    print('Got auth credentials, attempting firebase auth');
    FirebaseUser user = (await _auth.signInWithCredential(authCredential)).user;

    print('Signed in as ${user.displayName}');
    return user;
  }

}

final AuthService authService = new AuthService();