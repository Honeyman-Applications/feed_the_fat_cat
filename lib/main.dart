/*
  Bradley Honeyman
  April 5, 2024

  This is an example application for exercising using flutter, enjoy!
  Animations are drawn by Dall E 2

*/

import 'package:feed_the_fat_cat/src/cheeseburger.dart';
import 'package:feed_the_fat_cat/src/cheeseburger_provider.dart';
import 'package:flutter/material.dart';
import 'src/cat.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CheeseburgerProvider(
              count: 16,
              interval: 250,
              sizeFraction: 16,
            ),
          ),
        ],
        builder: (context, child) => Scaffold(
          body: Stack(
            children: [
              Cat(
                cheeseburgerCount: context
                    .watch<CheeseburgerProvider>()
                    .getCheeseburgerCount(),
                sizeFraction:
                    context.read<CheeseburgerProvider>().getSizeFraction(),
              ),
              Visibility(
                visible:
                    context.watch<CheeseburgerProvider>().cheeseburgerVisible,
                child: Cheeseburger(
                  sizeFraction:
                      context.read<CheeseburgerProvider>().getSizeFraction(),
                  cheeseburgerSizeFractionNumerator: 2,
                ),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            child: const Icon(
              Icons.add,
            ),
            onPressed: () {
              // increment cheeseburger count and show cheeseburger
              context.read<CheeseburgerProvider>().cheeseburgerVisible = true;
              context.read<CheeseburgerProvider>().incrementCheeseburgerCount();
            },
          ),
        ),
      ),
    ),
  );
}
