import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yy_new/transaction/transcation_model.dart';

import '../main.dart';
import '../utils/app_singleton.dart';
import '../utils/http_manager.dart';

class TransactionRequest {
  /**
   * query user transaction request
   */
  // static Future<List<TransactionModel>> queryTransaction(type, current) async {
  //   current = current - 1;
  //   String? url = type == 0 || type == 4 || type == 5
  //       ? AppSingleton.userInfoModel?.email
  //       : AppSingleton.userInfoModel?.rpWalletAddress.toString();
  //   var result = await HttpManager.get(
  //       url:
  //           "transaction/queryTransactionV2?type=$type&email=$url&pageSize=10&currentNum=$current");
  //   log("transaction result ${jsonEncode(result)}");
  //   List<TransactionModel> list = [];
  //   try {
  //     if (result["data"] != null &&
  //         result["code"] == 200 &&
  //         result["data"]["records"] != null) {
  //       List temp = result["data"]["records"];
  //       for (var element in temp) {
  //         list.add(TransactionModel.fromJson(element));
  //       }
  //     } else {
  //       EasyLoading.showError(result["message"] ?? "query transaction error");
  //     }
  //   } catch (err) {
  //     log("query user transaction model fail ${err.toString()}");
  //   } finally {}
  //   return Future.value(list);
  // }

  static Future<List<UserInfoModel>> queryReferral(current) async {
    var result = await HttpManager.get(
        url:
            "/user/queryReferrals?inviteCode=${AppSingleton.userInfoModel?.inviteCode.toString()}&pageSize=10&currentNum=$current");
    log("query referral res $result");
    List<UserInfoModel> list = [];
    try {
      if (result["data"] != null && result["code"] == 200) {
        List temp = result["data"];
        temp.forEach((element) {
          list.add(UserInfoModel.fromJson(element));
        });
      } else {
        EasyLoading.showError(result["message"] ?? "query transaction error");
      }
    } catch (err) {
      log("query user transaction model fail ${err.toString()}");
    } finally {}
    return Future.value(list);
  }
}
