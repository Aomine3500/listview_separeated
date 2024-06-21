import 'package:flutter/material.dart';

class Post {
  final String username;
  final String userImageUrl;
  final String timestamp;
  final String contentText;
  final String contentImageUrl;

  Post({
    required this.username,
    required this.userImageUrl,
    required this.timestamp,
    required this.contentText,
    required this.contentImageUrl,
  });
}

List<Post> posts = [
  Post(
    username: 'John Doe',
    userImageUrl: 'https://picsum.photos/250?image=237',
    timestamp: '2h30',
    contentText: 'Enjoying the beautiful sunset at the beach!',
    contentImageUrl: 'https://picsum.photos/250?image=51',
  ),
  Post(
    username: 'Mark Spencer',
    userImageUrl: 'https://picsum.photos/250?image=238',
    timestamp: '1d 1h',
    contentText: 'Just got back from a fun vacation in the mountains.',
    contentImageUrl: 'https://picsum.photos/250?image=52',
  ),
  // Add more sample posts
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Separeated ListView',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("ListView Separeated"),
            ),
            body: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(posts[index].userImageUrl)),
                        title: Text(posts[index].username),
                        subtitle: Text(posts[index].timestamp),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(posts[index].contentText),
                      ),
                      Image.network(posts[index].contentImageUrl),
                    ],
                  ),
                );
              },
            )));
  }
}
