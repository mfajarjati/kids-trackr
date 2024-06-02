import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:study/menu/pesan/pecakapan.dart';
import 'package:study/menu/pesan/user_model.dart';

class ChatPageOrtu extends StatefulWidget {
  const ChatPageOrtu({super.key});
  static String routeName = 'ChatPageOrtu';

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageOrtuState createState() => _ChatPageOrtuState();
}

class _ChatPageOrtuState extends State<ChatPageOrtu> {
  // list chat user
  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Pak Jaenudi", messageText: "Terima kasih banyak.", time: "Now"),
    ChatUsers(
        name: "Bu Zulaifa Fauziah",
        messageText: "Nanti saya kirimkan",
        time: "Kemarin"),
    ChatUsers(name: "Diah Marbun", messageText: "Oke", time: "Kemarin"),
    ChatUsers(
        name: "Pak Ahman Sanusi",
        messageText: "Ditunggu yah pak",
        time: "24 Maret"),
    ChatUsers(
        name: "Bu Siti Nurhayati",
        messageText: "Baik, terimakasih",
        time: "23 Maret"),
    ChatUsers(name: "Pak Mamud Ismail", messageText: "Oke", time: "17 Maret"),
    ChatUsers(
        name: "Pak Joko Slamet", messageText: "Sama-sama", time: "22 Maret"),
    ChatUsers(
        name: "Bu Ismi", messageText: "Baik, Terimakasih", time: "21 Maret"),
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
