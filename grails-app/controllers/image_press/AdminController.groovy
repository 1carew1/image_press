package image_press

import configurations.AllowedPhrases
import configurations.FailedPhrases

class AdminController {

  def index() {
    render(view: '/index')
  }

  def guess() {
    String phrase = params.phrase.toLowerCase()
    FailedPhrases failedPhrase = FailedPhrases.findByName(phrase)
    def allowedPhrases = AllowedPhrases.findAll().name
    if (allowedPhrases.contains(phrase)) {
      render(view: '/images')
    } else {
      if (!failedPhrase) {
        failedPhrase = new FailedPhrases(name: phrase).save()
      } else {
        failedPhrase.wrongCounter++
        failedPhrase.save()
      }
      if (failedPhrase) {
        render(phrase + ' is not correct and has been tried ' + failedPhrase.wrongCounter + ' times before')
      } else {
        render('At least enter something')
      }
    }
  }
}
