import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
class Email{
  String username = "orientationweekmanagement@gmail.com";
  String password = "orientation-week-management";
  Future<List<SendReport>> sendEmail(String receipientAddress, int otp) async{
    final smtpServer = gmail(username, password);
    final message = new Message()
      ..from = new Address(username,"OWMS")
      ..recipients.add(receipientAddress)
      ..subject = 'Verification Code'
      ..html = '<center>Your Verification Code for<br>'
          ' <strong>Orientation Week Management System</strong>'
          '<h1>$otp</h1> This Verification Code will expire in 2 minutes.</center>';
    final sendReport = await send(message, smtpServer);

    return sendReport;
  }

}