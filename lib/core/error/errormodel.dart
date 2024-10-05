class Errormodel {
  final bool stauts;

  final String errormassage;

  Errormodel({required this.stauts, required this.errormassage});
  factory Errormodel.fromjson(jsonData) {
    return Errormodel(
        stauts: jsonData['status'], errormassage: jsonData['message']);
  }
}
