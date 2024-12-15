import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatelessWidget {
  final Message message;
  final bool isMe;
  final VoidCallback? onDelete;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isMe,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: isMe ? kPrimaryColor : Colors.grey[350],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topRight: isMe ? Radius.circular(0) : Radius.circular(20),
                topLeft: isMe ? Radius.circular(20) : Radius.circular(0),
              ),
            ),
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  constraints:
                      BoxConstraints(maxWidth: constraints.maxWidth * 0.7),
                  child: Text(
                    message.message,
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  formatTimestamp(message.timestamp),
                  style: TextStyle(
                    fontSize: 12,
                    color: isMe ? Colors.white70 : Colors.black,
                  ),
                ),
                if (onDelete != null &&
                    isMe) // إذا كانت الرسالة للمستخدم الحالي ويوجد وظيفة لحذف الرسالة
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: onDelete,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  String formatTimestamp(DateTime timestamp) {
    return DateFormat.jm().format(timestamp);
  }
}
