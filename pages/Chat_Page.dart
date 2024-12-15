import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/custom_chat_bubble.dart';

class ChatPage extends StatefulWidget {
  static const String id = 'ChatPage';

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _listController = ScrollController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  String? userEmail;
  String? email;
  String? userName;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    userEmail = args['userEmail'];
    email = args['_email'];
    userName = args['userName'];

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreateAdt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryColor,
              centerTitle: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5, left: 70),
                    child: Image.asset(
                      kLogoPath,
                      width: 55,
                      height: 55,
                    ),
                  ),
                  Text(
                    userName!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.phone,
                    size: 35,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // _makeVoiceCall();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.videocam,
                      size: 35,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // _makeVideoCall();
                    },
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      reverse: true,
                      controller: _listController,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email &&
                                messagesList[index].userid == userEmail
                            ? ChatBubble(
                                message: messagesList[index], isMe: true)
                            : messagesList[index].id == userEmail &&
                                    messagesList[index].userid == email
                                ? ChatBubble(
                                    message: messagesList[index], isMe: false)
                                : SizedBox();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          maxLength: null,
                          maxLines: null,
                          controller: _textController,
                          decoration: InputDecoration(
                            hintText: 'Type your message...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kPrimaryColor, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.send,
                          size: 35,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {
                          final String message = _textController.text;
                          messages.add({
                            kMessage: message,
                            kCreateAdt: DateTime.now(),
                            Kid: email,
                            Kuser: userEmail
                          });
                          _textController.clear();
                          _scrollDown();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.attach_file,
                            size: 35, color: kPrimaryColor),
                        onPressed: () {
                          // _getImage();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _scrollDown() {
    _listController.animateTo(
      _listController.position.minScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
