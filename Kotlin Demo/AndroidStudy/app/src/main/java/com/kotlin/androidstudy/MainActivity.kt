package com.kotlin.androidstudy

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.Gravity
import android.view.View
import com.kotlin.androidstudy.Custom.CustomToast

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun buttonOnClick(view: View) {
        print("测试室所所所所所");
        CustomToast.instance?.showToastCustom(this,"显示顶部",Gravity.TOP);
    }
}
