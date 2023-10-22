// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tic_toc_toe_br/app/core/helper/my_flutter_app_icons.dart';

class PlayGridWidget extends StatelessWidget {
  final Function(int index) tapped;
  final List xOrOList;

  const PlayGridWidget({
    Key? key,
    required this.tapped,
    required this.xOrOList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                tapped(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: index == 0
                        ? const Radius.circular(20)
                        : const Radius.circular(0),
                    topRight: index == 2
                        ? const Radius.circular(20)
                        : const Radius.circular(0),
                    bottomLeft: index == 6
                        ? const Radius.circular(20)
                        : const Radius.circular(0),
                    bottomRight: index == 8
                        ? const Radius.circular(20)
                        : const Radius.circular(0),
                  ),
                ),
                child: Center(
                  child: Icon(
                    xOrOList[index] == "" ? null : xOrOList[index],
                    color: xOrOList[index] == MyFlutterApp.cancel
                        ? Colors.red.shade300
                        : Colors.blue.shade300,
                    size: 80,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
