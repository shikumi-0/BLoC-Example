import 'package:meta/meta.dart';

class NationModel {
  final String nationName;
  final String imagePath;
  final String countryId;

  NationModel(
      {@required this.nationName,
      @required this.imagePath,
      @required this.countryId});
}

List<NationModel> nations = [
  NationModel(
      nationName: "Argentina",
      imagePath: "assets/images/argentina.png",
      countryId: "52"),
  NationModel(
      nationName: "Brazil",
      imagePath: "assets/images/brazil.png",
      countryId: "54"),
  NationModel(
      nationName: "Germany",
      imagePath: "assets/images/germany.png",
      countryId: "21"),
  NationModel(
      nationName: "England",
      imagePath: "assets/images/england.png",
      countryId: "14"),
  NationModel(
      nationName: "France",
      imagePath: "asstes/images/france.png",
      countryId: "18"),
  NationModel(
      nationName: "Italy",
      imagePath: "assets/images/italy.png",
      countryId: "27"),
  NationModel(
      nationName: "Spain",
      imagePath: "asstes/images/spain.png",
      countryId: "45")
];
