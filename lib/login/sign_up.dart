// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final AuthService _authService = AuthService();
//
//   void _signUp() async {
//     User? user = await _authService.signUp(
//       _emailController.text,
//       _passwordController.text,
//     );
//     if (user != null) {
//       await FirestoreService().createUser(user.uid, {'email': user.email});
//       Navigator.pushReplacementNamed(context, '/home');
//     } else {
//       // Handle error
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Sign Up')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _signUp,
//               child: Text('Sign Up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
