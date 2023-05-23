// Quiz().q[0].question.toString(),
//int id, String question, List choices
import 'package:finals/Choices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ChoicesController.dart';
import 'Quiz.dart';

class Tile extends StatefulWidget {
  final int id;
  const Tile({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  late int id = widget.id;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff1DC3A5).withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            height: 100,
            child: ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        height: 480,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Question No. ${Quiz().q[id].id.toString()}",
                                style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                Quiz().q[id].question.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            Choices(id: id),
                            Container(
                              margin: const EdgeInsets.only(top: 25),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color(0xff1DC3A5),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      "Done",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              isThreeLine: true,
              title: Text(
                "Question No. ${Quiz().q[id].id.toString()}",
                style: const TextStyle(
                  fontSize: 25,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                Quiz().q[id].question.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff1DC3A5).withOpacity(0.4),
              borderRadius: BorderRadius.circular(12),
            ),
            height: 45,
            margin: const EdgeInsets.only(top: 2, bottom: 20),
            child: ListTile(
              title: Obx(() => Text(
                    "Choosen Answer : ${(Get.find<ChoicesController>().choosen[id] != -1 ? Quiz().q[id].choices![Get.find<ChoicesController>().choosen[id]] : '')}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
