import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:travel_friends/pages/home_page.dart';
import 'package:travel_friends/pages/login_page.dart';
import 'package:travel_friends/widgets/controller.dart';

class AuthService {
  final userCollection = FirebaseFirestore.instance.collection('users');
  final _auth = FirebaseAuth.instance;

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      if (name.trim().isEmpty || name.trim().length < 3) {
        Get.snackbar(
            'Hata', 'Lütfen En Az 3 Karakterden Oluşan Bir İsim Giriniz');
      } else {
        if (password == confirmPassword) {
          final UserCredential userCredential =
              await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          if (userCredential.user != null) {
            // FirebaseAuth'tan UID'yi alın
            String uid = userCredential.user!.uid;

            // Firestore'a kullanıcıyı kaydedin
            await _registerUser(
                uid: uid, email: email, name: name, password: password);
            Get.snackbar(
                'Kayıt Başarılı', 'Giriş Sayfasına Yönlendiriliyorsunuz');
            Get.to(() => const Login());
          }
        } else {
          Get.snackbar('Kayıt Başarısız', '');
          MyTextField.tConfirmpassword.clear();
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
            'Zayıf Şİfre', 'Şifreniz En Az 6 Karakterden Oluşmalıdır.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Hata', 'Bu email zaten kullanılmakta');
      } else if (e.code == 'invalid-email') {
        Get.snackbar('Geçersiz Email', 'Lütfen Geçerli Bir Email Giriniz.');
      } else {
        Get.snackbar('Hata', '${e.message}');
      }
    }

    MyTextField.tEmail.clear();
    MyTextField.tName.clear();
    MyTextField.tPassword.clear();
    MyTextField.tConfirmpassword.clear();
  }

  // giriş //

  Future<void> login({required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Kullanıcıyı Firebase Authentication ile giriş yaptıktan sonra,
        // Firestore'da kullanıcıyı kontrol ediyoruz
        DocumentSnapshot<Map<String, dynamic>> userDoc =
            await userCollection.doc(userCredential.user!.uid).get();

        if (userDoc.exists) {
          Get.snackbar('Giriş Başarılı', 'Anasayfaya Yönlendiriliyorsunuz',
              duration: const Duration(seconds: 1));

          Future.delayed(const Duration(seconds: 2), () {
            Get.to(() => const MyHomePage());
          });
        } else {
          Get.snackbar('Giriş Başarısız', 'Kullanıcı Bulunamadı');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        // Kullanıcı adı veya şifre yanlış
        Get.snackbar('Giriş Başarısız', 'Email veya Şifre Hatalı');
      } else if (e.code == 'invalid-email') {
        Get.snackbar('Geçersiz Email', 'Lütfen Geçerli bir Email giriniz');
      } else if (e.code == 'channel-error') {
        Get.snackbar('Giriş Başarısız', 'Lütfen Tüm Alanları Doldurunuz');
      } else {
        Get.snackbar('Hata', '$e');
      }
    }
  }

  Future<void> _registerUser({
    required String uid,
    required String name,
    required String email,
    required String password,
  }) async {
    await userCollection.doc(uid).set({
      "email": email,
      "name": name,
      "password": password,
    });
  }
}
