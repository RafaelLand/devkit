import 'package:flutter/cupertino.dart';

class WidgetCupertinoSegButton extends StatefulWidget {
  const WidgetCupertinoSegButton({super.key});

  @override
  State<WidgetCupertinoSegButton> createState() =>
      _WidgetCupertinoSegButtonState();
}

class _WidgetCupertinoSegButtonState extends State<WidgetCupertinoSegButton> {
  int? _sliding = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        child: CupertinoSlidingSegmentedControl(
          backgroundColor: const Color.fromARGB(255, 236, 236, 236),
          thumbColor: const Color.fromARGB(255, 0, 167, 103),
          children: const {
            0: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Material',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            1: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Text(
                'Cupertino',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
          },
          groupValue: _sliding,
          onValueChanged: (int? newValue) {
            setState(() {
              _sliding = newValue;
            });
          },
        ),
      ),
    );
  }
}
