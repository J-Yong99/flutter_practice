import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'prc',
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('prc mode'),
      ),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('like a new snack bar'),
            duration: Duration(seconds: 5),
            action: SnackBarAction(
              label: 'undo',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ThirdPage()));
              },
            ),
          ));
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: Text('go to the second page'),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondPage()));
      },
    ));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body: Center(
        child: Text(
          '좋아요가 추가되었습니다',
          style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          title: Text('third page'),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '좋아요를 취소 하시겠습니까?',
                  style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                ),
                ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('좋아요가 취소되었습니다'),
                        duration: Duration(seconds: 3),
                      ));
                    },
                    child: Text('취소하기'))
              ],
            ),
          );
        }),
      ),
    );
  }
}
