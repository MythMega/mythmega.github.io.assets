package crc6431345fe65afe8d98;


public class BackPressedCallback
	extends androidx.activity.OnBackPressedCallback
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_handleOnBackPressed:()V:GetHandleOnBackPressedHandler\n" +
			"";
		mono.android.Runtime.register ("Avalonia.Android.BackPressedCallback, Avalonia.Android", BackPressedCallback.class, __md_methods);
	}

	public BackPressedCallback (boolean p0)
	{
		super (p0);
		if (getClass () == BackPressedCallback.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.BackPressedCallback, Avalonia.Android", "System.Boolean, System.Private.CoreLib", this, new java.lang.Object[] { p0 });
		}
	}

	public void handleOnBackPressed ()
	{
		n_handleOnBackPressed ();
	}

	private native void n_handleOnBackPressed ();

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
