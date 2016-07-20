import configurations.Configuration

class BootStrap {

  def init = { servletContext ->
    def configuration = new Configuration(name: 'MainConfig', active: true, imageDirectory: '/home/appfiles/images', titleOfPage: 'Happy Birthday Gillian').save()
  }
  def destroy = {
  }
}
