package crc6414fb8ed825ee5337;


public class ActionFFprobeSessionCompleteCallback
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		com.arthenica.ffmpegkit.FFprobeSessionCompleteCallback
{

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
