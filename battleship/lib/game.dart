import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var ship_on = [10,20,30,40,50];
  var cell_colors = [];

  initiate_game(){
    for(var v=0;v<100;v++){
      cell_colors.add(Colors.blue);
    }
  }

  @override
  Widget build(BuildContext context) {
    initiate_game();
    // back and create new for re-initialising the grid
    return Container(
      margin: EdgeInsets.fromLTRB(10, 50, 10, 10),
      child: GridView.count(
        crossAxisCount: 10,
        children: List.generate(100, (index) {
          return GestureDetector(
            onTap: (){
              print("You Pressed ${index}");
              if (ship_on.contains(index)){
                setState(() {
                  cell_colors[index] = Colors.red;
                });
              }
              else{
                setState(() {
                  cell_colors[index] = Colors.green;
                });
              }
            },
            child: Container(
                decoration: BoxDecoration(
                  color: cell_colors[index],
                  border: Border.all(width: 1,color: Color(0xFF004D40))
                ),
            ),
          );
        }),
      ),
    );
  }
}
