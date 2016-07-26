import configurations.AllowedPhrases
import configurations.Configuration
import configurations.SpecialEvent

class BootStrap {

  def init = { servletContext ->

    def configuration = new Configuration(name: 'MainConfig', active: true, imageDirectory: '/export/home/appfiles/images', titleOfPage: 'Happy Birthday Gillian').save()
    def firstAllowedPhrase = new AllowedPhrases(name: 'grape').save()
    def secondAllowedPhrase = new AllowedPhrases(name: 'bae').save()

    String birthday = "10-08-1996 GMT"
    Date birthdayDate = Date.parse('dd-MM-yyyy z', birthday)
    String anniversary = '18-07-2015 GMT'
    Date anniversaryDate = Date.parse('dd-MM-yyyy z', anniversary)
    def gillianBirthday = new SpecialEvent(active: true, name: "Gillian's Birthday", message: "Happy Birthday Gillian!!!", title: "Happy Birthday Gillian", date: birthdayDate).save()
    def anniversaryEvent = new SpecialEvent(active: true, name: "Anniversary", message: "Happy Anniversary!!!", title: "Happy Anniversary", date: anniversaryDate).save()


  }
  def destroy = {
  }
}
