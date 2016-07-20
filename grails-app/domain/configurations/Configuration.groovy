package configurations

class Configuration {

  String name
  String imageDirectory
  String titleOfPage
  boolean active

  static constraints = {
    name unique: true, nullable: false
    imageDirectory nullable: false
    titleOfPage nullable: false
  }
}
