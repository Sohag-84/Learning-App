import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign in/bloc/signin_bloc.dart';
import 'welcome/blocs/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBlocs()),
        BlocProvider(create: (context) => SignInBloc()),
      ];
}
