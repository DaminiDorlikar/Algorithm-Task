import 'package:algorithm/algorithm_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlgorithmScreen extends StatelessWidget {
  final AlgorithmController controller = Get.put(AlgorithmController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Algorithm",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return DropdownButtonFormField<String>(
                hint: const Text('Select your favourite rule'),
                value: controller.selectedRule.value,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                onChanged: (String? newValue) {
                  controller.selectedRule.value = newValue!;
                },
                items: <String>[
                  "Select Rule",
                  "Odd Numbers",
                  "Even Numbers",
                  "Prime Numbers",
                  "Fibonacci Numbers"
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
              );
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(() {
              var rule = controller.getRule();
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemCount: controller.numbers.length,
                itemBuilder: (context, index) {
                  int number = controller.numbers[index];
                  bool highlight = rule!(number);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: highlight ? Colors.blue : Colors.grey[200],
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(
                        number.toString(),
                        style: TextStyle(
                          color: highlight ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
