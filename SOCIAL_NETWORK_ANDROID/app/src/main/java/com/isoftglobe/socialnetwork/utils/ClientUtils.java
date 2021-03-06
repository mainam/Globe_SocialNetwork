package com.isoftglobe.socialnetwork.utils;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.util.Base64;
import android.util.Log;
import android.view.View;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.isoftglobe.socialnetwork.constants.ServerConstants;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

/**
 * Created by admin on 3/9/2017.
 */

public class ClientUtils {
    private static final String TAG = ClientUtils.class.getSimpleName();

    private static OkHttpClient client;
    private static int timeOut = 100;

    static OkHttpClient getClient() {
        if (client == null)
            client = new OkHttpClient.Builder()
                    .connectTimeout(timeOut, TimeUnit.SECONDS)
                    .readTimeout(timeOut, TimeUnit.SECONDS)
                    .writeTimeout(timeOut, TimeUnit.SECONDS)
                    .build();
        return client;
    }

    static OkHttpClient getClient(int timeOut) {
        if (timeOut == 0)
            return getClient();
        return new OkHttpClient.Builder()
                .connectTimeout(timeOut, TimeUnit.SECONDS)
                .readTimeout(timeOut, TimeUnit.SECONDS)
                .writeTimeout(timeOut, TimeUnit.SECONDS)
                .build();
    }

    public static String getLink(String imageUrl) {
        if (imageUrl == null)
            return ServerConstants.getServerLink();
        if (imageUrl.startsWith("http://") || imageUrl.startsWith("https://"))
            return imageUrl;
        return ServerConstants.getServerLink() + imageUrl.trim();
    }



    public static class DataResponse {
        private int status;
        private String body;

        public JsonElement jsonBody() {
            try {
                return new JsonParser().parse(getBody());
            } catch (Exception e) {
                e.printStackTrace();
            }
            return new JsonParser().parse("{\"ErrorCode\":0, \"Descirption\":\"\"}").getAsJsonObject();
        }

        public boolean isOK() {
            return status == ServerConstants.RESPONSE_OK;
        }

        public boolean isTimeOut() {
            return status == ServerConstants.REQUEST_TIMEOUT_ERROR;
        }

        public DataResponse(int status, String body) {
            this.status = status;
            this.body = body;
        }

