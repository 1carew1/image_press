package image_press

import configurations.AllowedPhrases
import configurations.FailedPhrases

class AdminController {

  def index() {
    render(view: '/index')
  }

  def guess() {
    String phrase = params.phrase?.toLowerCase()
    FailedPhrases failedPhrase = FailedPhrases.findByName(phrase)
    def allowedPhrases = AllowedPhrases.findAll().name
    if (allowedPhrases?.contains(phrase)) {
      render(view: '/imageDisplay')
    } else {
      if (!failedPhrase) {
        failedPhrase = new FailedPhrases(name: phrase).save()
      } else {
        failedPhrase.wrongCounter++
        failedPhrase.save()
      }
      if (failedPhrase) {
        flash.message = phrase + ' is not correct and has been tried ' + failedPhrase.wrongCounter + ' times before'
      } else {
        flash.message = 'At least enter something'
      }
      redirect(uri: '/')
    }
  }
}
