import 'package:bluente_takehome/screens/score.dart';
import 'package:bluente_takehome/screens/material.dart';
import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

class MammalPage extends StatefulWidget {
  const MammalPage({Key? key}) : super(key: key);

  @override
  _MammalPageState createState() => _MammalPageState();
}

class _MammalPageState extends State<MammalPage> {
  int score = 0;
  int correctIndex = 1;
  var gridTitle = ['Duck', 'Whale', 'Shark', 'Butterfly'];
  var gridColours = [
    Colors.grey[200],
    Colors.grey[200],
    Colors.grey[200],
    Colors.grey[200]
  ];
  var gridTextColour = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];
  var answered = false;
  
  var gridPath = [
    'assets/duck.PNG',
    'assets/whale.PNG',
    'assets/Shark.PNG',
    'assets/Butterfly.PNG'
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
                height: height * 0.1,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: LinearPercentIndicator(
                        lineHeight: 16,
                        width: width * 0.79,
                        progressColor: Colors.green,
                        percent: score / 3,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            'Score',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          child: Text(
                            '$score',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
            Container(
              padding: EdgeInsets.all(16),
              child: Text("Which of the following is a mammal?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.indigo[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 40)),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: gridTitle.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Material(
                          borderRadius: BorderRadius.circular(15),
                          color: gridColours[index],
                          child: InkWell(
                            borderRadius: BorderRadius.circular(15),
                            onTap: () {
                              if (!answered) {
                                setState(() {
                                  if (correctIndex == index) {
                                    gridTextColour[index] = Colors.white;
                                    gridColours[index] =
                                        Colors.greenAccent[400];
                                    score++;
                                  } else {
                                    gridColours[index] = Colors.red[900];
                                    gridColours[correctIndex] =
                                        Colors.greenAccent[400];
                                    gridTextColour[index] = Colors.white;
                                    gridTextColour[correctIndex] = Colors.white;
                                  }
                                  answered = true;
                                });

                                showBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: Colors.indigo[900]),
                                        height: height * 0.2,
                                        child: Center(
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                width: width * 0.6,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        'Explanation',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 30),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        'Whales are mammals. Mammals\nare characterized by the \npresence of mammary glands in which females produce milk for feeding their young',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(),
                                                width: width * 0.4,
                                                child: Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SizedBox(
                                                      height: height * 0.08,
                                                      width: width * 0.35,
                                                      child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            32)),
                                                            primary:
                                                                Colors.white,
                                                          ),
                                                          child: const Text(
                                                            'Continue',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                builder: (context) =>
                                                                    MaterialsPage(
                                                                        score:
                                                                            score),
                                                               ));
                                                          }),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              }
                            },
                            child: Column(
                              children: [
                                Text(
                                  gridTitle[index],
                                  style: TextStyle(
                                      color: gridTextColour[index],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                Image.asset(gridPath[index]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
