import 'package:flutter/material.dart';

class ColorListView extends StatefulWidget {
  final Function(Color?) onvalue;
  const ColorListView({super.key, required this.onvalue});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  List<MaterialColor> taskColor = [
    Colors.amber,
    Colors.blue,
    Colors.brown,
    Colors.red,
    Colors.purple,
    Colors.deepOrange,
  ];
  int activeIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              activeIndex = index;
              widget.onvalue(taskColor[index]);
            });
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: taskColor[index],
            child: activeIndex == index
                ? Center(child: Icon(Icons.check))
                : null,
          ),
        ),

        separatorBuilder: (context, index) => SizedBox(width: 15),
        itemCount: taskColor.length,
      ),
    );
  }
}
