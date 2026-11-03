package crc641fe58d40b3a958ab;


public class AndroidScreens_DisplayListener
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		android.hardware.display.DisplayManager.DisplayListener
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onDisplayAdded:(I)V:GetOnDisplayAdded_IHandler:Android.Hardware.Display.DisplayManager+IDisplayListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n" +
			"n_onDisplayChanged:(I)V:GetOnDisplayChanged_IHandler:Android.Hardware.Display.DisplayManager+IDisplayListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n" +
			"n_onDisplayRemoved:(I)V:GetOnDisplayRemoved_IHandler:Android.Hardware.Display.DisplayManager+IDisplayListenerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n" +
			"";
		mono.android.Runtime.register ("Avalonia.Android.Platform.AndroidScreens+DisplayListener, Avalonia.Android", AndroidScreens_DisplayListener.class, __md_methods);
	}

	public AndroidScreens_DisplayListener ()
	{
		super ();
		if (getClass () == AndroidScreens_DisplayListener.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.Platform.AndroidScreens+DisplayListener, Avalonia.Android", "", this, new java.lang.Object[] {  });
		}
	}

	public void onDisplayAdded (int p0)
	{
		n_onDisplayAdded (p0);
	}

	private native void n_onDisplayAdded (int p0);

	public void onDisplayChanged (int p0)
	{
		n_onDisplayChanged (p0);
	}

	private native void n_onDisplayChanged (int p0);

	public void onDisplayRemoved (int p0)
	{
		n_onDisplayRemoved (p0);
	}

	private native void n_onDisplayRemoved (int p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
