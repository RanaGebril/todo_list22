import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list22/firebaseFunctions.dart';
import 'package:todo_list22/register/signup/signup_connector.dart';
import '../../base.dart';
import '../../models/user_model.dart';

class SignupViewModel extends BaseViewModel<SignupConnector>{

   createAccount(
      {required String email,
        required String password,
        // required Function onSucess,
        // required Function onError,
        required String firstName,
        required String lastName,
        required String phone,
      })async{
    try {
      connector!.showLoading();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await credential.user!.sendEmailVerification();

      UserModel user=UserModel(
        userId: credential.user!.uid,
        email: email ,
        firstName: firstName,
        lastName: lastName,
        phone: phone,

      );
      await Firebasefunctions.addUser(user);
      connector!.goToHome();

    } on FirebaseAuthException catch (e) {
      connector!.showError(e.toString()) ;
    } catch (e) {
      connector?.showError(e.toString());
    }
  }
}