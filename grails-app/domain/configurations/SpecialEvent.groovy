package configurations

import groovy.time.TimeCategory

class SpecialEvent {

  String name
  String message
  String title
  Date date
  boolean active

  static constraints = {
    name unique: true, nullable: false
    message nullable: false
    title nullable: false
    date nullable: false, unique: true
//        validator: { val, obj ->
//      boolean pass = true
//      def allEvents = findAll()
//      if (allEvents) {
//        def allEventsMonthAndDate = []
//        allEvents.each { event ->
//          allEventsMonthAndDate.add("${event?.getDate()?.getMonth()}${event?.getDate()?.getDay()}")
//        }
//        if (allEventsMonthAndDate.contains("${val.getMonth()}${val.getDay()}")) {
//          //There is already an event at this date
//          pass = false
//        }
//      }
//      return pass
//    }
  }

  Integer getYears() {
    int yea = 0l
    def today = new Date()
    use(TimeCategory) {
      def duration = today - date
      yea = duration.years
    }
    return yea
  }

  static transients = ['years']


  @Override
  public String toString() {
    return name
  }
}
