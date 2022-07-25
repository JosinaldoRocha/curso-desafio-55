import '../util/clean_screen.dart';
import '../util/read.dart';
import 'samsung_tv.dart';

late int option;
late String answer;
void useTv() async {
  answer = readString(message: 'Conectar tv à tomada? s/n');
  cleanScreen();

  if (answer == "s") {
    samsung49Nu7100.plugIn();
    answer = readString(message: 'Ligar tv? s/n');
    cleanScreen();
    if (answer == "s") {
      await samsung49Nu7100.turnOnTv();
      while (samsung49Nu7100.tvOn == true) {
        option = readInt(
            message:
                '[1] Próximo canal\n[2] Canal anterior\n[3] Aumentar volume/\n'
                '[4] Diminuir volume\n[5] Desligar tv');
        cleanScreen();

        if (option == 1) {
          samsung49Nu7100.nextChannel();
          if (samsung49Nu7100.currentChannel > 0) {
          } else {
            samsung49Nu7100.currentChannel = 1;
          }
          print('Canal ${samsung49Nu7100.currentChannel}');
        } else if (option == 2) {
          samsung49Nu7100.previousChannel();
          if (samsung49Nu7100.currentChannel > 0) {
          } else {
            samsung49Nu7100.currentChannel = 1;
          }
          print('Canal ${samsung49Nu7100.currentChannel}');
        } else if (option == 3) {
          samsung49Nu7100.turnUpTheVolume();
          if (samsung49Nu7100.volumeLevel >= 0) {
          } else {
            samsung49Nu7100.volumeLevel = 0;
          }
          if (samsung49Nu7100.volumeLevel <= 100) {
          } else {
            samsung49Nu7100.volumeLevel = 100;
          }
          print('Volume ${samsung49Nu7100.volumeLevel}');
        } else if (option == 4) {
          samsung49Nu7100.turnDownTheVolume();
          if (samsung49Nu7100.volumeLevel >= 0) {
          } else {
            samsung49Nu7100.volumeLevel = 0;
          }
          if (samsung49Nu7100.volumeLevel <= 100) {
          } else {
            samsung49Nu7100.volumeLevel = 100;
          }
          print('Volume ${samsung49Nu7100.volumeLevel}');
        } else if (option == 5) {
          await samsung49Nu7100.turnOffTv();
        }
      }
    }
  }

  print('\nSegue o líder!');
}
