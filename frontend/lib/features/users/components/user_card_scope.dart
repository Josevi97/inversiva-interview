import 'package:flutter/material.dart';
import 'package:frontend/features/users/user.dart';

class UserCardScopeDelegate {
  final Function(BuildContext context, User user) onUpdate;

  final Function(BuildContext context, User user) onDelete;

  UserCardScopeDelegate({required this.onUpdate, required this.onDelete});
}

class UserCardScope extends InheritedWidget {
  final UserCardScopeDelegate delegate;

  const UserCardScope({
    super.key,
    required this.delegate,
    required super.child,
  });

  static UserCardScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserCardScope>();
  }

  @override
  bool updateShouldNotify(UserCardScope oldWidget) {
    return delegate != oldWidget.delegate;
  }
}
