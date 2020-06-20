import 'package:url_launcher/url_launcher.dart';
import 'package:jsonlist/main.dart';

class CallsAndMessagesService {
  void call(String number) => launch("tel:$number");
  void callT(String number1) => launch("tel:$number1");

  void sendSms(String number) => launch("http:wa.me/08027914691");

  void sendEmail(String email) => launch("mailto:$email");

}