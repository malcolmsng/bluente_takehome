import 'package:flutter/material.dart';
import 'mammal.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScorePage extends StatelessWidget {
  final int score;
  const ScorePage({Key? key, this.score = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            Text(
              'Total Score\n\n$score',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900]),
            ),
            SizedBox(
              height: height * 0.48,
            ),
            Container(
              width: width * 0.9,
              height: height * 0.1,
              margin: EdgeInsets.all(8),
              child: Material(
                borderRadius: BorderRadius.circular(28.0),
                color: Colors.lightBlue[300],
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MammalPage(),
                      //settings: RouteSettings(arguments: widget.exercise)),
                    ));
                  },
                  child: Center(
                    child: Text(
                      'Restart',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
