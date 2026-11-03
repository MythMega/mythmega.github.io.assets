package crc641fe58d40b3a958ab;


public class AndroidScreens_DisplayListener
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		android.hardware.display.DisplayManager.DisplayListener
{

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
