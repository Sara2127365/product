abstract class StateAuth {}

class InitalStateSignUp extends StateAuth {}

class UploadingStateSignUp extends StateAuth {}

class SuccessStateSignUp extends StateAuth {
  final String message;

  SuccessStateSignUp({required this.message});
}

class FailStateSignUp extends StateAuth {
  final String message;

  FailStateSignUp({required this.message});
}

class InitalStateLogin extends StateAuth {}

class UploadingStateLogin extends StateAuth {}

class SuccessStateLogin extends StateAuth {
  final String message;

  SuccessStateLogin({required this.message});

}

class FailStateLogin extends StateAuth {
  final String message;

  FailStateLogin({required this.message});
}
