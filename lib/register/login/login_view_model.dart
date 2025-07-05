import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list22/base.dart';
import 'package:todo_list22/register/login/login_connector.dart';

class LoginViewModel extends BaseViewModel<LoginConnector>{

  signIn ({required String email,
    required String password,
  })async{

    try {
      connector!.showLoading();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(credential.user!.emailVerified==true){
        connector!.hide();
        connector!.goToHome();
        // onSucess();
      }
      else{
        connector!.showError("Please check your email and verify ");
        connector!.hide();
      }

    } on FirebaseAuthException catch (e) {
      connector!.showError(e.toString());
      connector!.hide();
    }
  }

}