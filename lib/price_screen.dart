import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coin_tracker/components/reusable_card.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency='USD';

  Map<String,String> coinValue={};
  bool isWaiting=false;

  void getData() async {
    isWaiting=true;
    try{
      var value  = await NetWorkHelper().getCoinData(selectedCurrency);
      isWaiting=false;
      setState(() {
        coinValue=value;
      });

    }catch(e){
      print(e);
    }
  }


  String showCoin(String value){
    //print(coinValue[value]);
    return isWaiting?'1$value = ? $selectedCurrency':'1$value = ${coinValue[value]} $selectedCurrency';
  }

  List<Widget> showPickerList(){
    List<Text> list = [] ;
    for(String index in currenciesList){
      list.add(Text(index,textAlign: TextAlign.center ,style: TextStyle(color: Colors.white,fontSize: 17.0)));
    }
    return list;
  }



  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Coin Ticker'),backgroundColor: Colors.lightBlue,),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 16.0),
                child: ReusableCard(showCoin('BTC')),//'BTC', 'ETH', 'LTC'
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 16.0),
                child: ReusableCard(showCoin('ETH')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 16.0),
                child: ReusableCard(showCoin('LTC')),
              ),

            ],
          ),

          Container(
            alignment: Alignment.center,
           color: Colors.lightBlue,
           height: 130.0,
           child: CupertinoPicker(
             onSelectedItemChanged: (int value) {
               setState(() {
                 selectedCurrency=currenciesList[value];
                 getData();
               });
               print(value);
             },
             itemExtent: 32.0,
             children:showPickerList(),
             
           ),
         )
        ]

      ) ,
    );
  }
}
