import 'package:finals/ChoicesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Quiz.dart';

//"A. ${Quiz().q[id].choices![0].toString()}"
class Choices extends StatefulWidget {
  final int id;

  List<int> choosen = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  int getItem(int id) {
    return choosen[id];
  }

  Choices({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Choices> createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  late int id = widget.id;
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    List<String> options = [
      "A. ${Quiz().q[id].choices![0].toString()}",
      "B. ${Quiz().q[id].choices![1].toString()}",
      "C. ${Quiz().q[id].choices![2].toString()}",
      "D. ${Quiz().q[id].choices![3].toString()}"
    ];
    return Column(
      children: options
          .asMap()
          .entries
          .map(
            (MapEntry<int, String> entry) => Card(
              elevation: 4,
              child: ListTile(
                onTap: () {
                  setState(() {
                    selectedValue = entry.key;
                    print("sel $selectedValue and id $id");
                    Get.find<ChoicesController>().choosen[id] = selectedValue;
                    print(Get.find<ChoicesController>().choosen.toString());
                  });
                },
                title: Text(entry.value),
                leading: Radio<int>(
                  value: entry.key,
                  groupValue: selectedValue,
                  onChanged: (int? value) {},
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
