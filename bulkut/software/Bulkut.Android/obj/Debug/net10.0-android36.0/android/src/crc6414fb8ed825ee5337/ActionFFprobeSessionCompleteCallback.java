package crc6414fb8ed825ee5337;


public class ActionFFprobeSessionCompleteCallback
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.arthenica.ffmpegkit.FFprobeSessionCompleteCallback
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_apply:(Lcom/arthenica/ffmpegkit/FFprobeSession;)V:GetApply_Lcom_arthenica_ffmpegkit_FFprobeSession_Handler:Ffmpegkit.Droid.IFFprobeSessionCompleteCallbackInvoker, FFmpegKit.Net.FullGpl.Android\n" +
			"";
		mono.android.Runtime.register ("Ffmpegkit.Droid.ActionFFprobeSessionCompleteCallback, FFmpegKit.Net.FullGpl.Android", ActionFFprobeSessionCompleteCallback.class, __md_methods);
	}

	public ActionFFprobeSessionCompleteCallback ()
	{
		super ();
		if (getClass () == ActionFFprobeSessionCompleteCallback.class) {
			mono.android.TypeManager.Activate ("Ffmpegkit.Droid.ActionFFprobeSessionCompleteCallback, FFmpegKit.Net.FullGpl.Android", "", this, new java.lang.Object[] {  });
		}
	}

	public void apply (com.arthenica.ffmpegkit.FFprobeSession p0)
	{
		n_apply (p0);
	}

	private native void n_apply (com.arthenica.ffmpegkit.FFprobeSession p0);

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
