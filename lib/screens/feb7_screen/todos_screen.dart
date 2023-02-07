import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

class DisplayTodos extends StatelessWidget {
  const DisplayTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodosScreen(
      todos: List.generate(
          20,
          (index) => Todo('Todo $index',
              'A description of what needs to be done for Todo $index')),
    );
  }
}

class TodosScreen extends StatelessWidget {
  const TodosScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Title'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Hero(
            tag: 'demo',
            child: Card(
              child: ListTile(
                title: Text(todos[index].title),
                onTap: () async {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(todo: todos[index])));
                  // _navigateAndDisplaySelection(context, todos[index]);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(result),
                    duration: const Duration(seconds: 1),
                  ));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Hero(
        tag: 'demo',
        child: Column(
          children: [
            Text(
              todo.description,
              style: const TextStyle(
                fontSize: 28.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, todo.description);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60.0),
                  ),
                  child: Text(
                    todo.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
