import 'package:flutter/material.dart';
import 'package:museum/model/museum_model.dart';
import 'package:go_router/go_router.dart';
import 'package:museum/model/museum_details_params.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void onTapMuseum(int index) {
    final museum = MuseumModel.museumList[index];

    //named constructor no need follow the position
    //must follow the positional constructor
    final museumDetailsParams = MuseumDetailsParams(
        museum.name ?? "",
        museum.photoList ?? "",
        museum.description ?? "",
        museum.entryPriceAdult ?? 0,
        museum.entryPriceChildElderly ?? 0,
        museum.taxPercentage ?? 0);

    context.pushNamed('details',
        params: {'name': museum.name.toString()}, extra: museumDetailsParams);
  }

  @override
  Widget build(BuildContext context) {
    final List<MuseumModel> museumList = MuseumModel.museumList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Museum List'),
        backgroundColor: const Color(0xFF607D8B),
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: museumList.length,
          itemBuilder: (BuildContext context, index) {
            return Card(
              margin: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  onTapMuseum(index);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      '${museumList[index].photoList}',
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        '${museumList[index].name}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        '${museumList[index].description}',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              heroTag: const Text("btn1"),
              onPressed: () {},
              backgroundColor: const Color(0xFF607D8B),
              child: const Icon(Icons.abc),
            ),
            FloatingActionButton(
              heroTag: const Text("btn2"),
              onPressed: () {},
              backgroundColor: const Color(0xFF607D8B),
              child: const Icon(Icons.save),
            )
          ],
        ),
      ),
    );
  }
}
