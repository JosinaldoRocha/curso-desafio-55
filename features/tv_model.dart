class TvModel {
  String type;
  String size;
  String resolution;
  String aspect;
  String refreshTate;
  String operationalSystem;
  String cpu;
  String loudspeakers;
  String soundPower;
  String usb;
  bool wireless;
  String hdmi;
  String energyConsumption;
  String voltage;
  int minimumVolume;
  int maximumVolume;

  TvModel(
      {required this.type,
      required this.size,
      required this.resolution,
      required this.aspect,
      required this.refreshTate,
      required this.operationalSystem,
      required this.wireless,
      required this.cpu,
      required this.loudspeakers,
      required this.soundPower,
      required this.usb,
      required this.hdmi,
      required this.energyConsumption,
      required this.voltage,
      required this.minimumVolume,
      required this.maximumVolume});

  bool isPluggedIn = false;
  bool tvOn = false;
  int volumeLevel = 0;
  int currentChannel = 0;

  Future<void> turnOnTv() async {
    print('Ligando...');
    await Future.delayed(Duration(seconds: 3));
    print("Bem vindo!");
    tvOn = true;
  }

  Future<void> turnOffTv() async {
    print('Desligando...');
    await Future.delayed(Duration(seconds: 3));
    tvOn = false;
    print('Bye!');
  }

  void plugIn() {
    isPluggedIn = true;
  }

  void unplug() {
    isPluggedIn = false;
  }

  void turnUpTheVolume() {
    volumeLevel += 10;
  }

  void turnDownTheVolume() {
    volumeLevel -= 10;
  }

  void nextChannel() {
    currentChannel += 1;
  }

  void previousChannel() {
    currentChannel -= 1;
  }

   void noVolume() {
    currentChannel = minimumVolume;
  }

   void totalVolume() {
    currentChannel = maximumVolume;
  }
}
