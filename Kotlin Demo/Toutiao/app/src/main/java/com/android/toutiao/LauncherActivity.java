package com.android.toutiao;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.FragmentActivity;
import android.support.v4.view.ViewPager;
import android.widget.ImageView;
import android.widget.TextView;

public class LauncherActivity extends FragmentActivity {
    private ViewPager viewPager;

    private ImageView[] tips;
    private TextView tvStartHeadlines;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_luancher);

    }
    public void gotoMain() {
        setFirst();

        Intent intent = new Intent(this,MainActivity.class);
        startActivity(intent);
        finish();
    }
    private Boolean isFirst(){
        SharedPreferences setting = getSharedPreferences("headlines", Context.MODE_PRIVATE);
        return setting.getBoolean("FIRST",true);
    }

    private void setFirst() {
        SharedPreferences setting = getSharedPreferences("headlines",Context.MODE_PRIVATE);
        setting.edit().putBoolean("FIRST",false).commit();
    }

}
