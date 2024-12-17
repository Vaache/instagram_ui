import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _controller =
      TextEditingController(); // Контроллер для TextField
  final List<String> _comments = []; // Список для хранения комментариев

  void _addComment() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _comments.add(_controller.text); // Добавляем текст в список
        _controller.clear(); // Очищаем поле ввода
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller, // Подключаем контроллер
              decoration: InputDecoration(
                labelText: 'Enter your comment',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addComment, // Вызываем функцию добавления комментария
            child: Text('Add Comment'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                      child: Text('${index + 1}')), // Порядковый номер
                  title: Text(_comments[index]), // Текст комментария
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
