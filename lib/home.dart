import 'package:apitest/apiConfig.dart';
import 'package:apitest/models/album.dart';
import 'package:apitest/models/photo.dart';
import 'package:apitest/models/posts.dart';
import 'package:apitest/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Posts>? postModel = [];

  void initState() {
    fetchData();

    super.initState();
  }

  void fetchData() async {
    postModel = await getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: postModel == null || postModel!.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: postModel!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(

                            /// mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  //  mainAxisAlignment:
                                  // MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(postModel![index].id.toString()),
                                    Text(postModel![index].title),
                                    Expanded(
                                      child: Row(
                                        // mainAxisAlignment:
                                        // MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            postModel![index].userId.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(postModel![index].body),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ]),
                      );
                    }),
              ));
  }
}
