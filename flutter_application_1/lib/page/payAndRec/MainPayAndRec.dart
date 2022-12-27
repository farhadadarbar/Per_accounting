

import 'package:flutter/material.dart';

import '../../api/Model/UserModel.dart';
import '../../api/Service/UserService.dart';

class PayAndRec extends StatefulWidget {
  const PayAndRec({Key? key}) : super(key: key);

  @override
  State<PayAndRec> createState() => _PayAndRecState();
}

class _PayAndRecState extends State<PayAndRec> {
  late List<User> _items;
  late UserService campaignService;
  double cash=0;
  void add(){
    setState(() {
      cash=cash+1;
    });
  }
  void dis(){
    setState(() {
      cash=cash-1;
    });
  }
  @override
  void initState() {
    super.initState();
    campaignService = UserService();
    _items = [];
    cash=0;
    this.fetchAll();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 247, 252, 30),
      appBar: AppBar(
        title:  Text("وەرگرتن/پێدان"),
        backgroundColor:const  Color.fromARGB(230, 100, 95, 189),
      ),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Container(
                  width: MediaQuery.of(context).size.width ,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap:(){
                                add();
                              },
                                child: Icon(Icons.add_box,size: 40,)),
                            const SizedBox(width: 40,),
                            Text("$cash"),
                           const SizedBox(width: 40,),
                            InkWell(
                                onTap:(){
                                  dis();
                                },
                                child: Icon(Icons.indeterminate_check_box,size: 40,)),
                          ],
                        ),
                      ),

                      Container(
                        height: 100,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(

                            children: [
                              ListView.builder(
                                  itemCount:6,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context ,index){
                                    return  Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                          width: 100 ,
                                        height: 40,
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                                          color: Colors.grey[300]
                                        ),

                                          child: Center(child: Text("$indexصندوق",))),
                                    );
                                  }
                              )
                            ],
                          ),
                        ),
                      )                    ],
                  ),
                ),
              ),
               Card(
                child: Container(
                  width: MediaQuery.of(context).size.width ,
                  color: Colors.white,
                  height: 100,
                  child:SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(

                      children: [
                        ListView.builder(
                            itemCount:6,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context ,index){
                              return  Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                    width: 100 ,
                                    height: 40,
                                    decoration:BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                                        color: Colors.blue
                                    ),

                                    child: Center(child: Text("$indexنفر",))),
                              );
                            }
                        )
                      ],
                    ),
                  ),
                ),
                
              )
            ],
          ),
        )
      ),
    );
  }
  void fetchAll() {
    campaignService.fetchAll().then((onValue) {
      setState(() {
        _items = onValue;
        print(_items);
      });
    }).catchError((onError) {
      print('catchError: $onError');
    });
  }
}


