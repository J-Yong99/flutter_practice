import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../main.dart';

Inout _var = Inout.Out;

class Life extends StatefulWidget {
  const Life({Key? key}) : super(key: key);

  @override
  _LifeState createState() => _LifeState();
}

class _LifeState extends State<Life> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  Money? tmp;
  late Money tmp2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Life'),
          backgroundColor: Colors.blueGrey,
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.money),
              child: Text('Income'),
            ),
            Tab(
              icon: Icon(Icons.sell_outlined),
              child: Text('Outgoing'),
            ),
          ]),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: Icon(Icons.home))
          ],
        ),
        body: Stack(children: [
          TabBarView(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('life_money_in')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) CircularProgressIndicator();
                    return Expanded(
                        child: ListView(
                            children: snapshot.data!.docs
                                .map((doc) => _buildList(doc))
                                .toList()));
                  }),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('life_money_out')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) CircularProgressIndicator();
                    return Expanded(
                        child: ListView(
                            children: snapshot.data!.docs
                                .map((doc) => _buildList(doc))
                                .toList()));
                  }),
            ],
          ),
          Positioned(
              bottom: 10.0,
              right: 167.0,
              child: IconButton(
                  color: Colors.grey[600],
                  iconSize: 60.0,
                  onPressed: () async {
                    tmp = await inputCost(context).then((value) => (value));
                    if (tmp != null) {
                      if (tmp!.inorout == true) {
                        setState(() {
                          life += int.parse(tmp!.cost!);
                          _addList(tmp!);
                        });
                      }

                      if (tmp!.inorout == false) {
                        setState(() {
                          life -= int.parse(tmp!.cost!);
                          _addList(tmp!);
                        });
                      }
                    }
                  },
                  icon: Icon(Icons.add)))
        ]),
      ),
    );
  }

  void _addList(Money mon) {
    if (mon.inorout == true) {
      FirebaseFirestore.instance.collection('life_money_in').add({
        'date': mon.date,
        'inorout': mon.inorout,
        'cost': mon.cost,
        'memo': mon.memo
      });
    } else if (mon.inorout == false) {
      FirebaseFirestore.instance.collection('life_money_out').add({
        'date': mon.date,
        'inorout': mon.inorout,
        'cost': mon.cost,
        'memo': mon.memo
      });
    }
  }

  void _deleteList(DocumentSnapshot doc) {
    if (doc['inorout'] == true)
      FirebaseFirestore.instance
          .collection('life_money_in')
          .doc(doc.id)
          .delete();
    else if (doc['inorout'] == false)
      FirebaseFirestore.instance
          .collection('life_money_out')
          .doc(doc.id)
          .delete();
  }

  Widget _buildList(DocumentSnapshot doc) {
    final _money = Money(doc['date'], doc['cost'], doc['memo']);
    return ListTile(
        onTap: () {},
        trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () {
            _deleteList(doc);
          },
        ),
        title: Text(
            'date:${_money.date},cost:${_money.cost},memo:${_money.memo}'));
  }

  Future<Money?> inputCost(BuildContext context) async {
    late bool result;
    var tmp = await showDialog<List>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: Text(
              'Enter cost',
              textAlign: TextAlign.center,
            ),
            content: Form(
              key: _formKey,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Income'),
                    leading: Radio<Inout>(
                      value: Inout.In,
                      groupValue: _var,
                      onChanged: (Inout? val) {
                        setState(() {
                          _var = val!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Outgoing'),
                    leading: Radio<Inout>(
                      value: Inout.Out,
                      groupValue: _var,
                      onChanged: (Inout? val) {
                        setState(() {
                          _var = val!;
                        });
                      },
                    ),
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    autofocus: true,
                    controller: controller,
                    decoration: InputDecoration(labelText: 'Date EX: 08/11'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    autofocus: true,
                    controller: controller2,
                    decoration: InputDecoration(labelText: 'Cost EX : 10000'),
                    keyboardType: TextInputType.number,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    autofocus: true,
                    controller: controller3,
                    decoration: InputDecoration(labelText: 'Memo'),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, [
                        controller.text,
                        controller2.text,
                        controller3.text,
                        _var
                      ]);
                    }
                  },
                  child: Text('done'))
            ],
          );
        }).then((value) {
      return value;
    });
    if (_var == Inout.In) {
      result = true;
    } else {
      result = false;
    }
    if (tmp?[0] != null && tmp?[1] != null && tmp?[2] != null) {
      final buf = Money(tmp?[0], tmp?[1], tmp?[2], inorout: result);
      resetController(controller, controller2, controller3);
      return buf;
    }
    return null;
  }

  void resetController(
    TextEditingController con,
    TextEditingController con2,
    TextEditingController con3,
  ) {
    con.text = '';
    con2.text = '';
    con3.text = '';
  }
}
