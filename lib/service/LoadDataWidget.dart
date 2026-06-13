import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/LoadingView.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadDataWidget<T> extends ConsumerWidget {
  final Future<List<T>> Function() loader;
  final Widget Function(List<T> data) builder;

  const LoadDataWidget({
    super.key,
    required this.loader,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<T>>(
      future: loader(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingView();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        return builder(snapshot.data ?? []);
      },
    );
  }
}
