package com.kotlin.bottomtabbar

import android.media.Image
import android.os.Bundle
import android.os.PersistableBundle
import android.support.v4.app.FragmentActivity
import android.support.v4.app.FragmentTransaction
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import com.kotlin.bottomtabbar.fragment.DynamicFragment
import com.kotlin.bottomtabbar.fragment.HomeFragment
import com.kotlin.bottomtabbar.fragment.MessageFragment
import com.kotlin.bottomtabbar.fragment.PersonFragment

class MainActivity :FragmentActivity() {

     private  var homeFragment: HomeFragment?=null;
     private  var dynamicFragment: DynamicFragment?=null;
     private  var messageFragment: MessageFragment?=null;
     private  var personFragment: PersonFragment?=null;

     private var currentId = R.id.tv_main;//当前选择Id

     private var tvMain:TextView ?=null;
     private var tvDynamic:TextView ?=null;
     private var tvMessage:TextView ?=null;
     private var tvPerson:TextView ?=null;

     override fun onCreate(savedInstanceState: Bundle?) {
          super.onCreate(savedInstanceState)
          setContentView(R.layout.activity_main);

          tvMain = findViewById(R.id.tv_main);
          tvDynamic = findViewById(R.id.tv_dynamic);
          tvMessage = findViewById(R.id.tv_message);
          tvPerson = findViewById(R.id.tv_person);

          tvMain!!.isSelected = true;

          homeFragment = HomeFragment();
          supportFragmentManager.beginTransaction().add(R.id.main_container,homeFragment!!).commit();

          tvMain!!.setOnClickListener(tabClickListener);
          tvDynamic!!.setOnClickListener(tabClickListener);
          tvMessage!!.setOnClickListener(tabClickListener);
          tvPerson!!.setOnClickListener(tabClickListener);

          findViewById<ImageView>(R.id.iv_make).setOnClickListener(onClickListennr);

     }

     private val onClickListennr = View.OnClickListener { v->
          if (v.id == R.id.iv_make) {
               Toast.makeText(this,"点击了制作按钮",Toast.LENGTH_SHORT).show();
          }
     }
     private val tabClickListener = View.OnClickListener { v ->
          if (v.id != currentId) {//如果当前选中跟上次选中的一样,不需要处理
               changeSelect(v.id)//改变图标跟文字颜色的选中
               changeFragment(v.id)//fragment的切换
               currentId = v.id//设置选中id
          }
     }

     private fun changeFragment(resId: Int) {

          val transaction = supportFragmentManager.beginTransaction();
          hideFragments(transaction);

          when(resId) {
               R.id.tv_main->{
                    if (homeFragment == null) {
                         homeFragment = HomeFragment();
                         transaction.add(R.id.main_container,homeFragment!!);
                    }else {
                         transaction.show(homeFragment!!);
                    }
               };
               R.id.tv_dynamic->{
                    if (dynamicFragment == null) {
                         dynamicFragment = DynamicFragment();
                         transaction.add(R.id.main_container,dynamicFragment!!);
                    }else {
                         transaction.show(dynamicFragment!!);
                    }
               };
               R.id.tv_message->{
                    if (messageFragment == null) {
                         messageFragment = MessageFragment();
                         transaction.add(R.id.main_container,messageFragment!!);
                    }else {
                         transaction.show(messageFragment!!);
                    }
               };
               R.id.tv_person->{
                    if (personFragment == null) {
                         personFragment = PersonFragment();
                         transaction.add(R.id.main_container,personFragment!!);
                    }else {
                         transaction.show(personFragment!!);
                    }
               }
          }
          transaction.commit();
     }

     private fun changeSelect(resId:Int) {

          tvMain!!.isSelected = false;
          tvDynamic!!.isSelected = false;
          tvMessage!!.isSelected = false;
          tvPerson!!.isSelected = false;

          when(resId) {
               R.id.tv_main->tvMain!!.isSelected = true;
               R.id.tv_dynamic->tvDynamic!!.isSelected = true;
               R.id.tv_message->tvMessage!!.isSelected = true;
               R.id.tv_person->tvPerson!!.isSelected = true
          }
     }

     /**
      * 显示之前隐藏所有fragment
      */
     private fun hideFragments(transaction: FragmentTransaction) {
          if (homeFragment != null){
               transaction.hide(homeFragment!!);
          }
          if (dynamicFragment!=null) {
               transaction.hide(dynamicFragment!!);
          }
          if (messageFragment!=null) {
               transaction.hide(messageFragment!!);
          }
          if (personFragment != null) {
               transaction.hide(personFragment!!);
          }
     }
}
