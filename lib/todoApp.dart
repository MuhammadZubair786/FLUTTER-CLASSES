// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List todoData = [];
  TextEditingController controller = TextEditingController();

  final ScrollController listcontroller = ScrollController();
  bool editStatus = false;
  var currentindex;

  void addTodo() {
    if (controller.text.length == 0) {
      const snackBar = SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.warning,
              color: Colors.yellow,
            ),
            Text('Please enter data'),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        snackBar,
      );
      // controller.text = "pleaese enter data";
    } else {
      // todoData.add(controller.text);
      todoData.insert(0, controller.text);
      controller.clear();
      if (listcontroller.hasClients) {
        var position = listcontroller.position.minScrollExtent;
        listcontroller.animateTo(position,
            duration: Duration(microseconds: 1), curve: Curves.easeInOutBack);
      }

      setState(() {});
    }
  }

  void deleteTodo(index) {
    // print(todoData[index]);
    todoData.removeAt(index);
    setState(() {});
  }

  void editTodo(){
    if(controller.text.isNotEmpty){
        todoData[currentindex] = controller.text;
        editStatus = false;
        controller.text = "";
        setState(() {
          
        });

    }
  


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo App")),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            if (editStatus==true) {
              controller.text = "";
              editStatus = false;
              setState(() {});
            }
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                              hintText: "Enter data",
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                              suffixIcon: Container(
                                width: 20,
                                height: 20,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1, color: Colors.grey)),
                                child: IconButton(
                                    onPressed: editStatus
                                        ? () {
                                          editTodo();
                                        }
                                        : () {
                                            addTodo();
                                          },
                                    icon: Icon(
                                      editStatus ? Icons.edit : Icons.add,
                                      size: 20,
                                      color: Color.fromARGB(255, 247, 247, 247),
                                    )),
                              ))),
                    )
                  ],
                ),
              ),
              Container(
                height: 430,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: todoData.length,
                    controller: listcontroller,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onDoubleTap: () {
                          controller.text = todoData[index];
                          editStatus = true;
                          currentindex =index;
                          setState(() {});
                          print(todoData[index]);
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
                          child: Card(
                            color: Colors.indigo,
                            elevation: 10,
                            child: ListTile(
                                title: Text(
                                  todoData[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    deleteTodo(index);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: const Color.fromARGB(
                                        255, 236, 234, 234),
                                  ),
                                )),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
