import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommentDialog extends StatefulWidget {
  const CommentDialog({super.key});

  @override
  State<CommentDialog> createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Comments'),
    );
  }
}