import 'package:flutter/material.dart';
import 'package:flutter_game_tetris_1102/pixel.dart';

class MyGrid extends StatelessWidget {
  List<Color> pieceColor = [
    Colors.red,
    Colors.yellow,
    Colors.purple,
    Colors.green,
    Colors.blue,
    Colors.brown,
    Colors.pink
  ];

  var newPiece;
  var newColor;
  var landedPieces;
  var numberOfSquares;

  MyGrid(
      {this.newPiece, this.landedPieces, this.newColor, this.numberOfSquares});

  int count = 0;

  void countLanded() {
    count = landedPieces / 4;
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: numberOfSquares,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
        itemBuilder: (BuildContext context, int index) {
          for (int i = 0; i < pieceColor.length; i++) {
            if (landedPieces[i].contains(index)) {
              return MyPixel(
                color: pieceColor[i],
              );
            }
            // if(landedPieces[i].contains(-5)){
            //   _renderDialogGameOver(context);
            // }
          }
          if (newPiece.contains(index)) {
            return MyPixel(
              color: newColor,
            );
          } else {
            return MyPixel(
              color: Colors.black,
            );
          }
        });
  }


}
