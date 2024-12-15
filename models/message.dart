import 'package:chat_app/constants.dart';

class Message {
  final String message;
  final String id;
  DateTime timestamp;
final String userid;
  Message(this.message, this.id, this.timestamp,this.userid);
  factory Message.fromJson(jsonData) {
    if (jsonData != null) {
      return Message(
        jsonData[kMessage] ?? '', // قد تكون قيمة kMessage فارغة أيضًا
        jsonData[Kid] ?? '', // قد تكون قيمة Kid فارغة أيضًا
        jsonData[kCreateAdt]?.toDate() ?? DateTime.now(), 
        jsonData[Kuser]??'',// قد تكون kCreateAdt فارغة أيضًا
      );
    } else {
      // إرجاع قيمة افتراضية أو إثارة استثناء أو تنفيذ تصرف مناسب حسب متطلبات التطبيق
      return Message('', '', DateTime.now(),'');
    }
  }
}



// import 'package:chat_app/constants.dart';

// class Message {
//   final String message;
//   final String id;
//   final String userid;
//   DateTime timestamp;

//   Message(this.message, this.id, this.timestamp,this.userid);

//   factory Message.fromJson(jsonData) {
//     return Message(
//       jsonData[kMessage],
//       jsonData[Kid],
//       jsonData[kCreateAdt].toDate(),
//       jsonData[Kuser],
//     );
//   }
// }


// import 'package:chat_app/constants.dart';

// class Message {
//   final String message;
//   final String id;
//   final DateTime timestamp;
//   final String imageUrl; // مسار الصورة
//   final String userid;

//   Message(this.message, this.id, this.timestamp, this.imageUrl, this.userid);

//   factory Message.fromJson(Map<String, dynamic> jsonData) {
//     return Message(
//       jsonData[kMessage] ?? '', // نص الرسالة
//       jsonData[Kid] ?? '', // معرف الرسالة
//       jsonData[kCreateAdt]?.toDate() ?? DateTime.now(), // تاريخ الرسالة
//       jsonData[kImageUrl] ?? '', // مسار الصورة
//       jsonData[Kuser] ?? '', // معرف المستخدم
//     );
//   }
// }