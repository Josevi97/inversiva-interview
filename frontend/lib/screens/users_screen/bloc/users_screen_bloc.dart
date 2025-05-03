import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/users/dtos/create_user_dto.dart';
import 'package:frontend/features/users/dtos/update_user_dto.dart';
import 'package:frontend/features/users/user.dart';
import 'package:frontend/features/users/users_repository.dart';

class UsersScreenState {
  final List<User> users;

  final bool isLoaded;

  UsersScreenState({required this.users, required this.isLoaded});

  factory UsersScreenState.uninitialized() {
    return UsersScreenState(users: const [], isLoaded: false);
  }

  UsersScreenState copyWith({List<User>? users, bool? isLoaded}) {
    return UsersScreenState(
      users: users ?? this.users,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}

abstract class UsersScreenEvent {}

class UsersScreenFetch extends UsersScreenEvent {}

class UsersScreenCreate extends UsersScreenEvent {
  final CreateUserDto userDto;

  UsersScreenCreate({required this.userDto});
}

class UsersScreenUpdate extends UsersScreenEvent {
  final String id;
  final UpdateUserDto userDto;

  UsersScreenUpdate({required this.id, required this.userDto});
}

class UsersScreenDelete extends UsersScreenEvent {
  final String id;

  UsersScreenDelete({required this.id});
}

class UsersScreenBloc extends Bloc<UsersScreenEvent, UsersScreenState> {
  final UsersRepository _repository;

  UsersScreenBloc({UsersRepository? repository})
    : _repository = repository ?? UsersRepository(),
      super(UsersScreenState.uninitialized()) {
    on<UsersScreenFetch>(_mapFetchToState);
    on<UsersScreenCreate>(_mapCreateToState);
    on<UsersScreenUpdate>(_mapUpdateToState);
    on<UsersScreenDelete>(_mapDeleteToState);
  }

  Future<void> _mapFetchToState(
    UsersScreenFetch event,
    Emitter<UsersScreenState> emit,
  ) async {
    final users = await _repository.getUsers();
    emit(state.copyWith(users: users, isLoaded: true));
  }

  Future<void> _mapCreateToState(
    UsersScreenCreate event,
    Emitter<UsersScreenState> emit,
  ) async {
    final user = await _repository.createUser(event.userDto);
    if (user != null) {
      final users = await _repository.getUsers();
      emit(state.copyWith(users: users, isLoaded: true));
    }
  }

  Future<void> _mapUpdateToState(
    UsersScreenUpdate event,
    Emitter<UsersScreenState> emit,
  ) async {
    final user = await _repository.updateUser(event.id, event.userDto);
    if (user != null) {
      final users = await _repository.getUsers();
      emit(state.copyWith(users: users, isLoaded: true));
    }
  }

  Future<void> _mapDeleteToState(
    UsersScreenDelete event,
    Emitter<UsersScreenState> emit,
  ) async {
    final isDeleted = await _repository.deleteUser(event.id);
    if (isDeleted) {
      final users = await _repository.getUsers();
      emit(state.copyWith(users: users, isLoaded: true));
    }
  }
}
