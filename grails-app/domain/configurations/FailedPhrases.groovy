package configurations

class FailedPhrases {

  String name
  Long wrongCounter = 0l

  static constraints = {
    name unique: true, nullable: false
  }
}
