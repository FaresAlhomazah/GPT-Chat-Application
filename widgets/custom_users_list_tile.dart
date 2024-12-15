// import 'package:flutter/material.dart';

// class CustomListTile extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final Function()? onTap;

//   const CustomListTile({
//     required this.title,
//     required this.subtitle,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(title),
//       subtitle: Text(subtitle),
//       onTap: onTap,
//     );
//   }
// }

import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onTap;

  const CustomListTile({
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(
    side: BorderSide(color:kPrimaryColor, width:2),
    borderRadius: BorderRadius.circular(20),
  ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
      leading: CircleAvatar(
        child: Text(
          title.isNotEmpty?title[0]:'',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: kPrimaryColor, // يمكن تغيير اللون حسب الاحتياجات
      ),
      onTap: onTap,
    );
  }
}
