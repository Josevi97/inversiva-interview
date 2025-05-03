import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;

  final String email;

  final String role;

  final bool isExpanded;

  final Function() onUpdate;

  final Function() onDelete;

  final Function() onViewMore;

  const UserCard({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.isExpanded,
    required this.onUpdate,
    required this.onDelete,
    required this.onViewMore,
  });

  Widget _buildLabel(String label) {
    return Text(label, overflow: TextOverflow.ellipsis);
  }

  Widget _buildAction(IconData icon, Function() action) {
    return GestureDetector(onTap: action, child: Icon(icon));
  }

  Widget _buildRow(String key, Widget child) {
    return Row(
      spacing: 10,
      children: [
        SizedBox(width: 60, child: Text(key, overflow: TextOverflow.ellipsis)),
        SizedBox(width: 20),
        child,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          GestureDetector(onTap: onViewMore, child: Icon(Icons.chevron_left)),
          Expanded(
            child: AnimatedSize(
              duration: const Duration(milliseconds: 200),
              child: Column(
                spacing: 10,
                children: [
                  _buildRow("Nombre", _buildLabel(name)),
                  if (isExpanded) ...[
                    _buildRow("Email", _buildLabel(email)),
                    _buildRow("Rol", _buildLabel(role)),
                    _buildRow(
                      "Acciones",
                      Row(children: [_buildAction(Icons.delete, onDelete)]),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
