import 'package:chat_app/pages/Chat_Page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/models/users.dart';

// class UsersPage extends StatefulWidget {
//       static String id = 'UsersPage';

//   @override
//   _UsersPageState createState() => _UsersPageState();
// }

// class _UsersPageState extends State<UsersPage> {
//   List<DocumentSnapshot> users = [];

//   @override
//   void initState() {
//     super.initState();
//     // getUsers();
//   }

//   // Future<void> getUsers() async {
//   //   QuerySnapshot snapshot = await FirebaseFirestore.instance
//   //       .collection('users')
//   //       .get();

//   //   setState(() {
//   //     users = snapshot.docs;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('قائمة المستخدمين'),
//       ),
//       body: ListView.builder(
//         itemCount: 30,
//         itemBuilder: (context, index) {
//           String username = 'hjbjbj';//users[index].get('username');
//           String email ='hjgjhgh';// users[index].get('email');
//           // String avatarUrl = users[index].get('avatarUrl');

//           return ListTile(
//             leading: CircleAvatar(
//               // backgroundImage: NetworkImage(avatarUrl),
//             ),
//             title: Text(username),
//             subtitle: Text(email),
//             onTap: () {
//               // قم بتنفيذ الإجراء الذي ترغب فيه عند النقر على المستخدم
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// return messagesList[index].id == email
//     ? ChatBubble(message: mes  sagesList[index], isMe: true)
//     : messagesList[index].id == userEmail
//         ? ChatBubble(message: messagesList[index], isMe: false)
//         : null;
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';



// class UsersPage extends StatelessWidget {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   static String id = 'UsersPage';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Users'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _firestore.collection('users').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           final users = snapshot.data!.docs;
//           List<Widget> usersWidgets = [];
//           for (var user in users) {
//             final userData = user.data() as Map<String, dynamic>;
//             final userName = userData['name'];
//             final userEmail = userData['email'];

//             // Add user to the list of widgets
//             usersWidgets.add(
//               ListTile(
//                 title: Text(userName),
//                 subtitle: Text(userEmail),
//                 onTap: () {
//                   Navigator.pushNamed(context, '/chat', arguments: {
//                     'userEmail': userEmail,
//                   });
//                 },
//               ),
//             );
//           }
//           return ListView(
//             children: usersWidgets,
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:chat_app/constants.dart';
import 'package:chat_app/widgets/custom_users_list_tile.dart';
 
// import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatefulWidget {
  // static const String id = 'ChatPage';
  static String id = 'UsersPage';
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  // final TextEditingController _textController = TextEditingController();
  // final ScrollController ListcController = ScrollController();
  // final List<String> _messages = [];
CollectionReference users = FirebaseFirestore.instance.collection(kUsersCollections);
  @override
  Widget build(BuildContext context) {
       Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>; 
       String? email = args['_email'];

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder:(context,snapshot)
      {
       if (snapshot.hasData) {
        List<Users>usersList=[];
        // List<Users>usersList=[];
        for(int i=0;i<snapshot.data!.docs.length;i++)
        {
          usersList.add(Users.fromJson(snapshot.data!.docs[i]));
          print(usersList[i]);
        }
  return  Scaffold(
  appBar:AppBar(
    automaticallyImplyLeading: false,
  backgroundColor: kPrimaryColor,
  centerTitle: true,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
       Padding(
         padding: const EdgeInsets.only(right: 10),
         child: Image.asset(
            kLogoPath,
            width: 55,
            height: 55,
          ),
       ),
      
      Text( 
        'Users',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    ],
  ),
),
       body:ListView.builder(
           itemCount: usersList.length,
           itemBuilder: (context, index) {
             return email!=usersList[index].email?CustomListTile(
  title:usersList[index].username,
  subtitle:usersList[index].email,
  onTap: () {
     Navigator.pushNamed(context,ChatPage.id,arguments: {
    'userEmail':usersList[index].email,
    '_email': email,
    'userName':usersList[index].username,

  },);
print(usersList[index].email);
print(email);
  },
):Container();
           },),
      );
}

 else
 
 {
           return Center(child: CircularProgressIndicator());
        }
      } , );
  }


} 

