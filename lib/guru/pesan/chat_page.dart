import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:study/guru/pesan/pecakapan.dart';
import 'package:study/guru/pesan/user_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  static String routeName = 'ChatPage';

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // list chat user
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Nita Sarah", messageText: "Terimakasih!", time: "Now"),
    ChatUsers(
        name: "Glady's Murphy", messageText: "That's Great", time: "Yesterday"),
    ChatUsers(
        name: "Jorge Henry", messageText: "Hey where are you?", time: "31 Mar"),
    ChatUsers(
        name: "Philip Fox",
        messageText: "Busy! Call me in 20 mins",
        time: "28 Mar"),
    ChatUsers(
        name: "Debra Hawkins",
        messageText: "Thankyou, It's awesome",
        time: "23 Mar"),
    ChatUsers(
        name: "Jacob Pena",
        messageText: "will update you in evening",
        time: "17 Mar"),
    ChatUsers(
        name: "Andrey Jones",
        messageText: "Can you please share the file?",
        time: "24 Feb"),
    ChatUsers(name: "John Wick", messageText: "How are you?", time: "18 Feb"),
  ];

  // Function to refresh the chat list
  Future<void> _refreshChatList() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Update chat users list
    setState(() {
      chatUsers.add(ChatUsers(
          name: "New User", messageText: "New Message", time: "Just now"));
      chatUsers = List.from(chatUsers); // Reassign to trigger state change
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Text(
          'Pesan',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'WorkSans',
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsetsDirectional.only(top: 2.h, start: 7.w, end: 5.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
                SizerUtil.deviceType == DeviceType.tablet ? 60 : 40),
            topRight: Radius.circular(
                SizerUtil.deviceType == DeviceType.tablet ? 60 : 40),
          ),
        ),
        child: RefreshIndicator(
          onRefresh: _refreshChatList,
          child: ListView.builder(
            itemCount: chatUsers.length,
            shrinkWrap: true,
            physics:
                const AlwaysScrollableScrollPhysics(), // Allow the list to always be scrollable
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ConversationList(
                    name: chatUsers[index].name,
                    messageText: chatUsers[index].messageText,
                    //  imageUrl: chatUsers[index].imageURL,
                    time: chatUsers[index].time,
                    isMessageRead: (index == 0 || index == 3) ? true : false,
                  ),
                  if (index < chatUsers.length - 1)
                    const Divider(
                      thickness: 0.2,
                      indent: 10,
                      endIndent: 10,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
