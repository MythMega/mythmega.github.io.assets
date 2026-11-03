package crc6431345fe65afe8d98;


public class AndroidDispatcherImpl_IdleHandler
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		android.os.MessageQueue.IdleHandler
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_queueIdle:()Z:GetQueueIdleHandler:Android.OS.MessageQueue+IIdleHandlerInvoker, Mono.Android, Version=0.0.0.0, Culture=neutral, PublicKeyToken=null\n" +
			"";
		mono.android.Runtime.register ("Avalonia.Android.AndroidDispatcherImpl+IdleHandler, Avalonia.Android", AndroidDispatcherImpl_IdleHandler.class, __md_methods);
	}

	public AndroidDispatcherImpl_IdleHandler ()
	{
		super ();
		if (getClass () == AndroidDispatcherImpl_IdleHandler.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.AndroidDispatcherImpl+IdleHandler, Avalonia.Android", "", this, new java.lang.Object[] {  });
		}
	}

	public boolean queueIdle ()
	{
		return n_queueIdle ();
	}

	private native boolean n_queueIdle ();

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
