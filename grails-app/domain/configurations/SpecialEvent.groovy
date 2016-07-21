package configurations

class SpecialEvent {

  String name
  String message
  String title
  Date date
  boolean active

  static constraints = {
    name unique: true, nullable: false
    message nullable: false
    title nullable: false
    date nullable: false
  }
}
