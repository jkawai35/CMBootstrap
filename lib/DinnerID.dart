class DinnerID {
  String? Dinnerid;
  String? dinnerText;
  bool isCooked;

  DinnerID({
    required this.Dinnerid,
    required this.dinnerText,
    this.isCooked = false
  });

  static List<DinnerID> dinnerList() {
    return [];
  }
}

