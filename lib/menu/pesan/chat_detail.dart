import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:study/menu/pesan/chat_message.dart';

class ChatDetailPageOrtu extends StatefulWidget {
  const ChatDetailPageOrtu({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatDetailPageOrtuState createState() => _ChatDetailPageOrtuState();
}

class _ChatDetailPageOrtuState extends State<ChatDetailPageOrtu> {
  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Halo, nama saya Janeudi.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Tolong periksa dan segera tanda tangani dokumen ini,",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "untuk tur perjalanan anak anda.",
        messageType: "receiver"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "sender"),
    ChatMessage(messageContent: "Terimakasih!", messageType: "receiver"),
  ];

  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(ChatMessage(
          messageContent: _controller.text,
          messageType: "sender",
        ));
      });
      _controller.clear();
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        messages.add(ChatMessage(
          messageContent: file.name, // Do not add the file name here
          messageType: "sender",
          filePath: file.path,
          isFile: true,
        ));
      });
    }
  }

  Future<void> _refreshMessages() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Update messages list or refresh logic here
    setState(() {
      messages.add(ChatMessage(
        messageContent: "Pesan baru setelah refresh.",
        messageType: "receiver",
      ));
    });
  }

  void _showImagePreview(String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Image.file(
              File(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  void _openDocument(String filePath) async {
    final result = await OpenFile.open(filePath);
    if (result.type != ResultType.done) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the file')),
      );
    }
  }

  Widget _buildMessage(ChatMessage message) {
    if (message.isFile && message.filePath != null) {
      bool isImage = message.filePath!.endsWith('.jpg') ||
          message.filePath!.endsWith('.png') ||
          message.filePath!.endsWith('.jpeg');

      return GestureDetector(
        onTap: () => isImage
            ? _showImagePreview(message.filePath!)
            : _openDocument(message.filePath!),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: message.messageType == "receiver"
                ? Colors.grey.shade200
                : const Color.fromRGBO(76, 66, 83, 0.9),
          ),
          padding: const EdgeInsets.all(16),
          child: isImage
              ? Image.file(
                  File(message.filePath!),
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                )
              : Row(
                  children: [
                    const Icon(
                      Icons.insert_drive_file,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    if (!isImage) // Display file name only for non-image files
                      Expanded(
                        child: Text(
                          message.filePath!
                              .split('/')
                              .last, // Extract the file name
                          style: const TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: message.messageType == "receiver"
              ? Colors.grey.shade200
              : const Color.fromRGBO(76, 66, 83, 0.9),
        ),
        padding: const EdgeInsets.all(16),
        child: Text(
          message.messageContent,
          style: TextStyle(
            fontSize: 15,
            color: message.messageType == "receiver"
                ? Colors.black87
                : Colors.white,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(186, 252, 182, 1),
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://th.bing.com/th/id/OIG2.2DldIA6_HF8OS80uHLnl?w=1024&h=1024&rs=1&pid=ImgDetMain"),
                  maxRadius: 22,
                ),
                const SizedBox(
                  width: 12,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Jaenudi S.Pd",
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          height: 1.1,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          height: 1.1,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                // const Icon(
                //   Icons.call,
                //   color: Colors.black,
                // ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.only(top: 1.h),
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
                onRefresh: _refreshMessages,
                child: ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: Align(
                        alignment: messages[index].messageType == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width *
                                0.6, // Adjust max width to 60% of the screen width
                          ),
                          child: _buildMessage(messages[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 10, bottom: 10, top: 10, right: 10),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: _pickFile,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(76, 66, 83, 0.9),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Ketik Pesan...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    tooltip: "kirim",
                    onPressed: _sendMessage,
                    backgroundColor: const Color.fromRGBO(76, 66, 83, 0.9),
                    elevation: 0,
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
