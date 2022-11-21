// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// class Rating extends StatelessWidget {
//   const Rating({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return RatingBar.builder(
//       initialRating: 3,
//       itemCount: 5,
//       onRatingUpdate: (rating) {
//         print(rating);
//       },
//       itemBuilder: (context, index) {
//         switch (index) {
//           case 0:
//             return Icon(
//               Icons.sentiment_very_dissatisfied,
//               color: Colors.red,
//             );
//           case 1:
//             return Icon(
//               Icons.sentiment_dissatisfied,
//               color: Colors.redAccent,
//             );
//           case 2:
//             return Icon(
//               Icons.sentiment_neutral,
//               color: Colors.amber,
//             );
//           case 3:
//             return Icon(
//               Icons.sentiment_satisfied,
//               color: Colors.lightGreen,
//             );
//           case 4:
//             return Icon(
//               Icons.sentiment_very_satisfied,
//               color: Colors.green,
//             );
//         }
//         return Text("Something went wrong");
//       },
//     );
//   }

//   double getRating() {
//     return this.rating;
//   }
// }
