 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubis/login_cubit/login_cubit.dart';
import '../model/message.dart';
import '../widgets/chatbubble.dart';

// ignore: must_be_immutable
class ChataPage extends StatelessWidget {
  CollectionReference message =
      FirebaseFirestore.instance.collection("message");
  static String id = "ChatPage";
  final controller = ScrollController();
  final _controller = TextEditingController();
  ChataPage({super.key});

  @override
  Widget build(BuildContext context) {
    var email = BlocProvider.of<LoginCubit>(context).email_;
    return StreamBuilder<QuerySnapshot>(
        stream: message.orderBy("createdTime", descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/scholar.png",
                      height: 40,
                    ),
                    const Text("Chat "),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email
                            ? Chatbubble(
                                message: messagesList[index],
                              )
                            : ChatbubbleForFriends(
                                message: messagesList[index],
                              );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (data) {
                        message.add(
                          {
                            "message": data,
                            "createdTime": DateTime.now(),
                            "id": email
                          },
                        );
                        _controller.clear();
                        controller.animateTo(
                          0,
                          duration: const Duration(microseconds: 100),
                          curve: Curves.easeIn,
                        );
                      },
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.send),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: const Color.fromARGB(
                  0,
                  228,
                  225,
                  225,
                ).withOpacity(0.4),
              ),
            );
          }
        });
  }
}
