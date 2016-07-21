import configurations.AllowedPhrases
import configurations.Configuration

class BootStrap {

  def init = { servletContext ->

    def configuration = new Configuration(name: 'MainConfig', active: true, imageDirectory: '/export/home/appfiles/images', titleOfPage: 'Happy Birthday Gillian').save()
    def firstAllowedPhrase = new AllowedPhrases(name: 'grape').save()
    def secondAllowedPhrase = new AllowedPhrases(name: 'bae').save()


  }
  def destroy = {
  }
}
