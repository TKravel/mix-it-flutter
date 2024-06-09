// import 'package:flutter/material.dart';

// import 'package:mix_it/utils/colors/custom_colors.dart';
// import 'package:mix_it/screens/home_page/home_page.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const CustomAppBar({super.key});

//   @override
//   Size get preferredSize {
//     return const Size.fromHeight(60);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           color: Colors.blue,
//         ),
//         const Positioned(
//           top: 20,
//           left: 0,
//           child: Text(
//             "buttons",
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           ),
//         ),
//         Positioned(
//           top: 20,
//           left: 0,
//           child: IconButton(
//             icon: const Icon(Icons.menu),
//             onPressed: () {
//               _globalkey.currentState?.openDrawer();
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
