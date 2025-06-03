import 'package:flutter/material.dart';

enum MaterialType { material, cupertino }

Set<MaterialType> _selected = {MaterialType.material};

class BotaoSegmentado extends StatelessWidget {
  const BotaoSegmentado({super.key});

  @override
  Widget build(context) {
    return SegmentedButton<MaterialType>(
      segments: const <ButtonSegment<MaterialType>>[
        ButtonSegment<MaterialType>(
            value: MaterialType.material, label: Text('Material 3')),
        ButtonSegment(value: MaterialType.cupertino, label: Text('Cupertino'))
      ],
      selected: _selected,
      onSelectionChanged: (Set<MaterialType> newSelection) {},
    );
  }
}
