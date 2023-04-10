import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MasterDetailPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DetailPage extends StatefulWidget {
  final int data;

  DetailPage(this.data);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DetailWidget(widget.data),
    );
  }
}

class DetailWidget extends StatefulWidget {
  final int data;

  DetailWidget(this.data);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.data.toString(),
              style: TextStyle(fontSize: 36.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

typedef Null ItemSelectedCallback(int value);

class ListWidget extends StatefulWidget {
  final int count;
  final ItemSelectedCallback onItemSelected;

  ListWidget(
    this.count,
    this.onItemSelected,
  );

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.count,
      itemBuilder: (context, position) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: InkWell(
              onTap: () {
                widget.onItemSelected(position);
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      position.toString(),
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MasterDetailPage extends StatefulWidget {
  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  var selectedValue = 0;
  var isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }

        return Row(children: <Widget>[
          Expanded(
            child: ListWidget(10, (value) {
              if (isLargeScreen) {
                selectedValue = value;
                setState(() {});
              } else {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DetailPage(value);
                  },
                ));
              }
            }),
          ),
          isLargeScreen
              ? Expanded(child: DetailWidget(selectedValue))
              : Container(),
        ]);
      }),
    );
  }
}

class OrientationDemo extends StatefulWidget {
  @override
  _OrientationDemoState createState() => _OrientationDemoState();
}

class _OrientationDemoState extends State<OrientationDemo> {
  var name = "Deven Joshi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildVerticalLayout()
              : _buildHorizontalLayout();
        },
      ),
    );
  }

  Widget _buildVerticalLayout() {
    return Center(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Icon(
              Icons.account_circle,
              size: 100.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 32.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              "Demo Data",
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              "Demo Data",
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              "Demo Data",
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              "Demo Data",
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              "Demo Data",
              style: TextStyle(fontSize: 22.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              "Demo Data",
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalLayout() {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Icon(
                    Icons.account_circle,
                    size: 100.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 32.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(6, (n) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 32.0),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