        public DataResponse(Response response) {
            this.status = response.code();
            try {
                this.body = response.body().string();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        public int getStatus() {
            return status;
        }

        public void setStatus(int status) {
            this.status = status;
        }

        public String getBody() {
            return body;
        }

        public void setBody(String body) {
            this.body = body;
        }
    }

    public static DataResponse postData(String method, JSONObject json) throws SocketTimeoutException, UnknownHostException {
        return postData(method, json.toString());
    }

    public static DataResponse postData(String method, JSONObject json, int timeOut) throws SocketTimeoutException, UnknownHostException {
        return postData(method, json.toString(), timeOut);
    }


    public static DataResponse postData(String method, String json) throws SocketTimeoutException, UnknownHostException {
        return postData(method, json, 0);
    }

    public static DataResponse getData(String method) throws SocketTimeoutException, UnknownHostException {
        return getData(method, 0);
    }

    public static DataResponse getData(String method, int timeOut) throws SocketTimeoutException, UnknownHostException {
        if (!(method.startsWith("https://") || method.startsWith("http://")))
            method = ServerConstants.getServerLink() + method;
//        Log.d(TAG, "url " +
//                method);
        Request request = new Request.Builder()
                .url(method)
                .get()
                .build();
        Response response = null;
        try {
            OkHttpClient client = null;
            if (timeOut != 0) {
                client = new OkHttpClient.Builder()
                        .connectTimeout(timeOut, TimeUnit.SECONDS)
                        .readTimeout(timeOut, TimeUnit.SECONDS)
                        .writeTimeout(timeOut, TimeUnit.SECONDS)
                        .build();
            } else {
                client = getClient();
            }

            response = client.newCall(request).execute();
//            Log.d(TAG, String.valueOf(response.code()));
            String bodyString = response.body().string();
//            Log.d(TAG, bodyString);
            return new DataResponse(response.code(), bodyString);
        } catch (SocketTimeoutException e) {
            throw e;
        } catch (UnknownHostException e) {
//            Log.e(TAG, "postData: UnknownHostException ");
            throw e;
        } catch (Exception e) {
            e.printStackTrace();
        } catch (OutOfMemoryError e) {
            e.printStackTrace();
        }
        return new DataResponse(404, "{\"ErrorCode\":0, \"Descirption\":\"\"}");
    }

    public static DataResponse postData(String method, RequestBody formBody, int timeOut) throws SocketTimeoutException, UnknownHostException {
        RequestBody body = formBody;
        if (!(method.startsWith("https://") || method.startsWith("http://")))
            method = ServerConstants.getServerLink() + method;
//        Log.d(TAG, "url " +
//                method);
        Request request = new Request.Builder()
                .post(body)
                .url(method)
                .build();
//        Log.d(TAG, "data " +
//                formBody.toString());
        Response response = null;
        try {
            OkHttpClient client = null;
            if (timeOut != 0) {
                client = new OkHttpClient.Builder()
                        .connectTimeout(timeOut, TimeUnit.SECONDS)
                        .readTimeout(timeOut, TimeUnit.SECONDS)
                        .writeTimeout(timeOut, TimeUnit.SECONDS)
                        .build();
            } else {
                client = getClient();
            }

            response = client.newCall(request).execute();
//            Log.d(TAG, String.valueOf(response.code()));
            String bodyString = response.body().string();
//            Log.d(TAG, bodyString);
            return new DataResponse(response.code(), bodyString);
        } catch (SocketTimeoutException e) {
            throw e;
        } catch (UnknownHostException e) {
//            Log.e(TAG, "postData: UnknownHostException ");
            throw e;
        } catch (Exception e) {
            e.printStackTrace();
        } catch (OutOfMemoryError e) {
            e.printStackTrace();
        }
        return new DataResponse(ServerConstants.RESPONSE_ERROR, "{\"ErrorCode\":0, \"Descirption\":\"\"}");
    }

    public static DataResponse postData(String method, String json, int timeOut) throws SocketTimeoutException, UnknownHostException {
        RequestBody body = RequestBody.create(ServerConstants.JSON, json);
        String url = ServerConstants.getServerLink() + method;
        Log.d(TAG, "url " +
                url);
        Log.d(TAG, "data " +
                json);
        Request request = new Request.Builder()
                .url(url)
                .post(body)
                .build();
        Response response = null;
        try {
            OkHttpClient client = null;
            if (timeOut != 0) {
                client = new OkHttpClient.Builder()
                        .connectTimeout(timeOut, TimeUnit.SECONDS)
                        .readTimeout(timeOut, TimeUnit.SECONDS)
                        .writeTimeout(timeOut, TimeUnit.SECONDS)
                        .build();
            } else {
                client = getClient();
            }

            response = client.newCall(request).execute();
//            Log.d(TAG, String.valueOf(response.code()));
            String bodyString = response.body().string();//getFromStream(response.body().byteStream(),"UTF-16");
            Log.d(TAG, method + ": " + bodyString);
            return new DataResponse(response.code(), bodyString);
        } catch (SocketTimeoutException e) {
//            Log.e(TAG, "postData: SocketTimeoutException ");
            throw e;
        } catch (UnknownHostException e) {
//            Log.e(TAG, "postData: UnknownHostException ");
            throw e;
        } catch (Exception e) {
//            Log.e(TAG, "postData: Exception ");
            e.printStackTrace();
        } catch (OutOfMemoryError e) {
            e.printStackTrace();
        }
        return new DataResponse(ServerConstants.RESPONSE_ERROR, "{\"ErrorCode\":0, \"Descirption\":\"\"}");
    }

    public static DataResponse postData(Request request) throws SocketTimeoutException, UnknownHostException {
        try {
            OkHttpClient client = new OkHttpClient.Builder().build();

            Response response = client.newCall(request).execute();
//            Log.d(TAG, String.valueOf(response.code()));
            String bodyString = response.body().string();//getFromStream(response.body().byteStream(),"UTF-16");
            Log.d(TAG, "postData: "+bodyString);
            return new DataResponse(response.code(), bodyString);
        } catch (SocketTimeoutException e) {
            Log.e(TAG, "postData: SocketTimeoutException ");
            throw e;
        } catch (UnknownHostException e) {
            Log.e(TAG, "postData: UnknownHostException ");
            throw e;
        } catch (Exception e) {
            Log.e(TAG, "postData: Exception ");
            e.printStackTrace();
        } catch (OutOfMemoryError e) {
            e.printStackTrace();
        }
        return new DataResponse(ServerConstants.RESPONSE_ERROR, "{\"ErrorCode\":0, \"Descirption\":\"\"}");
    }

    public static DataResponse postData(Request request, int timeOut) throws SocketTimeoutException, UnknownHostException {
        try {
            OkHttpClient client = getClient(timeOut);

            Response response = client.newCall(request).execute();
//            Log.d(TAG, String.valueOf(response.code()));
            String bodyString = response.body().string();//getFromStream(response.body().byteStream(),"UTF-16");
            return new DataResponse(response.code(), bodyString);
        } catch (SocketTimeoutException e) {
//            Log.e(TAG, "postData: SocketTimeoutException ");
            throw e;
        } catch (UnknownHostException e) {
//            Log.e(TAG, "postData: UnknownHostException ");
            throw e;
        } catch (Exception e) {
//            Log.e(TAG, "postData: Exception ");
            e.printStackTrace();
        } catch (OutOfMemoryError e) {
            e.printStackTrace();
        }
        return new DataResponse(ServerConstants.RESPONSE_ERROR, "{\"ErrorCode\":0, \"Descirption\":\"\"}");
    }


    public static <T> T cloneObject(Object object) {
        try {
            String json = getGson().toJson(object);
            return (T) getGson().fromJson(json, object.getClass());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    static Gson gson;

    public static Gson getGson() {
        if (gson == null)
            gson = new Gson();
        return gson;
    }

    static JsonParser jsonParser;

    public static JsonParser getJsonParser() {
        if (jsonParser == null)
            jsonParser = new JsonParser();
        return jsonParser;
    }



    public static String generateBroadcastCode(String data) {
        if (data == null) data = "";
        data += ConvertUtils.toDateString(new Date().getTime(), "dd/MM/yyyhh:mm:ss");
        return StringUtils.getMD5(data);
    }

    public static String generateId() {
        return StringUtils.getMD5(ConvertUtils.toDateString(new Date().getTime(), "dd/MM/yyyhh:mm:ss"));
    }

    public static String generateId(String code) {
        return StringUtils.getMD5(ConvertUtils.toDateString(new Date().getTime(), "dd/MM/yyyhh:mm:ss" + code));
    }
}
