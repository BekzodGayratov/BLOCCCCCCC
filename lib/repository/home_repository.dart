import 'dart:io';
import 'package:bloccc/models/currency_model.dart';
import 'package:bloccc/service/get_users_service.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HomeRepository {
  Box<CurrencyModel>? currencyBox;

  CurrencyService currencyService = CurrencyService();

  Future<dynamic> getCurrency() async {
    return await currencyService.getCurrency().then((dynamic response) async {
      if (response is List<CurrencyModel>) {
        await openBox();
        await putToBox(response);
        if (response.isEmpty) {
          return "Currency ma'lumotlari hali yaratilmagan";
        } else {
          return currencyBox;
        }
      } else {
        return response;
      }
    });
  }

  Future<void> openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
    currencyBox = await Hive.openBox("currencyBox");
  }

  static Future<void> registerAdapter() async {
    Hive.registerAdapter(CurrencyModelAdapter());
  }

   Future<void> putToBox(List<CurrencyModel> users) async {
    await currencyBox!.clear();
    for (int i = 0; i < users.length; i++) {
      await currencyBox!.add(users[i]);
    }
  }
}
