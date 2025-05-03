import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/users/dtos/create_user_dto.dart';
import 'package:frontend/features/users/user.dart';

class CreateUserScreenState {
  final String? name;

  final String? email;

  final UserRole? role;

  CreateUserScreenState({this.name, this.email, this.role});

  factory CreateUserScreenState.uninitialized() {
    return CreateUserScreenState();
  }

  CreateUserScreenState copyWith({
    String? name,
    String? email,
    UserRole? role,
  }) {
    return CreateUserScreenState(
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }
}

class CreateUserScreenCubit extends Cubit<CreateUserScreenState> {
  CreateUserScreenCubit() : super(CreateUserScreenState.uninitialized());

  void update({String? name, String? email, UserRole? role}) {
    if (name != null) {
      emit(state.copyWith(name: name));
    }

    if (email != null) {
      emit(state.copyWith(email: email));
    }

    if (role != null) {
      emit(state.copyWith(role: role));
    }
  }

  CreateUserDto create() {
    return CreateUserDto(
      name: state.name ?? "",
      email: state.email ?? "",
      role: state.role ?? UserRole.basic,
    );
  }
}
