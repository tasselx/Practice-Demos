package com.kotlin.androidstudy.Custom

import android.content.Context
import android.text.TextUtils
import android.view.Gravity
import android.view.View
import android.widget.TextView
import android.widget.Toast
import com.kotlin.androidstudy.R

class CustomToast private constructor() {
    private var toast: Toast? = null
    private val MARGIN_DP = 50
    fun cancel() {
        if (toast != null) {
            toast!!.cancel()
            toast = null
        }
    }

    fun showToastCustom(
        ctx: Context,
        msg: String?,
        gravity: Int
    ) {
        showToastCustom(ctx, msg, R.layout.toast_msg, R.id.txt_toast_message, gravity)
    }

    /**
     * 显示自定义布局
     *
     * @param ctx        上下文
     * @param msg
     * @param layouResId
     * @param txtResId
     * @param gravity
     */
    fun showToastCustom(
        ctx: Context,
        msg: String?,
        layouResId: Int,
        txtResId: Int,
        gravity: Int
    ) {
        cancel()
        try {
            if (TextUtils.isEmpty(msg)) {
                return
            }
            val layout = View.inflate(ctx, layouResId, null)
            val txtMsg = layout.findViewById<TextView>(txtResId)
            txtMsg.text = msg
            toast = Toast(ctx)
            toast!!.duration = Toast.LENGTH_SHORT
            if (gravity == Gravity.TOP) {
                toast!!.setGravity(gravity, 0, dip2px(ctx, MARGIN_DP.toFloat()))
            } else if (gravity == Gravity.BOTTOM) {
                toast!!.setGravity(gravity, 0, dip2px(ctx, MARGIN_DP.toFloat()))
            } else {
                toast!!.setGravity(gravity, 0, 0)
            }
            toast!!.view = layout
            toast!!.show()
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    companion object {
        private var _instance: CustomToast? = null
        val instance: CustomToast?
            get() {
                if (_instance == null) {
                    _instance = CustomToast()
                }
                return _instance
            }

        fun dip2px(context: Context, dpValue: Float): Int {
            val scale = context.resources.displayMetrics.density
            return (dpValue * scale + 0.5f).toInt()
        }
    }
}