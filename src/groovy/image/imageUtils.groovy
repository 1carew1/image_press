package image

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64
import configurations.Image
import configurations.SpecialEvent

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
        def todaysEvent = SpecialEvent.findTodaysEvent()
        def allImages = Image.findAll().findAll { image -> image.events.contains(todaysEvent) }.fileLocation
        return allImages
    }
}


