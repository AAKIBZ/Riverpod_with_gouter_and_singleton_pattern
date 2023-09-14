import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/body_provider.dart';

class BodyClass extends ConsumerStatefulWidget {
  const BodyClass({super.key, required this.body});

  final dynamic body;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BodyClassState();
}

class _BodyClassState extends ConsumerState<BodyClass> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var data = ref.watch(bodyProvider.select((value) => value.data));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Body Screen'),
      ),
      body:  Padding(padding: const EdgeInsets.all(16.0),
      child: Text('Passed Data is : \n ${widget.body['body']}')),
    );
  }
}
