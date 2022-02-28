import 'package:envairo/view/widgets/toggle_tab.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget{

  const ChatList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          //TODO
        },
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }

  Widget _chatRow(){
    return Container();
  }
}