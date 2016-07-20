package configurations

class AllowedPhrases {

  String name

  static constraints = {
    name unique: true, nullable: false
  }
}
