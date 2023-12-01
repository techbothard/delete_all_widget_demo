import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthentication {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//todo:create account using email and password
  Future<void> emailSignUp(String email, String password) async {
    try {
      final creadencial = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(creadencial.user?.uid);
    } catch (e) {}
  }

//todo:login account using email and password
  Future<void> emailSigIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {}
  }

  // todo: some opperation on user(FirebaseAuth.instance.currentUser)
  /*
 //for update user profile
  await user?.updateDisplayName("Jane Q. User");
  await user?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");

  //for update email
       await user?.updateEmail("janeq@example.com");
  // for verified email
       await user?.sendEmailVerification();
  //for update password
       await user?.updatePassword(newPassword);
  //for send reset password email
       await FirebaseAuth.instance
        .sendPasswordResetEmail(email: "user@example.com");
   //for delete user account
       await user?.delete();
    //re-authentication
            Prompt the user to re-provide their sign-in credentials.
            Then, use the credentials to reauthenticate:
        await user?.reauthenticateWithCredential(credential);



  */
  //todo:anomanas create account
  Future<void> annonmounce() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
    } catch (e) {}
  }

  // todo: google sign in
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final creadencial =
        await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //todo:facebook login
  Future<UserCredential> signInWithFacebook() async {
    // flutter_facebook_auth:  dependency add

    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  // todo: phone authentication
  String otpid = "";
  // login phone
  Future<void> loginPhone(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+44$phone',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        otpid = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        otpid = verificationId;
      },
    );
  }

  // verified phone number
  Future<void> verifiedPhone(String otp) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: otpid, smsCode: otp);
    final user = await firebaseAuth.signInWithCredential(credential);
    if (user != null) {
      print("user are login successfully");
    } else {
      print("not login user");
    }
  }
}
