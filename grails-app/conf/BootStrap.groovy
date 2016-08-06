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
    String gilliansBirthdayMessage = """
So pet you're 20 now and we're together over a year.
If you can guess my nickname we can share a few memories
"""
    String gilliansSepcialBirthdayMessage = """
I hope you enjoy this birthday card and I struggled to find you a good gift
"""
    def gillianBirthday = new SpecialEvent(active: true, name: "Gillian's Birthday", message: gilliansBirthdayMessage, specialMessage: gilliansSepcialBirthdayMessage, title: "Happy Birthday Gillian", date: birthdayDate).save()
    def anniversaryEvent = new SpecialEvent(active: true, name: "Anniversary", message: "Fuck, we made it!", title: "Happy Anniversary", specialMessage: "I can't believe it's been another year already", date: anniversaryDate).save()


  }
  def destroy = {
  }
}
