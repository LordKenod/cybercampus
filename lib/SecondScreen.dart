
import 'package:flutter/material.dart';
import 'dart:convert';


class SecondScreen extends StatelessWidget {
  final String screenTitle;
  const SecondScreen({Key? key, required this.screenTitle}) : super(key: key);



  @override
  Widget build(BuildContext context){
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(

            title: Text(
              screenTitle,
            ),

            backgroundColor: Colors.blueAccent,
            elevation: 0,
          ),

          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white70,
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Добро пожаловать на второй экран!!!!",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,),
                  InkWell(
                    onTap: (){
                      Navigator.pop(context, 'кнопка назад нажата');
                    },
                    child: Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueAccent
                      ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("НАЗАД", style: TextStyle(fontSize: 24),),
                          ],
                        )

                    )
                  )
                ]
            )

          ),
        ), onWillPop: () async {Navigator.of(context).maybePop();
          return false;});//Не трогаем
  }
}



