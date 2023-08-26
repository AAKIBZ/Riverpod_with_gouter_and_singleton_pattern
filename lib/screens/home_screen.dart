import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/provider/home_provider.dart';
import 'package:riverpod_example/service/service.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    HttpService.instance.init(context);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.watch(homeProvider).getAllPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final processing = ref.watch(homeProvider).processing;
    List data = ref.watch(homeProvider).data;

    return Scaffold(
      appBar: AppBar(
        title: const Text('riverPod'),
      ),
      body: SafeArea(
        child: processing
            ? const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Center(
                    child: LinearProgressIndicator(
                  minHeight: 2,
                  color: Colors.blueGrey,
                )),
              )
            : ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.black26)),
                      child: GestureDetector(
                          onTap: () {
                            context.push('/body',
                                extra: {'body': data[index]['body']});
                          },
                          child: Text(data[index]['title'])));
                }),
      ),
    );
  }
}
