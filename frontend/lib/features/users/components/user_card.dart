import 'package:flutter/material.dart';
import 'package:frontend/features/users/components/user_card_scope.dart';
import 'package:frontend/features/users/user.dart';
import 'package:frontend/ui/user_card.dart' as ui;

class UserCard extends StatefulWidget {
  final User user;

  const UserCard({super.key, required this.user});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  late final ValueNotifier<bool> _isExpanded;

  @override
  void initState() {
    _isExpanded = ValueNotifier(false);

    super.initState();
  }

  @override
  void dispose() {
    _isExpanded.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scope = UserCardScope.of(context);

    return ValueListenableBuilder<bool>(
      valueListenable: _isExpanded,
      builder: (context, isExpanded, child) {
        return ui.UserCard(
          name: widget.user.name,
          email: widget.user.email,
          role: widget.user.role.getLabel,
          isExpanded: isExpanded,
          onUpdate: () => scope?.delegate.onUpdate(context, widget.user),
          onDelete: () => scope?.delegate.onDelete(context, widget.user),
          onViewMore: () {
            _isExpanded.value = !isExpanded;
          },
        );
      },
    );
  }
}
