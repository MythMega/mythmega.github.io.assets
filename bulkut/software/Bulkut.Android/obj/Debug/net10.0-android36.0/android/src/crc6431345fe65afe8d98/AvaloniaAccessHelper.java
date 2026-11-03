package crc6431345fe65afe8d98;


public class AvaloniaAccessHelper
	extends androidx.customview.widget.ExploreByTouchHelper
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_getVirtualViewAt:(FF)I:GetGetVirtualViewAt_FFHandler\n" +
			"n_getVisibleVirtualViews:(Ljava/util/List;)V:GetGetVisibleVirtualViews_Ljava_util_List_Handler\n" +
			"n_onPerformActionForVirtualView:(IILandroid/os/Bundle;)Z:GetOnPerformActionForVirtualView_IILandroid_os_Bundle_Handler\n" +
			"n_onPopulateNodeForVirtualView:(ILandroidx/core/view/accessibility/AccessibilityNodeInfoCompat;)V:GetOnPopulateNodeForVirtualView_ILandroidx_core_view_accessibility_AccessibilityNodeInfoCompat_Handler\n" +
			"";
		mono.android.Runtime.register ("Avalonia.Android.AvaloniaAccessHelper, Avalonia.Android", AvaloniaAccessHelper.class, __md_methods);
	}

	public AvaloniaAccessHelper (android.view.View p0)
	{
		super (p0);
		if (getClass () == AvaloniaAccessHelper.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.AvaloniaAccessHelper, Avalonia.Android", "Android.Views.View, Mono.Android", this, new java.lang.Object[] { p0 });
		}
	}

	public int getVirtualViewAt (float p0, float p1)
	{
		return n_getVirtualViewAt (p0, p1);
	}

	private native int n_getVirtualViewAt (float p0, float p1);

	public void getVisibleVirtualViews (java.util.List p0)
	{
		n_getVisibleVirtualViews (p0);
	}

	private native void n_getVisibleVirtualViews (java.util.List p0);

	public boolean onPerformActionForVirtualView (int p0, int p1, android.os.Bundle p2)
	{
		return n_onPerformActionForVirtualView (p0, p1, p2);
	}

	private native boolean n_onPerformActionForVirtualView (int p0, int p1, android.os.Bundle p2);

	public void onPopulateNodeForVirtualView (int p0, androidx.core.view.accessibility.AccessibilityNodeInfoCompat p1)
	{
		n_onPopulateNodeForVirtualView (p0, p1);
	}

	private native void n_onPopulateNodeForVirtualView (int p0, androidx.core.view.accessibility.AccessibilityNodeInfoCompat p1);

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
