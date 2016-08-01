package configurations


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ImageController {

  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

  def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    respond Image.list(params), model: [imageInstanceCount: Image.count()]
  }

  def show(Image imageInstance) {
    respond imageInstance
  }

  def create() {
    respond new Image(params)
  }

  @Transactional
  def save(Image imageInstance) {
    if (imageInstance == null) {
      notFound()
      return
    }

    if (imageInstance.hasErrors()) {
      respond imageInstance.errors, view: 'create'
      return
    }

    imageInstance.save flush: true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), imageInstance.id])
        redirect imageInstance
      }
      '*' { respond imageInstance, [status: CREATED] }
    }
  }

  def edit(Image imageInstance) {
    respond imageInstance
  }

  @Transactional
  def update(Image imageInstance) {
    if (imageInstance == null) {
      notFound()
      return
    }

    if (imageInstance.hasErrors()) {
      respond imageInstance.errors, view: 'edit'
      return
    }
    def sepecialEventsName = params.eventList
    def specialEvents = SpecialEvent.findAll().findAll { event -> sepecialEventsName.contains(event.name) }
    imageInstance.events = specialEvents
    imageInstance.save flush: true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.updated.message', args: [message(code: 'Image.label', default: 'Image'), imageInstance.id])
        redirect imageInstance
      }
      '*' { respond imageInstance, [status: OK] }
    }
  }

  @Transactional
  def delete(Image imageInstance) {

    if (imageInstance == null) {
      notFound()
      return
    }

    imageInstance.delete flush: true

    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.deleted.message', args: [message(code: 'Image.label', default: 'Image'), imageInstance.id])
        redirect action: "index", method: "GET"
      }
      '*' { render status: NO_CONTENT }
    }
  }

  protected void notFound() {
    request.withFormat {
      form multipartForm {
        flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])
        redirect action: "index", method: "GET"
      }
      '*' { render status: NOT_FOUND }
    }
  }

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
