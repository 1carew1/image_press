package configurations

import groovy.time.TimeCategory

class SpecialEvent {

  String name
  String message
  String specialMessage
  String title
  Date date
  boolean active

  static constraints = {
    name unique: true, nullable: false
    message nullable: true
    title nullable: false
    date nullable: false, unique: true
    specialMessage nullable: true
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

  public static SpecialEvent findTodaysEvent() {
    def today = new Date()
    def todaysEvent = findAll().find { event ->
      (event.date.month == today.month
          && event.date.date == today.date)
    }
    if (!todaysEvent) {
      todaysEvent = findByName('Anniversary')
    }
    return todaysEvent
  }

  @Override
  public String toString() {
    return name
  }
}
