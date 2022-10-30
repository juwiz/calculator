import 'package:calculator/calculate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'styles.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ColorTheme colorTheme = ColorTheme.darkMode;
  bool isLight = false;

  List<String> onTiles = [
    'AC',
    '!',
    '%',
    '/',
    '7',
    '8',
    '9',
    '*',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    'DEL',
    '0',
    '.',
    '=',
  ];
  List<String> biggerT = [];
  String smallerT = '';

  @override
  Widget build(BuildContext context) {
    final double dWidth = MediaQuery.of(context).size.width;
    final double dHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: colorTheme.backgroundDark,
        body: SafeArea(
          child: Column(
            children: [
              // row w change theme buttoms
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // turn on dark mode button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      fixedSize: Size(dWidth * 0.1, dWidth * 0.1),
                      backgroundColor: colorTheme.backgroundLight,
                    ),
                    onPressed: () => setState(() {
                      colorTheme = ColorTheme.darkMode;
                      isLight = false;
                    }),
                    child: isLight
                        ? Icon(
                            Icons.nightlight_outlined,
                            color: colorTheme.others,
                          )
                        : Icon(
                            Icons.nightlight_round,
                            color: colorTheme.textColor,
                          ),
                  ),

                  // turn on light mode button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      fixedSize: Size(dWidth * 0.1, dWidth * 0.1),
                      backgroundColor: colorTheme.backgroundLight,
                    ),
                    onPressed: () => setState(() {
                      colorTheme = ColorTheme.lightMode;
                      isLight = true;
                    }),
                    child: isLight
                        ? Icon(
                            Icons.wb_sunny,
                            color: colorTheme.textColor,
                          )
                        : Icon(
                            Icons.wb_sunny_outlined,
                            color: colorTheme.others,
                          ),
                  ),
                ],
              ),
              /////////////////////////////////////////////////////////////////
              //stack w sizedbox and two texts in right bottom corner, texts can be null

              Padding(
                padding:
                    EdgeInsets.only(left: dWidth * 0.1, right: dWidth * 0.1),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(
                      height: dHeight * 0.3,
                      width: dWidth,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        sText(smallerT, 25, colorTheme.textColor),
                        SizedBox(
                          height: dHeight * 0.01,
                        ),
                        sText(biggerT.join(), 50, colorTheme.textColor),
                        SizedBox(
                          height: dHeight * 0.02,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /////////////////////////////////////////
              //container w gridview builder

              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                      left: dWidth * 0.1,
                      right: dWidth * 0.1,
                      top: dHeight * 0.05),
                  decoration: BoxDecoration(
                    color: colorTheme.backgroundLight,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: GridView.builder(
                      itemCount: 20,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: dWidth * 0.03,
                        mainAxisSpacing: dWidth * 0.03,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (context, index) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colorTheme.buttomColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          onPressed: () {
                            setState(() {
                              biggerT.add(onTiles[index]);
                              onTiles[index] == 'DEL'
                                  ? biggerT.removeRange(0, biggerT.length)
                                  : null;

                              if (onTiles[index] == 'AC') {
                                biggerT.removeRange(0, biggerT.length);
                                smallerT = '';
                              }
                              
                              if (onTiles[index] == '=') {
                                biggerT.removeLast();
                                smallerT = biggerT.join();

                                biggerT[0] = calculate(biggerT);
                                biggerT.removeRange(1, biggerT.length);
                              }
                            });
                          },
                          child: sText(
                              onTiles[index],
                              20,
                              int.tryParse(onTiles[index]) == null
                                  ? colorTheme.operatorColor
                                  : colorTheme.textColor),
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
