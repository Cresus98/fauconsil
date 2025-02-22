//package:path/path.dart
//package:sqflite/sqflite.dart








/*

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  Database? _database;
  List<Map<String, dynamic>> _todos = [];

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final dbPath = join(databasesPath, 'todo.db');

    _database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todos (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT)',
        );
      },
    );

    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final data = await _database!.query('todos');
    setState(() {
      _todos = data;
    });
  }

  Future<void> _addTodo(String title) async {
    await _database!.insert(
      'todos',
      {'title': title},
    );
    _loadTodos();
  }

  Future<void> _deleteTodo(int id) async {
    await _database!.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
    _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return ListTile(
            title: Text(todo['title']),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => _deleteTodo(todo['id']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTodo = await showDialog<String>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add Todo'),
              content: TextField(
                autofocus: true,
                decoration: const InputDecoration(hintText: 'Enter todo'),
                onSubmitted: (value) {
                  Navigator.of(context).pop(value);
                },
              ),
            ),
          );

          if (newTodo != null) {
            _addTodo(newTodo);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

*/
