import 'package:flutter/material.dart';

class Switchfilter extends StatelessWidget {
  const Switchfilter({
    super.key,
    required this.onChanged,
    required this.state,
    required this.subtitle,
    required this.title,
  });

  final bool state;
  final Function(bool) onChanged;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: state,

      onChanged: onChanged,

      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),

      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),

      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
