abstract class RegisterEvents{
  const RegisterEvents();///default constructor
}

class UserNameEvent extends RegisterEvents{
  final String userName;
  UserNameEvent({required this.userName});
}

class EmailEvent extends RegisterEvents{
  final String email;
  EmailEvent({required this.email});
}

class PasswordEvent extends RegisterEvents{
  final String password;
  PasswordEvent({required this.password});
}
class RePasswordEvent extends RegisterEvents{
  final String rePassword;
  RePasswordEvent({required this.rePassword});
}