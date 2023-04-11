import 'package:dmc_flutter/model/post.dart';
import 'package:dmc_flutter/service/remote_service.dart';
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
        routes: const <GoRoute>[
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
    'assets/images/bus.jpg'
  ];
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/bakudan.png',
          fit: BoxFit.cover,
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.menu),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Profile'),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('Logout'),
                ),
              ];
            },
            onSelected: (value) {
              //ini setara sama onPressed
            },
          )
        ],
        title: const Text(App.title),
        backgroundColor: const Color(0xFF343A40),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              _imageOne,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.0),
            Center(
              child: Column(
                children: const [
                  Text(
                    'TENTUKAN PERJALANANMU',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'BERDASARKAN AKTIVITAS YANG DI INGINKAN',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 190,
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
            Container(
              padding: const EdgeInsets.only(left: 8),
              child: const Text(
                'Filler',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 450,
              child: Visibility(
                visible: isLoaded,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ListView.builder(
                  itemCount: posts?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey[300],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      posts![index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      posts![index].body ?? '',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Divider()
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
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
