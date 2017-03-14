package com.isoftglobe.socialnetwork.constants;

import okhttp3.MediaType;

/**
 * Created by admin on 3/9/2017.
 */

public class ServerConstants {
    static String SERVER_LINK = null;
    static String FOLDER_ROOT = null;

    public static String getServerLink(){
        if (SERVER_LINK != null) {
            return SERVER_LINK;
        }
        return "";
    }

    public static String getFolderRoot() {
        if (FOLDER_ROOT != null) {
            return FOLDER_ROOT;
        }
        return "";
    }

    public static void setFolderRoot(String folder) {
        FOLDER_ROOT = folder;
    }

    public static void setServerLink(String serverLink) {
        SERVER_LINK = serverLink;
    }

    public static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
    public static final int RESPONSE_OK = 200;
    public static final int RESPONSE_ERROR = 204;
    public static final int REQUEST_TIMEOUT_ERROR = 408;
    public static String HTTP = "http://";
    public static String HTTPS = "https://";
}
