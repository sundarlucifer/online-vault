import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Firestore _db = Firestore.instance;

  void _updateUserData(FirebaseUser user){
    _db.collection('users').document(user.uid).setData({
      'uid' : user.uid,
      'displayName' : user.displayName,
      'email' : user.email,
      'phoneNumber' : user.phoneNumber,
      'photoUrl' : user.photoUrl,
    }, merge: true);
  }

  Future<FirebaseUser> googleSignIn() async {
    GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleAccount.authentication;

    AuthCredential authCredential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    FirebaseUser user = (await _auth.signInWithCredential(authCredential)).user;

    print('Signed in as ${user.displayName}');
    _updateUserData(user);
    return user;
  }

  Future<FirebaseUser> getUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  signOut() {
    _googleSignIn.signOut();
    _auth.signOut();
  }

}

final AuthService authService = new AuthService();