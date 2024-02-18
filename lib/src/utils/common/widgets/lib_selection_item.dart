import 'package:flutter/material.dart';
import 'package:tcc_performance_app/src/utils/data/item_client.dart';

class LibSelectionItem extends StatefulWidget {
  final String imageSrc;
  final String title;
  final String route;
  final ItemListModel data;

  const LibSelectionItem({
    required this.imageSrc,
    required this.title,
    required this.route,
    required this.data,
    super.key,
  });

  @override
  State<LibSelectionItem> createState() => _LibSelectionItemState();
}

class _LibSelectionItemState extends State<LibSelectionItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        key: const Key('libSelectionItem'),
        highlightColor: Colors.amber.withOpacity(0.2),
        splashColor: Colors.amber,
        onTap: () {
          Navigator.of(context).pushNamed(
            widget.route,
            arguments: widget.data,
          );
        },
        child: Stack(
          children: [
            // Positioned.fill(
            //   child: Image.network(
            //     widget.imageSrc,
            //     fit: BoxFit.contain,
            //     repeat: ImageRepeat.repeat,
            //   ),
            // ),
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                    ),
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
