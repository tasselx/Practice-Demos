package com.kotlin.lauchdemo

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.support.v4.view.ViewPager
import android.support.v4.view.ViewPager.OnPageChangeListener
import android.support.v4.widget.EdgeEffectCompat
import android.support.v7.app.AppCompatActivity
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import kotlinx.android.synthetic.main.activity_first_launcher.*
import java.util.ArrayList

class FirstLaucherActity:AppCompatActivity() {

    private var viewPaper:ViewPager? = null

    private val images = intArrayOf(R.mipmap.bg_launcher_one,R.mipmap.bg_launcher_two,R.mipmap.bg_launcher_three)
    private lateinit var mImageViews: ArrayList<View>;
    private lateinit var tips: ArrayList<ImageView>;

    private var group: ViewGroup? = null
    private var rightEdge:EdgeEffectCompat? = null

    private var tvGotoMain:TextView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_first_launcher)
        group = findViewById(R.id.viewGroup)
        tvGotoMain = findViewById(R.id.tv_goto_main)

        try {
            val rightEdgeField = viewPaper!!.javaClass.getDeclaredField("mRightEdge")
            rightEdgeField.isAccessible = true
            rightEdge = rightEdgeField[viewPaper] as EdgeEffectCompat
        } catch (e: Exception) {
            e.printStackTrace()
        }

       for (x in 0..images.size) {

           val imageView = ImageView(this)
           imageView.layoutParams = ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.MATCH_PARENT)
           imageView.scaleType = ImageView.ScaleType.CENTER_CROP
           imageView.setImageResource(images[x])
           mImageViews.add(imageView)

       }


        for (i in 0..images.size) {
            val imageView = ImageView(this)
            imageView.layoutParams = ViewGroup.LayoutParams(10,10)
            if(i==0){
                imageView.setBackgroundResource(R.mipmap.icon_first_launcher_page_select_one);
            }else {
                imageView.setBackgroundResource(R.mipmap.icon_first_launcher_page_normal)
            }
            tips.add(imageView)

            val layoutParams = LinearLayout.LayoutParams(ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,ViewGroup.LayoutParams.MATCH_PARENT))
            layoutParams.leftMargin = 10;
            layoutParams.rightMargin = 10;
            group!!.addView(imageView,layoutParams)
        }

    }

    var onClickListener = View.OnClickListener { v->
        when(v.id) {
            R.id.tv_goto_main-> {
                goToMain()
            }
        }
    }
    
    private val onPageChangeListener:OnPageChangeListener = object :
        ViewPager.OnPageChangeListener {
        override fun onPageScrolled(i: Int, v: Float, i1: Int) {

        }
        override fun onPageSelected(i: Int) {

        }
        override fun onPageScrollStateChanged(i: Int) {

        }
    }

    fun goToMain(){
        setFirstLauncherBoolean()
        val intent = Intent(this,MainActivity::class.java)
        startActivity(intent)
        finish()
    }
    fun setFirstLauncherBoolean(){
        val sp = getSharedPreferences("tassel",Context.MODE_PRIVATE)
        val edit = sp.edit()
        edit.putBoolean(LauncherActity.FIRST_LAUNCHER,true)
        edit.apply()
    }

}