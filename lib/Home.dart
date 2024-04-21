import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SecondScreen.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
    var listOfLetters = List<String>.of(['а', "б", "в", "г", "д", "е", "ё", "ж",
      "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х",
      "ц", "ч", "ш", "щ", "ъ", "ы", "ь", "э", "ю", "я"]);
    String _textOnContainer = 'Это является контейнером';
    int _counterColor = 0;
    Color _containerColor = Colors.amberAccent;
    void _changeColor() async {
      setState(() {
        if (_counterColor % 2 != 0){
        _containerColor = Colors.blueAccent;}
        else{
          _containerColor = Colors.amberAccent;
        }
      });

    }


    static const counterKey = 'counter';
        int _counter = 0;

        void containerPushed() async{
      setState(() {
        _counter = _counter + 7;
      });
    }

    Future _setCounter() async {
      var prefs = await SharedPreferences.getInstance();
      prefs.setInt(counterKey, _counter);
    }


    @override
    void initState() {
      _initCounter();
      super.initState();
    }

    Future _initCounter() async {
            _counter = await _getCounter();
    }



    Future<int> _getCounter() async {
      var prefs = await SharedPreferences.getInstance();
      return prefs.getInt(counterKey) ?? 0;
    }





    @override
    void didChangeDependencies() {
      super.didChangeDependencies();
    }

    @override
    Widget build(BuildContext context){
      return WillPopScope(
          child: Scaffold(
            appBar: AppBar(

              title: const Text("Главная Страница",
                style: TextStyle(fontSize: 34),),
              backgroundColor: Colors.blueAccent,
              elevation: 0,
            ),

            body: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white70,
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell (
                      onTap: () async{
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const
                          SecondScreen(screenTitle: "Второй Экран",)),
                        );

                        print(result);
                      },
                      child: Container (
                        width: 400,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.amberAccent
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("На Второй Экран", style: TextStyle(fontSize:
                            24),),
                          ],
                        ),
                      )
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: <Widget>[
                  InkWell(
                    onTap: (){
                      containerPushed();
                      _setCounter();
                    },
                    child: Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.amberAccent
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(_counter.toString(), style: const
                          TextStyle(fontSize: 24),),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      _counterColor += 1;
                      _changeColor();
                    },
                    child: Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: _containerColor
                          ),
                      ),
                    ),
        ]
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: <Widget>[
                      const Icon(
                        Icons.circle,
                        color: Colors.black,
                        size: 100,
                      ),
                      IconButton.filledTonal(
                          color: Colors.black,
                          icon: const Icon(Icons.circle),
                          iconSize: 100,
                          onPressed: (){
                            print(_counter.toString());
                        },
                      ),
                      IconButton.filledTonal(
                          color: Colors.black,
                          icon: const Icon(Icons.circle),
                          iconSize: 100,
                          onPressed: (){
                            setState(() {
                              _counter -= 5;
                            });
                        },
                      )
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      var intValue = Random().nextInt(33);
                      setState(() {
                        _textOnContainer += listOfLetters[intValue];
                      });
                    },
                    child: Container(
                      width: 400,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.amberAccent,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            _textOnContainer,
                            style: const TextStyle(fontSize: 20),
                          )
                        ],
                      )
                    ),
                  ),
                  const Image(image: AssetImage('assets/image.png'))
                ],
              ),
            ),
          ), onWillPop: () async {Navigator.of(context).maybePop();
            return false;});
    }
  }




