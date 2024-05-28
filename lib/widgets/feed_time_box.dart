import 'package:flutter/material.dart';
import 'colors.dart';

class FeedTimeBox extends StatefulWidget {
  final int index;
  final TimeOfDay feedTime;
  final void Function() onRemovePressed;
  final bool isRemoving;

  const FeedTimeBox({
    super.key,
    required this.index,
    required this.feedTime,
    required this.onRemovePressed,
    required this.isRemoving,
  });

  @override
  State<FeedTimeBox> createState() => _FeedTimeBoxState();
}

class _FeedTimeBoxState extends State<FeedTimeBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: MyColors.containerButton,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${widget.index + 1}º horário:',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: MyColors.color3,
            ),
          ),
          Expanded(
            child: Text(
              widget.feedTime.format(context),
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: MyColors.color5,
              ),
            ),
          ),
          if (widget.isRemoving)
            IconButton(
              onPressed: widget.onRemovePressed,
              icon: const Icon(Icons.remove_circle),
              color: Colors.red,
            ),
        ],
      ),
    );
  }
}
