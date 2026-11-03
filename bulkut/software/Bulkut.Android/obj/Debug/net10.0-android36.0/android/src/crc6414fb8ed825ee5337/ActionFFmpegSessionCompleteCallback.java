package crc6414fb8ed825ee5337;


public class ActionFFmpegSessionCompleteCallback
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.arthenica.ffmpegkit.FFmpegSessionCompleteCallback
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_apply:(Lcom/arthenica/ffmpegkit/FFmpegSession;)V:GetApply_Lcom_arthenica_ffmpegkit_FFmpegSession_Handler:Ffmpegkit.Droid.IFFmpegSessionCompleteCallbackInvoker, FFmpegKit.Net.FullGpl.Android\n" +
			"";
		mono.android.Runtime.register ("Ffmpegkit.Droid.ActionFFmpegSessionCompleteCallback, FFmpegKit.Net.FullGpl.Android", ActionFFmpegSessionCompleteCallback.class, __md_methods);
	}

	public ActionFFmpegSessionCompleteCallback ()
	{
		super ();
		if (getClass () == ActionFFmpegSessionCompleteCallback.class) {
			mono.android.TypeManager.Activate ("Ffmpegkit.Droid.ActionFFmpegSessionCompleteCallback, FFmpegKit.Net.FullGpl.Android", "", this, new java.lang.Object[] {  });
		}
	}

	public void apply (com.arthenica.ffmpegkit.FFmpegSession p0)
	{
		n_apply (p0);
	}

	private native void n_apply (com.arthenica.ffmpegkit.FFmpegSession p0);

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
