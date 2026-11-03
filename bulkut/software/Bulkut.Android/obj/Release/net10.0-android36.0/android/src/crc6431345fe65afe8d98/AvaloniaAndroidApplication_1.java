package crc6431345fe65afe8d98;


public class AvaloniaAndroidApplication_1
	extends android.app.Application
	implements
		mono.android.IGCUserPeer
{

	public AvaloniaAndroidApplication_1 ()
	{
		mono.MonoPackageManager.setContext (this);
	}

	public void onCreate ()
	{
		n_onCreate ();
	}

	private native void n_onCreate ();

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
