import 'package:ecommerce2/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Contineroffer extends StatelessWidget {
  const Contineroffer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .26,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                               'Clearence',
                                style: TextStyle(
                                    fontSize: 32, color: Colors.white),
                              ),
                              Text(
                                'Sales ',
                                style: TextStyle(
                                    fontSize: 32, color: Colors.white),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.white,
                                ),
                                child: Center(
                                    child: Text(
                                  '% Up To 50 %',
                                  style: TextStyle(fontSize: 16, color: color),
                                )),
                              )
                            ],
                          ),
                           Center(
            child: LottieBuilder.asset(
              'assets/json/Animation - 1727792847036 (1).json',
              width: 200,
              height: 200,
            ),
          ),
                        ],
                      ),
                    ),
                  );
  }
}