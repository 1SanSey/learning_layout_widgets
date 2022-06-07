import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Бхагавад-гита как она есть',
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          iconTheme: const IconThemeData(color: Colors.black54),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _bookImage(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _bookSale(),
                _bookRatings(),
                const Divider(),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: _bookDescription(),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _bookImage() {
  return const Image(
    image: NetworkImage(
        'https://storage.googleapis.com/glide-prod.appspot.com/uploads-v2/adkbPF6XNVMJlz8JKoWp/pub/K7D41tCLh5vokfjOkLNV.jpg'),
    fit: BoxFit.cover,
  );
}

Column _bookDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const <Widget>[
      Text(
        'Бхагавад-гита как она есть',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
      Text(
        '''«Бхагавад-гита» (переводится как «Божественная песнь») — великий памятник ведической философской мысли на санскрите, шестая часть эпоса «Махабхараты», состоящая из 18 глав и 700 стихов. Это писание, которое было поведано в 3139 году до нашей эры, является одним из самых древних эзотерических произведений в истории человечества.
        
        Бхагавад-гита представляет собой диалог Верховного Господа Шри Кришны с Его другом Арджуной, состоявшийся на поле Курукшетра перед началом великой битвы. 
        
        Люди, изучающие Ведические писания, утверждают, что Бхагавад-гита является квинтэссенцией всех Вед. Так же ее часто называют «Гита-упанишада», то есть относят к упанишадам — сложнейшим философским текстам, описывающим Абсолютную Истину. Но при этом она написана простым языком и находится в составе итихасы — исторического повествования («Махабхараты»). Объясняется это тем, что Бхагавад-гита рассказана специально для нас — людей этого века, которым сложно пробиться через многозначность и сложный язык упанишад.''',
        style: TextStyle(fontSize: 17, color: Colors.black54),
      ),
    ],
  );
}

Row _bookSale() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Добавить в корзину',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                fixedSize: MaterialStateProperty.all(Size.fromHeight(50)),
              ),
            ),
          )
        ],
      ),
      const SizedBox(width: 16.0),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Выберите количество', style: TextStyle(color: Colors.black87)),
          CounterWidget(),
        ],
      ),
    ],
  );
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _counter;

  @override
  void initState() {
    _counter = 1;
    super.initState();
  }

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  void _decrement() {
    setState(() {
      --_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                onPressed: _decrement,
                icon: Icon(Icons.remove, size: 15),
                color: Colors.white),
            Text(
              '$_counter',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: _increment,
                icon: Icon(Icons.add, size: 15),
                color: Colors.white),
          ]),
    );
  }
}

Row _bookRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
      const Icon(Icons.star, size: 15.0, color: Colors.grey),
    ],
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Padding(
        padding: EdgeInsets.only(top: 30.0),
        child: const Text(
          'Рейтинг товара',
          style: TextStyle(fontSize: 15.0),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 30.0),
        child: stars,
      ),
    ],
  );
}
