class ChatMessage {
  String messageContent;
  String messageType;
  String? filePath;
  bool isFile;

  ChatMessage({
    required this.messageContent,
    required this.messageType,
    this.filePath,
    this.isFile = false,
  });
}
