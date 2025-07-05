import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class BaseConnector {
  void showLoading();
  void showError(String message);
  void hide();
}

class BaseViewModel<C extends BaseConnector> extends ChangeNotifier {
  C? connector;
}

 abstract class BaseView<VM extends BaseViewModel, S extends StatefulWidget>
    extends State<S>
    implements BaseConnector {
  late VM viewModel;

  VM initMyViewModel();

  @override
  void initState() {
    super.initState();
    viewModel=initMyViewModel();
  }


  @override
  hide() {
    Navigator.pop(context);
  }

  @override
  showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("error".tr()),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("back".tr()),
            ),
          ],
        );
      },
    );
  }

  @override
  showLoading() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
