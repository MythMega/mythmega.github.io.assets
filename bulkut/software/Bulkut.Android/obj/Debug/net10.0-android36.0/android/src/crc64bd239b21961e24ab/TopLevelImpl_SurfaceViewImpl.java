package crc64bd239b21961e24ab;


public class TopLevelImpl_SurfaceViewImpl
	extends crc6431345fe65afe8d98.InvalidationAwareSurfaceView
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_dispatchDraw:(Landroid/graphics/Canvas;)V:GetDispatchDraw_Landroid_graphics_Canvas_Handler\n" +
			"";
		mono.android.Runtime.register ("Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl+SurfaceViewImpl, Avalonia.Android", TopLevelImpl_SurfaceViewImpl.class, __md_methods);
	}

	public TopLevelImpl_SurfaceViewImpl (android.content.Context p0, android.util.AttributeSet p1, int p2, int p3)
	{
		super (p0, p1, p2, p3);
		if (getClass () == TopLevelImpl_SurfaceViewImpl.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl+SurfaceViewImpl, Avalonia.Android", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, System.Private.CoreLib:System.Int32, System.Private.CoreLib", this, new java.lang.Object[] { p0, p1, p2, p3 });
		}
	}

	public TopLevelImpl_SurfaceViewImpl (android.content.Context p0, android.util.AttributeSet p1, int p2)
	{
		super (p0, p1, p2);
		if (getClass () == TopLevelImpl_SurfaceViewImpl.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl+SurfaceViewImpl, Avalonia.Android", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android:System.Int32, System.Private.CoreLib", this, new java.lang.Object[] { p0, p1, p2 });
		}
	}

	public TopLevelImpl_SurfaceViewImpl (android.content.Context p0, android.util.AttributeSet p1)
	{
		super (p0, p1);
		if (getClass () == TopLevelImpl_SurfaceViewImpl.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl+SurfaceViewImpl, Avalonia.Android", "Android.Content.Context, Mono.Android:Android.Util.IAttributeSet, Mono.Android", this, new java.lang.Object[] { p0, p1 });
		}
	}

	public TopLevelImpl_SurfaceViewImpl (android.content.Context p0)
	{
		super (p0);
		if (getClass () == TopLevelImpl_SurfaceViewImpl.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.Platform.SkiaPlatform.TopLevelImpl+SurfaceViewImpl, Avalonia.Android", "Android.Content.Context, Mono.Android", this, new java.lang.Object[] { p0 });
		}
	}

	public void dispatchDraw (android.graphics.Canvas p0)
	{
		n_dispatchDraw (p0);
	}

	private native void n_dispatchDraw (android.graphics.Canvas p0);

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
