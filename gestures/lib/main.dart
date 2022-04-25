//InkWell Demo

// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const title = 'InkWell Demo';

//     return const MaterialApp(
//       title: title,
//       home: MyHomePage(title: title),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String title;

//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: const Center(
//         child: MyButton(),
//       ),
//     );
//   }
// }

// class MyButton extends StatelessWidget {
//   const MyButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // The InkWell wraps the custom flat button widget.
//     return InkWell(
//       //클릭 시 물결 애니메이션 효과
//       // When the user taps the button, show a snackbar.
//       onTap: () {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('Tap'),
//         ));
//       },
//       child: const Padding(
//         padding: EdgeInsets.all(12.0),
//         child: Text('Flat Button'),
//       ),
//     );
//   }
// }

//Tap Gesture

// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const title = 'Gesture Demo';

//     return const MaterialApp(
//       title: title,
//       home: MyHomePage(title: title),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   final String title;

//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: const Center(
//         child: MyButton(),
//       ),
//     );
//   }
// }

// class MyButton extends StatelessWidget {
//   const MyButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // The GestureDetector wraps the button.
//     return GestureDetector(
//       // When the child is tapped, show a snackbar.
//       onTap: () {
//         const snackBar = SnackBar(content: Text('Tap'));

//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       },
//       // The custom button
//       child: Container(
//         padding: const EdgeInsets.all(12.0),
//         decoration: BoxDecoration(
//           color: Colors.lightBlue,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: const Text('My Button'),
//       ),
//     );
//   }
// }

//Swipe to dismiss

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MyApp is a StatefulWidget. This allows updating the state of the
// widget when an item is removed.
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    const title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(item),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  items.removeAt(index);
                });

                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              // Show a red background as the item is swiped away.
              background: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.red,
                  // ignore: prefer_const_constructors
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  alignment: Alignment.centerLeft),
              direction: DismissDirection.startToEnd,
              child: ListTile(
                title: Text(item),
              ),
            );
          },
        ),
      ),
    );
  }
}
