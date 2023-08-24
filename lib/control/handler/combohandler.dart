class ComboHandler {

  late Map<String, String> list = {};
  late String selected = "";
  String searchHint = "";
  String hint = "";
  String errorText = "";

  ComboHandler({required this.list, required this.hint, required this.searchHint, this.selected = "" });
}