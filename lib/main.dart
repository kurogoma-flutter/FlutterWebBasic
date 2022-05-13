import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Webに挑戦'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        backgroundColor: Theme.of(context).canvasColor,
        leadingWidth: 160,
        leading: GestureDetector(
          child: Image.network(
            'assets/tank-wide.png',
            width: 160,
            height: 60,
            fit: BoxFit.fill,
          ),
          onTap: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.search_rounded,
                    size: 24,
                    color: Colors.black45,
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.person_pin,
              size: 30,
              color: Colors.blueAccent,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 15),
          IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
              color: Colors.blueAccent,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Row(
        children: [
          /// ジャンル一覧・ボタンエリア
          SizedBox(
            width: size.width * 0.2,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.35,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(horizontal: BorderSide(color: Colors.black12)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: size.width * 0.12,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text('質問を作成する'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.12,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text('ジャンルを新規作成'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.12,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text('招待をする'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.12,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text('ルームの新規作成'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 24),
                      const Text('ジャンル一覧', style: TextStyle(fontSize: 24)),
                      const SizedBox(height: 24),
                      Column(
                        children: const <Widget>[
                          GenreTextButton(),
                          GenreTextButton(),
                          GenreTextButton(),
                          GenreTextButton(),
                          GenreTextButton(),
                          GenreTextButton(),
                          GenreTextButton(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// QA一覧
          DefaultTabController(
            length: 4,
            child: Container(
              width: size.width * 0.3,
              decoration: const BoxDecoration(
                border: Border.symmetric(vertical: BorderSide(color: Colors.black12)),
              ),
              child: Column(
                children: [
                  const TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), color: Colors.blueAccent),
                    tabs: [
                      Tab(text: "未解答"),
                      Tab(text: "確認中"),
                      Tab(text: "解答済"),
                      Tab(text: "解決済"),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
                      ListView(
                        children: const [
                          QATile(),
                          QATile(),
                          QATile(),
                          QATile(),
                          QATile(),
                        ],
                      ),
                      ListView(
                        children: const [
                          QATile(),
                          QATile(),
                          QATile(),
                          QATile(),
                          QATile(),
                        ],
                      ),
                      ListView(
                        children: const [
                          QATile(),
                          QATile(),
                          QATile(),
                          QATile(),
                          QATile(),
                        ],
                      ),
                      ListView(
                        children: const [
                          QATile(),
                          QATile(),
                          QATile(),
                          QATile(),
                          QATile(),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),

          /// QA詳細エリア
          Container(
            width: size.width * 0.5,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('QAタイトル', style: TextStyle(fontSize: 30)),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(bottom: 1, left: 15, right: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Center(child: Text('解答待ち', style: TextStyle(color: Colors.pink))),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text('タグ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                const SizedBox(height: 30),
                Row(
                  children: const <Widget>[
                    QATagContent(),
                    QATagContent(),
                    QATagContent(),
                    QATagContent(),
                    QATagContent(),
                  ],
                ),
                const SizedBox(height: 30),
                const Text('質問内容', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                const SizedBox(height: 30),
                const Text(
                  'QAコンテンツQAコンテンツQAコンテンツQAコンテンツQAコンテンツQAコンテンツQAコンテンツQAコンテンツQAコンテンツQAコンテンツ\nQAコンテンツQAコンテンツQAコンテンツQAコンテンツQAコンテン\nQAコンテンツQAコンテンツQAコンテンツQAコンテンツ',
                  style: TextStyle(fontSize: 18, height: 2.0),
                ),
                const SizedBox(height: 30),
                const Text('解答', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                const SizedBox(height: 30),
                ListTile(
                  leading: CircleAvatar(),
                  title: Text(
                      '解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト'),
                  trailing: IconButton(
                    icon: Icon(Icons.menu_rounded),
                    onPressed: () {},
                  ),
                ),
                ListTile(
                  leading: CircleAvatar(),
                  title: Text(
                      '解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト解答テキスト'),
                  trailing: IconButton(
                    icon: Icon(Icons.menu_rounded),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GenreTextButton extends StatelessWidget {
  const GenreTextButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {}, child: Text('〜 ジャンル 〜', style: TextStyle(fontSize: 16)));
  }
}

class QATile extends StatelessWidget {
  const QATile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12))),
        child: ListTile(
          leading: const Icon(Icons.blur_circular_sharp, size: 32),
          title: const Text('QAタイトル', style: TextStyle(fontSize: 20)),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 5),
            child: Row(
              children: const [
                QATag(),
                QATag(),
                QATag(),
                QATag(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class QATag extends StatelessWidget {
  const QATag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 20,
        padding: const EdgeInsets.only(bottom: 2, right: 5, left: 5),
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(child: Text('タグテキスト', style: TextStyle(fontSize: 10))),
      ),
      onTap: () {},
    );
  }
}

class QATagContent extends StatelessWidget {
  const QATagContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 32,
        padding: const EdgeInsets.only(bottom: 2, right: 5, left: 5),
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Center(child: Text('タグテキスト', style: TextStyle(fontSize: 14))),
      ),
      onTap: () {},
    );
  }
}
