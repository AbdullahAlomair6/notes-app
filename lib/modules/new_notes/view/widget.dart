
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget cardItems(){
  return  Row(
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.circular(10)
                ),
                height: 151,

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        maxLines:3,
                        'wdwdw sdswdwdwdwd wdwdwdwd wdwdwdw wddwdw asdadf sdswdwdwdwd wdwdwdwd wdwdwdw wddwdw',
                        style: TextStyle(
                          fontSize: 10,
                          overflow: TextOverflow.ellipsis,

                        ),
                      ),
                      Container(
                        alignment:Alignment.bottomRight,
                        child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.edit)),
                      )
                    ],
                  ),
                )
            ),
          ),
        ),
      ),

    ],
  );
}


PreferredSizeWidget? appBarDesign(){
  return AppBar(
    backgroundColor: Colors.blueGrey,
    elevation: 2,
    title: Center(
      child: Text(
        'Notes',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}