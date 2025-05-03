import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreenState {
  UsersScreenState();

  factory UsersScreenState.uninitialized() {
    return UsersScreenState();
  }
}

abstract class UsersScreenEvent {}

class UsersScreenBloc extends Bloc<UsersScreenEvent, UsersScreenState> {
  UsersScreenBloc() : super(UsersScreenState.uninitialized());
}
