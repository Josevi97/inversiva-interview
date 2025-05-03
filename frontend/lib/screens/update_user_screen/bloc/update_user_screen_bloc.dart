import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/users/dtos/update_user_dto.dart';
import 'package:frontend/features/users/user.dart';

class UpdateUserScreenState {
  final String? name;

  final String? email;

  final UserRole? role;

  UpdateUserScreenState({this.name, this.email, this.role});

  factory UpdateUserScreenState.uninitialized(User user) {
    return UpdateUserScreenState(
      email: user.email,
      name: user.name,
      role: user.role,
    );
  }

  UpdateUserScreenState copyWith({
    String? name,
    String? email,
    UserRole? role,
  }) {
    return UpdateUserScreenState(
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }
}

class UpdateUserScreenCubit extends Cubit<UpdateUserScreenState> {
  UpdateUserScreenCubit({required User user})
    : super(UpdateUserScreenState.uninitialized(user));

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

  UpdateUserDto updateDto() {
    return UpdateUserDto(
      name: state.name ?? "",
      email: state.email ?? "",
      role: state.role ?? UserRole.basic,
    );
  }
}
