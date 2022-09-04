import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled1/modules/bmi_results/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale =true;
  double height = 120;
  int weight = 40;
  int age = 12;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI calculator',
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child:
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/img_287560.png'),
                                height: 110,
                                width: 110,
                              ),
                              Text(
                                'MALE',
                                style: TextStyle(
                                    fontSize: 20.0
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: isMale ? Colors.blue: Colors.grey,
                          ),
                        ),
                        onTap: ()
                        {
                          setState(() {
                            isMale = true;
                          }
                          );
                        }
                        ,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                            isMale =false;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/R.png'),
                                height: 110,
                                width: 110,
                              ),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                    fontSize: 20.0
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: !isMale ? Colors.blue:Colors.grey,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child:Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900
                          ),
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        value: height,
                        max: 220.0,
                        min: 80.0,
                        onChanged: (value)
                        {
                          setState(() {
                            height = value;
                          });
                        }
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey
                ),
              ),
            ),
          ),
          Expanded(child:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children:
              [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          '${age}',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            FloatingActionButton(onPressed: ()
                            {
                              setState(() {
                                age--;
                              });
                            },
                              heroTag: 'age-',
                              mini: true,
                              child: Icon(Icons.remove) ,),
                            FloatingActionButton(onPressed: ()
                            {
                              setState(() {
                                age++;
                              });
                            },
                              heroTag: 'age+',
                              mini: true,
                              child: Icon(Icons.add) ,),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'weight',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          '${weight}',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            FloatingActionButton(onPressed: ()
                            {
                              setState(() {
                                weight--;
                              });
                            },
                              heroTag: 'weight-',
                              mini: true,
                              child: Icon(Icons.remove) ,),
                            FloatingActionButton(onPressed: ()
                            {
                              setState(() {
                                weight++;
                              });
                            },
                              heroTag: 'weight+',
                              mini: true,
                              child: Icon(Icons.add) ,),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey
                    ),
                  ),
                ),
              ],
            ),
          )
          ),
          MaterialButton(onPressed: ()
          {
            var result = weight / pow(height/100, 2);
            print(result.round());
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=> BmiScreen_result(
                        result: result.round(),
                        age: age,
                        isMale: isMale
                    ),
                ),
            );
          },
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: Center(
                child: Text(
                  'CALCULATE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white
                  ),

                ),
              ),
            ),
            color: Colors.red,
          )
        ],
      ),
    );
  }
}




