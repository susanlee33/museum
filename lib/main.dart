import 'package:flutter/material.dart';
import 'package:museum/model/museum_details_params.dart';
import 'package:museum/model/museum_fare_model.dart';
import 'package:museum/pages/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:museum/pages/museum_details.dart';
import 'package:museum/pages/museum_fare.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Go Router',
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        name: 'home',
        path: "/",
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            name: 'details',
            path: 'details/:name',
            builder: (context, state) {
              MuseumDetailsParams museumDetailsParams =
                  state.extra as MuseumDetailsParams;
              return MuseumDetailsPage(
                name: state.params['name'],
                photoUrl: museumDetailsParams.photoUrl,
                desc: museumDetailsParams.desc,
                priceAdult: museumDetailsParams.priceAdult,
                priceChildElderly: museumDetailsParams.priceChildElderly,
                tax: museumDetailsParams.tax,
              );
            },
            routes: [
              GoRoute(
                name: "museumFare",
                path: "fare",
                builder: (context, state) {
                  MuseumFareModel museumFareModel =
                      state.extra as MuseumFareModel;
                  return MuseumFarePage(
                    priceAdult: museumFareModel.priceAdult,
                    priceChildElderly: museumFareModel.priceChildElderly,
                    tax: museumFareModel.tax,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
  
      
      
 

// GoRoute(
//   name: 'home',
//   path: '/',
//   builder: (BuildContext context, GoRouterState state) =>
//       HomeScreen(),
//   routes: <GoRoute>[
//     GoRoute(
//       name: 'family',
//       path: 'family/:fid',
//       builder: (BuildContext context, GoRouterState state) =>
//           FamilyScreen(),
//     ),
//   ],
// );

// context.go(
//   context.namedLocation('family'),
//   params: <String, String>{'fid': 123},
//   queryParams: <String, String>{'qid': 'quid'},
// );