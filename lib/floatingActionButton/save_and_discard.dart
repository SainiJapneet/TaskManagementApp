import 'package:flutter/material.dart';

class SaveAndDiscard extends StatelessWidget {
  const SaveAndDiscard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //For close icon
        IconButton(
          icon: const Icon(Icons.close),
          color: Colors.yellow,
          onPressed: () =>
              {dialogBox(context, "Do you want to discard changes?")},
        ),

        //For check icon
        IconButton(
          icon: const Icon(Icons.check),
          color: Colors.yellow,
          onPressed: () => {dialogBox(context, "Do you want to save changes?")},
        ),
      ],
    );
  }

  Future<dynamic> dialogBox(BuildContext context, String contentMessage) {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              backgroundColor: Colors.purple,
              title: const Text(
                'Add Task',
              ),
              titleTextStyle: const TextStyle(color: Colors.yellow),
              content: Text(contentMessage),
              contentTextStyle: const TextStyle(color: Colors.yellow),
              actions: <Widget>[
                actionButtons(ctx, "Yes"),
                actionButtons(ctx, "No")
              ],
            ));
  }

  TextButton actionButtons(BuildContext ctx, String buttonMessage) {
    return TextButton(
        onPressed: () {
          if (buttonMessage == "Yes") {
            Navigator.popUntil(ctx, ModalRoute.withName('/')); //Route Line
          }
          if (buttonMessage == "No") {
            Navigator.pop(ctx);
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: Colors.yellow,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            buttonMessage,
            style: const TextStyle(color: Colors.purple),
          ),
        ));
  }
}
