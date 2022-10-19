import 'package:smiley_app/models/task_inprogress.dart';

import 'package:flutter/material.dart';

class TaskInprogressFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TaskInprogress taskInprogress;

  TaskInprogressFormProvider(this.taskInprogress);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
