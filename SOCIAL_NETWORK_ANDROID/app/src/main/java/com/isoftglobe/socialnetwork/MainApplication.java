package com.isoftglobe.socialnetwork;

import android.app.Application;
import android.content.Context;

import com.google.firebase.iid.FirebaseInstanceId;
import com.isoftglobe.socialnetwork.constants.Constants;
import com.isoftglobe.socialnetwork.utils.ApplicationUtils;
import com.isoftglobe.socialnetwork.utils.SharedPreferencesUtil;

/**
 * Created by MaiNam on 3/10/2017.
 */

public class MainApplication extends Application {
    private static Context context;
    private static String UUID = null;

    private static String DeviceId = null;

    public static String getUUID() {
        if (UUID == null) {
            try {
                UUID = FirebaseInstanceId.getInstance().getToken();
                if (UUID == null)
                    return "";
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return UUID;
    }

    public static String getDeviceId() {
        if (DeviceId == null)
            return "";
        return DeviceId;
    }

    public static void setDeviceId(String deviceId) {
        DeviceId = deviceId;
    }


    public static void setUUID(String UUID) {
        MainApplication.UUID = UUID;
    }


    public void onCreate() {
        super.onCreate();
        MainApplication.context = getApplicationContext();

        MainApplication.setDeviceId(SharedPreferencesUtil.getString(this, Constants.DEVICE_ID, ""));
        if (MainApplication.DeviceId.isEmpty()) {
            MainApplication.setDeviceId(ApplicationUtils.getDeviceId(this));
        }

    }
}
