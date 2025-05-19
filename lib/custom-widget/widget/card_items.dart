import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItems extends StatelessWidget {
  const CardItems({super.key,
    required this.text,
    required this.editOnPressed,
    this.fontSize = 20,
    r,
  });

  final double fontSize;
  final String text;
  final void Function() editOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 151,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        maxLines:3,
                        text,
                        style: TextStyle(
                          fontSize: fontSize,
                          overflow: TextOverflow.ellipsis,

                        ),
                      ),
                      Spacer(),
                      Container(
                        alignment:Alignment.bottomRight,
                        child: IconButton(
                            onPressed: editOnPressed,
                            icon: Icon(Icons.edit)),
                      )
                    ],
                  ),
                )
            ),
          ),
        ),

      ],
    );
  }
}
