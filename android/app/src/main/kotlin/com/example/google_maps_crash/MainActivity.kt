package com.example.google_maps_crash

import android.app.AppOpsManager
import android.content.Context
import android.content.pm.PackageManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.os.Process.myUid
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }

    override fun onUserLeaveHint() {
        if (iWantToBeInPipModeNow()) {
            enterPictureInPictureMode()
        }
        else{
            super.onUserLeaveHint();
        }
    }

    private fun iWantToBeInPipModeNow():Boolean {
        val pm = context.packageManager
        val appOpsManager = context.getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
        return VERSION.SDK_INT >= VERSION_CODES.O &&
                pm.hasSystemFeature(PackageManager.FEATURE_PICTURE_IN_PICTURE) &&
                AppOpsManager.MODE_ALLOWED == appOpsManager.checkOpNoThrow(AppOpsManager.OPSTR_PICTURE_IN_PICTURE, myUid(), context.packageName)
    }
}
