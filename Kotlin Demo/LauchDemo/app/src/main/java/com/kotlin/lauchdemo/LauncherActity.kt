package com.kotlin.lauchdemo

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.support.v7.app.AppCompatActivity

class LauncherActity:AppCompatActivity() {
    private val waitTime: Long = 100

    companion object {
        const val FIRST_LAUNCHER = "first_launcher"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.actity_launcher)
        start();
    }

    fun isFirstLauncher():Boolean {
        val sp = getSharedPreferences("tassel",Context.MODE_PRIVATE)
        return sp.getBoolean(FIRST_LAUNCHER,false)
    }
    fun start(){
       Handler().postDelayed(Runnable {
           run {
               var intent:Intent ?= null
               if (isFirstLauncher()) {
                   intent = Intent(this@LauncherActity,MainActivity::class.java);
//                   intent = Intent(this,MainActity.class);
               }else {
                   intent = Intent(this@LauncherActity,FirstLaucherActity::class.java);
               }
               startActivity(intent);
               finish();
           }
       },waitTime);
    }
}