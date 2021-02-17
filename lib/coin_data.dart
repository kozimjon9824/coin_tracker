import 'dart:convert';
import 'package:http/http.dart' as http ;

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '03FE9669-CD81-4543-8100-811495661E1C';

class NetWorkHelper {
   Future getCoinData(String selectedCurrency) async {
     Map<String,String> list={};

     for(String crypto in cryptoList){
       String url='$coinAPIURL/$crypto/$selectedCurrency?apiKey=$apiKey';

       http.Response response=await http.get(url);

       if(response.statusCode==200){
         var decodeData=jsonDecode(response.body);
         double  rate=decodeData['rate'];
         list[crypto]=rate.toStringAsFixed(0);
       }else{
         print(response.statusCode);
         throw Exception('Problem with request');
       }
     }
     return list;
   }

}



const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
