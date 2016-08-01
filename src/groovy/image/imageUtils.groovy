package image

import configurations.Image
import configurations.SpecialEvent
import org.apache.catalina.util.Base64

import java.nio.file.Files
import java.nio.file.Paths

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
 * Created by Colm Carew on 01/08/16.
 */
class ImageUtils {

  public static String imageToString(String path) {
    String imageString = null
    try {
      imageString = new String(Base64.encode(Files.readAllBytes(Paths.get(path))))
    } catch (IOException e) {
      e.printStackTrace()
    }
    if (imageString == null) {
      imageString = ''
    }
    return imageString
  }

  public static List<String> todaysPhotos() {
    def today = new Date()
    def todaysEvent = SpecialEvent.findAll().find { event ->
      (event.date.month == today.month
          && event.date.date == today.date)
    }
    if (!todaysEvent) {
      todaysEvent = SpecialEvent.findByName('Anniversary')
    }
    def allImages = Image.findAll().findAll { image -> image.events.contains(todaysEvent) }.fileLocation
    return allImages
  }
}


