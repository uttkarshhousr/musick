import 'package:flutter/material.dart';

class SearchBarCustom extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchBarCustom({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      decoration: BoxDecoration(
        // color:Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all( color:Theme.of(context).colorScheme.secondary,),
        // boxShadow: [
        //   BoxShadow(
        //     color:Theme.of(context).colorScheme.background,
        //     // spreadRadius: 2,
        //     // blurRadius: 5,
        //     // offset: Offset(0, 3),
        //   ),
        // ],
      ),
      child: TextField(
        
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          
          hintText: 'Search by song name or artist',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12.0),
        ),
      ),
    );
  }
}
