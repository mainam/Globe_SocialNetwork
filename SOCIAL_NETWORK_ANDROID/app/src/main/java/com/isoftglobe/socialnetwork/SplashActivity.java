package com.isoftglobe.socialnetwork;

import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

public class SplashActivity extends BaseActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                //code mo trang login
                Intent intent = new Intent(getActivity(), LoginActivity.class);
                startActivity(intent);
            }
        }, 5000);
    }
}
