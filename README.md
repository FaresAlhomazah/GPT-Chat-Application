# GPT Chat Application 📱🗬

GPT Chat (Great Powerful Tool) is a **real-time chat application** built with **Flutter** and powered by **Firebase**. The app provides seamless communication through a user-friendly interface and employs modern software engineering principles like **OOP (Object-Oriented Programming)** and the **SOLID design pattern** for maintainability and scalability.

---

## Key Features 🚀

- **User Authentication:** Secure registration and login.
- **Real-Time Messaging:** Send and receive messages instantly.
- **Message Management:**
  - Delete messages.
  - Timestamp formatting for clarity.
- **User Management:** View and interact with a stylish user list.
- **Custom Widgets:** Modular UI components for buttons, input fields, message bubbles, and user tiles.
- **Elegant UI Design:** Clean, responsive, and user-friendly.

---

## 🛠️ Technologies Used

### 1. Flutter Framework
- Provides a cross-platform, responsive, and visually appealing UI.

### 2. Dart Programming Language
- Ensures concise, asynchronous operations essential for real-time features.

### 3. Firebase Integration
- **Authentication:** Manages secure user login and registration.
- **Firestore:** Real-time database for message and user data storage.

### 4. State Management with Cubit (Bloc Library)
- Efficient management of application state:
  - **Login Cubit:** Validates user login and manages authentication state.
  - **SignUp Cubit:** Handles user registration logic and validations.
  - **Chat Cubit:** Manages chat state and message handling.

### 5. Object-Oriented Programming (OOP)
- Enables modular, reusable, and testable code with encapsulated components.

### 6. SOLID Principles
- Guarantees a clean and scalable architecture:
  - **SRP (Single Responsibility Principle):** Each class has a focused responsibility.
  - **OCP (Open/Closed Principle):** Extendable without modifying existing functionality.
  - **DIP (Dependency Inversion Principle):** High-level modules are independent of low-level modules.

---

## 🗊 Project Structure

### Folder Organization

```
GPT Chat Application
│  
├── widgets/
│   ├─ custom_button.dart       # Reusable button widget
│   ├─ custom_chat_bubble.dart  # Message bubble widget
│   ├─ custom_text_form_field.dart # Input fields with validation
│   └─ custom_users_list_tile.dart # User list tile with avatar
│
├── pages/
│   ├─ Users_Page.dart          # Displays list of users
│   ├─ Start_Page.dart          # Landing page
│   ├─ login_page.dart          # User login functionality
│   ├─ SignUp_page.dart         # User registration functionality
│   ├─ Chat_Page.dart           # Real-time chat interface
│   └─ cubits/                  # State management logic
│       ├─ chat_cubit.dart      # Chat-specific state management
│       ├─ login_cubit.dart     # Login state management
│       └─ SignUp_cubit.dart    # Registration state management
│
├── models/
│   ├─ users.dart               # User data model
│   └─ message.dart             # Message structure
│
└── help_me/
    └─ show_snack_bar.dart      # Helper for snack bars
```

---

### 🗊 Architecture Overview

```text
                [ Firebase Firestore & Authentication ]
                              ↑
                              │
                   ---------------------
                  |      Cubit Layer     |
                  |  (Chat, Login, etc.) |
                   ---------------------
                              ↑
                              │
           --------------------------------------
          |               Widgets                |
          | (CustomButton, ChatBubble, etc.)     |
           --------------------------------------
                              ↑
                              │
           --------------------------------------
          |                Pages                 |
          | (Login, Chat, Signup, etc.)          |
           --------------------------------------
```

---

## 💡 What Makes This Project Unique?

1. **Scalable Architecture:** Modular design for easy expansion.
2. **Reusable Components:** Custom widgets to ensure consistency.
3. **State-of-the-Art State Management:** Cubit integration for seamless interactions.
4. **Clean Codebase:** Follows industry standards like **OOP** and **SOLID principles**.

---

## 🔄 How to Run the Application

### Prerequisites
1. Install Flutter SDK.
2. Set up Firebase for the project:
   - Add `google-services.json` for Android.
   - Add `GoogleService-Info.plist` for iOS.

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/FaresAlhomazah/GPT-Chat-Application.git
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```

---

## 🧲 Future Enhancements

- Add group chat functionality.
- Implement message reactions.
- Enhance UI with dark mode.
- Introduce video and voice calling features.

---

## 📸 Application Preview
### GPT Chat Application Icon
![Screenshot_20241215-204409](https://github.com/user-attachments/assets/30f5b360-32fb-4d79-8ecb-de34c5ddfaa5)

### Signup & Login Pages
![Screenshot_20241215-202119](https://github.com/user-attachments/assets/007e8ca7-7894-45d2-a7d7-a3eec89f6e57)
![Screenshot_20241215-203802](https://github.com/user-attachments/assets/afc8f0a6-40b9-47d3-80b7-7c80312ecd05)
![Screenshot_20241215-203810](https://github.com/user-attachments/assets/0307285f-ba9c-4373-86e6-c3e1d4f318bf)

### Chat Pages
![Screenshot_20241215-204034](https://github.com/user-attachments/assets/77728838-c259-4cac-916b-ca68499ee938)
![Screenshot_20241215-204149](https://github.com/user-attachments/assets/3bc71fd1-a3a6-44ba-9dd8-865e97707c20)

---


## 📧 Contact

- **Email:** faresalhomazzah@gmail.com
- **LinkedIn:** https://www.linkedin.com/in/fares-abdulghani-alhomazah-6b1802288?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app
