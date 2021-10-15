package com.tommasoberlose.anotherwidget

import android.Manifest
import android.app.Application
import android.util.Log
import androidx.appcompat.app.AppCompatDelegate
import com.chibatching.kotpref.Kotpref
import com.google.firebase.crashlytics.FirebaseCrashlytics
import com.tommasoberlose.anotherwidget.global.Preferences
import com.tommasoberlose.anotherwidget.utils.checkGrantedPermission
import io.realm.Realm
import io.realm.RealmConfiguration

class AWApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        // Firebase crashlitycs
        //FirebaseCrashlytics.getInstance().setCrashlyticsCollectionEnabled(!BuildConfig.DEBUG)

        // Preferences
        Kotpref.init(this)

        // Dark theme
        AppCompatDelegate.setDefaultNightMode(Preferences.darkThemePreference)

        // Realm
        Realm.init(this)
        val config = RealmConfiguration.Builder()
            .deleteRealmIfMigrationNeeded()
            .build()
        Realm.setDefaultConfiguration(config)
    }
}