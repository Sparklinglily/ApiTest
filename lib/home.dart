import 'package:apitest/apiConfig.dart';
import 'package:apitest/models/album.dart';
import 'package:apitest/models/photo.dart';
import 'package:apitest/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<UserModel>? userModel = [];

  void initState() {
    fetchData();

    super.initState();
  }

  void fetchData() async {
    userModel = await ApiConfig().getUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: userModel == null || userModel!.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Flexible(
                  fit: FlexFit.loose,
                  child: ListView.builder(
                      itemCount: userModel!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(userModel![index].id.toString()),
                                    Text(userModel![index].name),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(userModel![index].email),
                                        Text(userModel![index].website),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                        );
                      }),
                ),
              ));
  }
}
