import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MuseumFarePage extends StatefulWidget {
  final int priceAdult;
  final int priceChildElderly;
  final int tax;

  const MuseumFarePage({
    super.key,
    required this.priceAdult,
    required this.priceChildElderly,
    required this.tax,
  });

  @override
  State<MuseumFarePage> createState() => _MuseumFarePageState();
}

class _MuseumFarePageState extends State<MuseumFarePage> {
  //keep track of the changes
  TextEditingController adultController = TextEditingController();
  TextEditingController childController = TextEditingController();
  TextEditingController elderlyController = TextEditingController();

  double subtotal = 0.00;
  double addTax = 0.00;
  double totalPrice = 0.00;
  double? adultNumInt;
  double? childNumInt;
  double? elderlyNumInt;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    adultController.dispose();
    childController.dispose();
    elderlyController.dispose();

    super.dispose();
  }

  void adultNumberChanged(adultNum) {
    if (adultNum.isNotEmpty) {
      setState(() {
        adultNumInt = double.tryParse(adultNum);
      });
    } else {
      setState(() {
        adultNumInt = 0;
      });
    }
    calculateTotal();
  }

  void childNumberChanged(childNum) {
    if (childController.text.isNotEmpty) {
      setState(() {
        childNumInt = double.tryParse(childNum);
      });
    } else {
      setState(() {
        childNumInt = 0;
      });
    }
    calculateTotal();
  }

  void elderlyNumberChanged(elderlyNum) {
    if (elderlyController.text.isNotEmpty) {
      setState(() {
        elderlyNumInt = double.tryParse(elderlyNum);
      });
    } else {
      setState(() {
        elderlyNumInt = 0;
      });
    }
    calculateTotal();
  }

  void calculateTotal() {
    subtotal = (((adultNumInt ?? 0.0) * widget.priceAdult) +
        ((childNumInt ?? 0.0) * widget.priceChildElderly) +
        ((elderlyNumInt ?? 0.0) * widget.priceChildElderly));
    addTax = (subtotal * (widget.tax / 100));
    totalPrice = subtotal + addTax;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fare Calculator'),
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
      body: Container(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    'Adult Visitor (RM ${widget.priceAdult.toDouble().toStringAsFixed(2)}):',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(width: 20.0),
                  Flexible(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: adultController,
                      onChanged: adultNumberChanged,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(
                        'Child Visitor (RM ${widget.priceChildElderly.toDouble().toStringAsFixed(2)}):',
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(width: 20.0),
                      Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: childController,
                          onChanged: childNumberChanged,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    'Elderly Visitor (RM ${widget.priceChildElderly.toDouble().toStringAsFixed(2)}):',
                    style: const TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(width: 20.0),
                  Flexible(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: elderlyController,
                      onChanged: elderlyNumberChanged,
                    ),
                  ),
                ],
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     updateSubtotalPrice();
            //   },
            //   child: Text("Calculate"),
            // ),
            const SizedBox(height: 10.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Row(
                children: [
                  const Text(
                    'Subtotal: RM',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    '$subtotal',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Text(
                    'Tax 6%: RM',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    '$addTax',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: Row(
                children: [
                  const Text(
                    'Total Price: RM',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$totalPrice',
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
