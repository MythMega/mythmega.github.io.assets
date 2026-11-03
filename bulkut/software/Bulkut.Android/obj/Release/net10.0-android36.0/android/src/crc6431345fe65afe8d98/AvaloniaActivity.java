package crc6431345fe65afe8d98;


public class AvaloniaActivity
	extends androidx.appcompat.app.AppCompatActivity
	implements
		mono.android.IGCUserPeer
{

	public AvaloniaActivity ()
	{
		super ();
		if (getClass () == AvaloniaActivity.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.AvaloniaActivity, Avalonia.Android", "", this, new java.lang.Object[] {  });
		}
	}

	public AvaloniaActivity (int p0)
	{
		super (p0);
		if (getClass () == AvaloniaActivity.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.AvaloniaActivity, Avalonia.Android", "System.Int32, System.Private.CoreLib", this, new java.lang.Object[] { p0 });
		}
	}

	public void onBackPressed ()
	{
		n_onBackPressed ();
	}

	private native void n_onBackPressed ();

	public void onCreate (android.os.Bundle p0)
	{
		n_onCreate (p0);
	}

	private native void n_onCreate (android.os.Bundle p0);

	public void onNewIntent (android.content.Intent p0)
	{
		n_onNewIntent (p0);
	}

	private native void n_onNewIntent (android.content.Intent p0);

	public void onStop ()
	{
		n_onStop ();
	}

	private native void n_onStop ();

	public void onStart ()
	{
		n_onStart ();
	}

	private native void n_onStart ();

	public void onResume ()
	{
		n_onResume ();
	}

	private native void n_onResume ();

	public void onDestroy ()
	{
		n_onDestroy ();
	}

	private native void n_onDestroy ();

	public void onActivityResult (int p0, int p1, android.content.Intent p2)
	{
		n_onActivityResult (p0, p1, p2);
	}

	private native void n_onActivityResult (int p0, int p1, android.content.Intent p2);

	public void onRequestPermissionsResult (int p0, java.lang.String[] p1, int[] p2)
	{
		n_onRequestPermissionsResult (p0, p1, p2);
	}

	private native void n_onRequestPermissionsResult (int p0, java.lang.String[] p1, int[] p2);

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
