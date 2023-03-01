# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

-dontobfuscate

-assumenosideeffects class kotlin.jvm.internal.Intrinsics {
    public static void check*NotNull*(java.lang.Object);
    public static void check*NotNull*(java.lang.Object, java.lang.String);
    public static void check*NotNull*(java.lang.Object, java.lang.String, java.lang.String);
}

-assumenosideeffects class java.util.Objects {
    public static java.lang.Object requireNonNull(java.lang.Object);
    public static java.lang.Object requireNonNull(java.lang.Object, java.lang.String);
    public static java.lang.Object requireNonNull(java.lang.Object, java.util.function.Supplier);
}

# https://github.com/Kotlin/kotlinx.coroutines/issues/2267
-checkdiscard @interface kotlin.coroutines.jvm.internal.DebugMetadata
-assumenosideeffects public class kotlin.coroutines.jvm.internal.BaseContinuationImpl {
    private kotlin.coroutines.jvm.internal.DebugMetadata getDebugMetadataAnnotation() return null;
    public java.lang.StackTraceElement getStackTraceElement() return null;
    public java.lang.String[] getSpilledVariableFieldMapping() return null;
}

# com.chibatching.kotpref.KotprefModel.remove
-keep class * implements kotlin.reflect.KProperty { *; }

-keepclassmembers class * extends me.everything.providers.core.Entity { *; }

# https://github.com/greenrobot/EventBus#r8-proguard
-keepattributes *Annotation*
-keepclassmembers class * {
    @org.greenrobot.eventbus.Subscribe <methods>;
}
-keep enum org.greenrobot.eventbus.ThreadMode { *; }

# https://github.com/google/gson/blob/master/examples/android-proguard-example/proguard.cfg
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

-dontwarn org.joda.convert.FromString
-dontwarn org.joda.convert.ToString

# https://github.com/square/okhttp/issues/6258
-dontwarn org.bouncycastle.jsse.BCSSLParameters
-dontwarn org.bouncycastle.jsse.BCSSLSocket
-dontwarn org.bouncycastle.jsse.provider.BouncyCastleJsseProvider
-dontwarn org.conscrypt.ConscryptHostnameVerifier
-dontwarn org.conscrypt.Conscrypt$Version
-dontwarn org.conscrypt.Conscrypt
-dontwarn org.openjsse.javax.net.ssl.SSLParameters
-dontwarn org.openjsse.javax.net.ssl.SSLSocket
-dontwarn org.openjsse.net.ssl.OpenJSSE
