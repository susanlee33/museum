import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:museum/model/museum_fare_model.dart';

class MuseumDetailsPage extends StatefulWidget {
  final String? photoUrl;
  final String? desc;
  final String? name;
  final int? priceAdult;
  final int? priceChildElderly;
  final int? tax;

  const MuseumDetailsPage(
      {super.key,
      this.photoUrl,
      this.desc,
      this.name,
      this.priceAdult,
      this.priceChildElderly,
      this.tax});

  @override
  State<MuseumDetailsPage> createState() => _MuseumDetailsPageState();
}

class _MuseumDetailsPageState extends State<MuseumDetailsPage> {
  void onTapFare() {
    final museumFareModel = MuseumFareModel('${widget.name}',
        widget.priceAdult ?? 0, widget.priceChildElderly ?? 0, widget.tax ?? 0);

    context.pushNamed('museumFare',
        params: {'name': museumFareModel.name.toString()},
        extra: museumFareModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Museum Detail'),
        backgroundColor: const Color(0xFF607D8B),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('${widget.photoUrl}'),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                '${widget.name}',
                style: const TextStyle(
                    fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: Text(
                '${widget.desc}',
                textAlign: TextAlign.justify,
                softWrap: true,
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                    minWidth: double.infinity, minHeight: 30),
                child: ElevatedButton(
                  onPressed: () {
                    onTapFare();
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16.0),
                    primary: const Color(0xFF607D8B),
                  ),
                  child: const Text("Book Museum Ticket"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
