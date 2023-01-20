import 'package:bottomview/core/extentions/generator_ext.dart';
import 'package:bottomview/core/extentions/notification_listener_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreenEmails extends StatelessWidget {
  final Function(bool) inScrollDown;

  const ScreenEmails({Key? key, required this.inScrollDown}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              TabBar(
                tabs: [
                  Tab(
                    text: 'Emails',
                  ),
                  Tab(
                    text: 'Favorites',
                  ),
                  Tab(
                    text: 'Marketing',
                  ),
                  Tab(
                    text: 'Important',
                  ),
                ],
              )
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            children: [
              EmailList(
                inScrollDown: inScrollDown,
              ),
              const Icon(
                Icons.camera,
                size: 150,
              ),
              const Icon(
                Icons.chat,
                size: 150,
              ),
              const Icon(
                Icons.chat,
                size: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailList extends StatefulWidget {
  final Function(bool) inScrollDown;

  const EmailList({Key? key, required this.inScrollDown}) : super(key: key);

  @override
  State<EmailList> createState() => _EmailListState();
}

class _EmailListState extends State<EmailList> {
  final items = generateStringList(10000);

  bool _handleScrollNotification(ScrollNotification notification) =>
      notification.handleScrollDirection((p0) => {widget.inScrollDown(p0)});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
