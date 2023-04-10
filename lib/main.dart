import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:url_strategy/url_strategy.dart';

void main() {
// setPathUrlStrategy();
  return runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static const String title = 'Harihari Pergi';


  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerDelegate: _router.routerDelegate,
    routeInformationParser: _router.routeInformationParser,
    routeInformationProvider: _router.routeInformationProvider,
  );

  final GoRouter _router = GoRouter(
    // errorBuilder: (context, state) => ErrorScreen(error: state.error),
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          // GoRoute(
          //   path: 'page2',
          //   builder: (BuildContext context, GoRouterState state) =>
          //       const Page2Screen(),
          // ),
          // GoRoute(
          //   path: 'page3',
          //   builder: (BuildContext context, GoRouterState state) =>
          //       const Page3Screen(),
          // ),
          // GoRoute(
          //   path: 'page4',
          //   builder: (BuildContext context, GoRouterState state) =>
          //       const Page4Screen(),
          // ),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const Page1Screen(),
      ),
    ],
  );
}

class Page1Screen extends StatefulWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  _Page1ScreenState createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page1Screen> {
  final String _imageOne = 'assets/images/img.png';
  final List<String> _placeNames = ['Pesawat', 'Kereta', 'Bus'];
  final List<String> pathGambarYgy = [
    'assets/images/plane.jpg',
    'assets/images/train.jpg',
    'assets/images/bus.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/bakudan.png',
          fit: BoxFit.cover,
        ),
        actions: <Widget> [
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
        title: const Text(App.title),
        backgroundColor: const Color(0xFF343A40),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              _imageOne,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'TENTUKAN PERJALANANMU',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'BERDASARKAN AKTIVITAS YANG DI INGINKAN',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _placeNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                    child: PlaceCard(
                      name: _placeNames[index],
                      assetPath: pathGambarYgy[index],
                    ),
                  );
                },
              ),
            ),
            // Image.asset(
            //   _imageOne,
            //   height: 300,
            //   fit: BoxFit.cover,
            // ),
          ],
        ),
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  final String name;
  final String assetPath;

  PlaceCard({required this.name, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              assetPath,
              height: 130.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
              name
          ),
        ],
      ),
    );
  }
}


/// DELETE AE GER KLO GK PAKE
// class Page2Screen extends StatelessWidget {
//   /// Creates a [Page2Screen].
//   const Page2Screen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(title: const Text("Pilihan Pesawat")),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                   onPressed: () => context.go('/'),
//                   child: const Text('Go back to home page')),
//             ],
//           ),
//         ),
//       );
// }

/// The screen of the second page.
// class Page3Screen extends StatelessWidget {
//   /// Creates a [Page2Screen].
//   const Page3Screen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(title: const Text(App.title)),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               ElevatedButton(
//                   onPressed: () => context.go('/page4'),
//                   child: const Text('Go to page4'))
//             ],
//           ),
//         ),
//       );
// }

/// The screen of the second page.
// class Page4Screen extends StatelessWidget {
//   /// Creates a [Page2Screen].
//   const Page4Screen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final router = GoRouter.of(context);
//     return Scaffold(
//       appBar: AppBar(title: Text(router.location.toString())),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//                 onPressed: () => context.go('/'),
//                 child: const Text('Go back to home page'))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ErrorScreen extends StatelessWidget {
//   final Exception? error;
//
//   const ErrorScreen({Key? key, required this.error}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Error"),
//       ),
//       body: Center(
//         child: Text(error.toString()),
//       ),
//     );
//   }
// }
