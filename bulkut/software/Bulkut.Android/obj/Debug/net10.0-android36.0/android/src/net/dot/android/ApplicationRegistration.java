package net.dot.android;

public class ApplicationRegistration {

	public static android.content.Context Context;

	public static void registerApplications ()
	{
		// Application and Instrumentation ACWs must be registered first.
		mono.android.Runtime.register ("BulkutMobile.MainApplication, Bulkut.Android, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", crc646f32ce3c20719675.MainApplication.class, crc646f32ce3c20719675.MainApplication.__md_methods);
		mono.android.Runtime.register ("Avalonia.Android.AvaloniaAndroidApplication`1, Avalonia.Android, Version=12.1.4.0, Culture=neutral, PublicKeyToken=c8d484a7012f9a8b", crc6431345fe65afe8d98.AvaloniaAndroidApplication_1.class, crc6431345fe65afe8d98.AvaloniaAndroidApplication_1.__md_methods);
		
	}
}
