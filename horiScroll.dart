import 'package:flutter/material.dart';

class signUpState extends StatefulWidget {
  @override
  _ClassNameState createState() => _ClassNameState();
}


class _ClassNameState extends State<signUpState> {

  PageController _pageController;
  int currentPage = 0;

  @override
   void initState(){
     super.initState();
     _pageController = PageController(
       initialPage: currentPage, 
       keepPage: false, 
       viewportFraction: 0.5,
     );
   }

  Widget build(BuildContext context) {

    var screenW = MediaQuery.of(context).size.width;
    var screenH = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          child: PageView.builder(
            onPageChanged: (value){
              setState(() {
                currentPage = value;
              });
            },
            controller:  _pageController,
            itemBuilder: (context, index) => animateItemBuilder(index),
          ),
        ),
      ),
    );
  }

  animateItemBuilder(int index) {
    return AnimatedBuilder(
      animation: _pageController, 
      builder: (context, child) {
        double value = 1;
        if (_pageController.position.haveDimensions){
          value = _pageController.page - index;
          value = (1-(value.abs() * 0.5)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * 300,
            width: Curves.easeOut.transform(value) * 250,
            child: child,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        color: index % 2 == 0 ? Colors.lightBlue : Colors.purple,
      ),
    );
  }
}
