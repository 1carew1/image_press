package configurations

/***************************************************************
 * Copyright (c) 2016 Errigal Inc.
 *
 * This software is the confidential and proprietary information
 * of Errigal, Inc.  You shall not disclose such confidential
 * information and shall use it only in accordance with the
 * license agreement you entered into with Errigal.
 *
 *************************************************************** */

/**
 * Created by Colm Carew on 26/07/16.
 */
class Image {
  String fileLocation

  static hasMany = [events : SpecialEvent]

  static constraints = {
    fileLocation nullable: false, unique: true
  }
}
