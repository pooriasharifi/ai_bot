import 'package:ai_bot/screen/Models/symbols.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'as convert;
class HomeController extends GetxController{
  RxBool loading =true.obs;
  RxBool crypto =false.obs;
  RxBool stock =false.obs;
  RxBool forex =false.obs;

  RxBool err =false.obs;
  RxList<FetchData> data = <FetchData>[].obs;




  setData()async{
    var url = Uri.parse('https://api.nomics.com/v1/currencies?key=7a8f943a531b069cc54dcd7d9f93e35d1c39324f&ids=BTC,ETH,XRP,USDT,BNB,USDC,ADA,SOL,LUNA,AVAX,BUSD,DOGE,UST,WBTC,SHIB,MATIC,CRO,DOT,DAI,LTC,ATOM,LINK,TRX,FTT,BDH,LEO,ALGO&attributes=id,name,logo_url&sort%09=first_priced_at');
    var response = await http.get(url, );
    data.clear();

    print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    if(response.statusCode==200){
      var jsonResponse =convert.jsonDecode(response.body);
      // print(jsonResponse);
      jsonResponse.forEach((element){
        data.add(FetchData.fromJson(element));
        // print(element['logo_url']);

      });
      
    }else{
      err=true.obs;
    }
    loading=false.obs;
    update();
    // print(await http.read(Uri.parse('https://example.com/foobar.txt')));
  }

}