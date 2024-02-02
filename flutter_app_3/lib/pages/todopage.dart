import 'package:flutter/material.dart';
import 'package:flutter_app_3/database/todo_db.dart';
import 'package:flutter_app_3/models/todo.dart';
import 'package:flutter_app_3/widget/create_todo_widget.dart';
import 'package:intl/intl.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});
  @override
  State<TodoPage> createState() => _TodoPageState();

}

class _TodoPageState extends State<TodoPage> {
  Future<List<Todo>>? futureTodo;
  final todoDB = TodoDB();

  @override 
  void initState() {
    super.initState();
    fetchTodos();
  }

  void fetchTodos() {
    setState(() {
      futureTodo = todoDB.fetchAll();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: futureTodo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final todos = snapshot.data!;
            if(todos.isEmpty){
              return const Center(
                child: Text(
                  'No todos..',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26
                  )
                ),
              );
            } else {
              return ListView.separated(
              itemBuilder: (context, index){
                final todo = todos[index];
                final subtitle = DateFormat('yyy/MM/dd').format(DateTime.parse(todo.updatedAt ?? todo.createdAt));
                return ListTile(
                  title: Text(
                    todo.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(subtitle),
                  trailing: IconButton(
                    onPressed: () async {
                      await todoDB.delete(todo.id);
                      fetchTodos();
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                  onTap: () {
                    showDialog(
                      context: context, 
                      builder: (context) => CreateTodoWidget(
                        todo: todo,
                        onSubmit: (title) async {
                          await todoDB.update(id: todo.id, title: title);
                          fetchTodos();
                          if (!mounted) return;
                          Navigator.of(context).pop();
                        } 
                      )
                    );
                  },
                );
              }, 
              separatorBuilder: (context, index) => const SizedBox(height: 12), 
              itemCount: todos.length,
            );
          }
        }
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context, 
            builder: (_) => CreateTodoWidget(
              onSubmit: (title) async {
                await todoDB.create(title: title);
                if (!mounted) return;
                fetchTodos();
                Navigator.of(context).pop();
              }
            ),
          );
        } 
      ),
    );
  }
}

//https://www.youtube.com/watch?v=9kbt4SBKhm0