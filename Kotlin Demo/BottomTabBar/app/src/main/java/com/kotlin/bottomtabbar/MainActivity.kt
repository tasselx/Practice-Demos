package com.kotlin.bottomtabbar

import android.support.v4.app.FragmentActivity
import com.kotlin.bottomtabbar.fragment.DynamicFragment
import com.kotlin.bottomtabbar.fragment.HomeFragment
import com.kotlin.bottomtabbar.fragment.MessageFragment
import com.kotlin.bottomtabbar.fragment.PersonFragment

class MainActivity :FragmentActivity() {

     private lateinit var homeFragment: HomeFragment;
     private lateinit var dynamicFragment: DynamicFragment;
     private lateinit var messageFragment: MessageFragment;
     private lateinit var personFragment: PersonFragment;

}
