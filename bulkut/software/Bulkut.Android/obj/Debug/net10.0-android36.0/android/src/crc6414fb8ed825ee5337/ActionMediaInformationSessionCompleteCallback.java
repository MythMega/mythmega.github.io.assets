package crc6414fb8ed825ee5337;


public class ActionMediaInformationSessionCompleteCallback
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.arthenica.ffmpegkit.MediaInformationSessionCompleteCallback
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_apply:(Lcom/arthenica/ffmpegkit/MediaInformationSession;)V:GetApply_Lcom_arthenica_ffmpegkit_MediaInformationSession_Handler:Ffmpegkit.Droid.IMediaInformationSessionCompleteCallbackInvoker, FFmpegKit.Net.FullGpl.Android\n" +
			"";
		mono.android.Runtime.register ("Ffmpegkit.Droid.ActionMediaInformationSessionCompleteCallback, FFmpegKit.Net.FullGpl.Android", ActionMediaInformationSessionCompleteCallback.class, __md_methods);
	}

	public ActionMediaInformationSessionCompleteCallback ()
	{
		super ();
		if (getClass () == ActionMediaInformationSessionCompleteCallback.class) {
			mono.android.TypeManager.Activate ("Ffmpegkit.Droid.ActionMediaInformationSessionCompleteCallback, FFmpegKit.Net.FullGpl.Android", "", this, new java.lang.Object[] {  });
		}
	}

	public void apply (com.arthenica.ffmpegkit.MediaInformationSession p0)
	{
		n_apply (p0);
	}

	private native void n_apply (com.arthenica.ffmpegkit.MediaInformationSession p0);

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
