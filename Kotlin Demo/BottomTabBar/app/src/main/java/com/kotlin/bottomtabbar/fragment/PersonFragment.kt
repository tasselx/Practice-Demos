package com.kotlin.bottomtabbar.fragment

import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.kotlin.bottomtabbar.R

public class PersonFragment: Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        var rootView = inflater.inflate(R.layout.fragment_person,null);
        return rootView;
        return super.onCreateView(inflater, container, savedInstanceState)
    }
}