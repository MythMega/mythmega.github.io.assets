package crc6431345fe65afe8d98;


public abstract class InvalidationAwareSurfaceView
	extends android.view.SurfaceView
	implements
		mono.android.IGCUserPeer,
		android.view.SurfaceHolder.Callback2,
		android.view.SurfaceHolder.Callback
{

	public InvalidationAwareSurfaceView (android.content.Context p0, android.util.AttributeSet p1, int p2)
	{
		super (p0, p1, p2);
		if (getClass () == InvalidationAwareSurfaceView.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.InvalidationAwareSurfaceView, Avalonia.Android", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, System.Private.CoreLib", this, new java.lang.Object[] { p0, p1, p2 });
		}
	}

	public InvalidationAwareSurfaceView (android.content.Context p0, android.util.AttributeSet p1)
	{
		super (p0, p1);
		if (getClass () == InvalidationAwareSurfaceView.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.InvalidationAwareSurfaceView, Avalonia.Android", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new java.lang.Object[] { p0, p1 });
		}
	}

	public InvalidationAwareSurfaceView (android.content.Context p0)
	{
		super (p0);
		if (getClass () == InvalidationAwareSurfaceView.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.InvalidationAwareSurfaceView, Avalonia.Android", "Android.Content.Context, Mono.Android", this, new java.lang.Object[] { p0 });
		}
	}

	public void surfaceRedrawNeeded (android.view.SurfaceHolder p0)
	{
		n_surfaceRedrawNeeded (p0);
	}

	private native void n_surfaceRedrawNeeded (android.view.SurfaceHolder p0);

	public void surfaceRedrawNeededAsync (android.view.SurfaceHolder p0, java.lang.Runnable p1)
	{
		n_surfaceRedrawNeededAsync (p0, p1);
	}

	private native void n_surfaceRedrawNeededAsync (android.view.SurfaceHolder p0, java.lang.Runnable p1);

	public void surfaceChanged (android.view.SurfaceHolder p0, int p1, int p2, int p3)
	{
		n_surfaceChanged (p0, p1, p2, p3);
	}

	private native void n_surfaceChanged (android.view.SurfaceHolder p0, int p1, int p2, int p3);

	public void surfaceCreated (android.view.SurfaceHolder p0)
	{
		n_surfaceCreated (p0);
	}

	private native void n_surfaceCreated (android.view.SurfaceHolder p0);

	public void surfaceDestroyed (android.view.SurfaceHolder p0)
	{
		n_surfaceDestroyed (p0);
	}

	private native void n_surfaceDestroyed (android.view.SurfaceHolder p0);

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
