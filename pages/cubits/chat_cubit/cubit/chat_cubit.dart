// import 'package:bloc/bloc.dart';
// import 'package:chat_app/constants.dart';
// import 'package:chat_app/models/message.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:meta/meta.dart';

// part 'chat_state.dart';

// class ChatCubit extends Cubit<ChatState> {
//   ChatCubit() : super(ChatInitial());
  
//    CollectionReference messages = FirebaseFirestore.instance.collection(kMessagesCollections);


//   void sendMessages({required String message ,required String email,required String userEmail}){
//        try {
//   messages.add({
//                        kMessage:message,
//                        kCreateAdt:DateTime.now(),
//                        Kid:email,
//                        Kuser:userEmail
//                      });
// } on Exception catch (e) {
//   // TODO
// }
//   }

//   void getMessage(){
//     messages.orderBy(kCreateAdt , descending: true).snapshots().listen((event) {
//     List<Message> messagesList = [];
//           for(var doc in event.docs) {
//             messagesList.add(Message.fromJson(doc));
//           }
//     emit(ChatSuccess(messages:messagesList ));
//     });
//   }
// }
