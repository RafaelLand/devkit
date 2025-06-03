import 'package:flutter/material.dart';

class CarrosselView extends StatelessWidget {
  const CarrosselView({super.key});

  @override
  Widget build(context) {
    return CarouselView(
      itemExtent: double.infinity,
      children: List<Widget>.generate(
        5,
        (int index) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurpleAccent, Colors.purple],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight),
            ),
            child: Center(
              child: Text('Item $index'),
            ),
          );
        },
      ),
    );
  }
}
