package com.kotlin.layout

import android.os.Bundle
import android.support.v4.app.DialogFragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView

class MyDialogFragment : DialogFragment() {

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        var v = inflater.inflate(R.layout.hello_world,container,false);
        var textView = v.findViewById<TextView>(R.id.textView);
        textView.setText("This is an instance of My DialogFrament");
        return v;
    }

    companion object {
        internal fun newInstance(): MyDialogFragment {
            return MyDialogFragment()
        }
    }
}
