package configurations

import grails.transaction.Transactional

class ImageController {

  static scaffold = true

  @Transactional
  def sync() {
    def path = new File("${Configuration.findByActive(true).imageDirectory}")
    def imageLocations = path.listFiles()*.absolutePath
    def savedImages = Image.findAll().fileLocation
    imageLocations.each { imagePath ->
      if (savedImages.contains(imagePath)) {
        //do nothing
      } else {
        def newImage = new Image(fileLocation: imagePath).save()
      }
    }
    savedImages.each { savedImage ->
      if (!imageLocations.contains(savedImage)) {
        def oldImage = Image.findByFileLocation(savedImage)
        oldImage.delete()
      }
    }
    flash.message = "Images Synched"
    redirect(uri: '/image')
  }
}
