package com.kotlin.layout

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView

class MainActivity : AppCompatActivity(), View.OnClickListener {


    private lateinit var llRootView:LinearLayout;
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        llRootView = findViewById(R.id.ll_root_view);
        var btn = findViewById<Button>(R.id.btn_add_view);
        btn.setOnClickListener(this);

    }

    override fun onClick(p0: View?) {
        var textView = TextView(this);
        textView.setText("动态添加View");
        llRootView.addView(textView);
        MyDialogFragment.newInstance().show(getSupportFragmentManager(),"MyDiaLogFragment");
    }
}
