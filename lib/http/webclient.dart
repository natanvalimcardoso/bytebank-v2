import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import '../models/contact.dart';
import '../screens/transactions_list.dart';

const String url = 'http://172.19.240.1:8080/transactions';
/* 
class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('Resquest');
    print(' url: ${data.url}');
    print(' headers: ${data.headers}');
    print(' body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Response');
    print('status code: ${data.statusCode}');
    print('headers: ${data.headers}');
    print('body: ${data.body}');
    return data;
  }
} */

Future<List<Transaction>> findAll() async {
  var response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 2));
  final List<dynamic> decodedJson = jsonDecode(response.body);

  final List<Transaction> transactions = [];

  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];
    final Transaction transaction = Transaction(
      transactionJson['value'],
      Contact(
        0,
        contactJson['name'],
        contactJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}

Future<Transaction> save(Transaction transaction) async {// Async é quando não ira retornar nada imediatamente
  final response = await http.post( // await é para esperar a resposta do servidor antes de continuar
    Uri.parse(url),
    body: jsonEncode({
      'value': transaction.value,
      'contact': {
        'name': transaction.contact.name,
        'accountNumber': transaction.contact.accountNumber
      }
    }),
    headers: {'Content-Type': 'application/json', 'password': '1000'},
  );
  Map<String, dynamic> json = jsonDecode(response.body);
  final Map<String, dynamic> contactJson = json['contact'];
 return Transaction(
    json['value'],
    Contact(
      0,
      contactJson['name'],
      contactJson['accountNumber'],
    ),
  );
}
