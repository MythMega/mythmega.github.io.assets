package crc643ec2256bd5ff4bdb;


public class AvaloniaInputConnection
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		android.view.inputmethod.InputConnection
{

	public AvaloniaInputConnection ()
	{
		super ();
		if (getClass () == AvaloniaInputConnection.class) {
			mono.android.TypeManager.Activate ("Avalonia.Android.Platform.Input.AvaloniaInputConnection, Avalonia.Android", "", this, new java.lang.Object[] {  });
		}
	}

	public android.os.Handler getHandler ()
	{
		return n_getHandler ();
	}

	private native android.os.Handler n_getHandler ();

	public boolean beginBatchEdit ()
	{
		return n_beginBatchEdit ();
	}

	private native boolean n_beginBatchEdit ();

	public boolean clearMetaKeyStates (int p0)
	{
		return n_clearMetaKeyStates (p0);
	}

	private native boolean n_clearMetaKeyStates (int p0);

	public void closeConnection ()
	{
		n_closeConnection ();
	}

	private native void n_closeConnection ();

	public boolean commitCompletion (android.view.inputmethod.CompletionInfo p0)
	{
		return n_commitCompletion (p0);
	}

	private native boolean n_commitCompletion (android.view.inputmethod.CompletionInfo p0);

	public boolean commitContent (android.view.inputmethod.InputContentInfo p0, int p1, android.os.Bundle p2)
	{
		return n_commitContent (p0, p1, p2);
	}

	private native boolean n_commitContent (android.view.inputmethod.InputContentInfo p0, int p1, android.os.Bundle p2);

	public boolean commitCorrection (android.view.inputmethod.CorrectionInfo p0)
	{
		return n_commitCorrection (p0);
	}

	private native boolean n_commitCorrection (android.view.inputmethod.CorrectionInfo p0);

	public boolean commitText (java.lang.CharSequence p0, int p1)
	{
		return n_commitText (p0, p1);
	}

	private native boolean n_commitText (java.lang.CharSequence p0, int p1);

	public boolean deleteSurroundingText (int p0, int p1)
	{
		return n_deleteSurroundingText (p0, p1);
	}

	private native boolean n_deleteSurroundingText (int p0, int p1);

	public boolean deleteSurroundingTextInCodePoints (int p0, int p1)
	{
		return n_deleteSurroundingTextInCodePoints (p0, p1);
	}

	private native boolean n_deleteSurroundingTextInCodePoints (int p0, int p1);

	public boolean endBatchEdit ()
	{
		return n_endBatchEdit ();
	}

	private native boolean n_endBatchEdit ();

	public boolean finishComposingText ()
	{
		return n_finishComposingText ();
	}

	private native boolean n_finishComposingText ();

	public int getCursorCapsMode (int p0)
	{
		return n_getCursorCapsMode (p0);
	}

	private native int n_getCursorCapsMode (int p0);

	public android.view.inputmethod.ExtractedText getExtractedText (android.view.inputmethod.ExtractedTextRequest p0, int p1)
	{
		return n_getExtractedText (p0, p1);
	}

	private native android.view.inputmethod.ExtractedText n_getExtractedText (android.view.inputmethod.ExtractedTextRequest p0, int p1);

	public java.lang.CharSequence getSelectedText (int p0)
	{
		return n_getSelectedText (p0);
	}

	private native java.lang.CharSequence n_getSelectedText (int p0);

	public java.lang.CharSequence getTextAfterCursor (int p0, int p1)
	{
		return n_getTextAfterCursor (p0, p1);
	}

	private native java.lang.CharSequence n_getTextAfterCursor (int p0, int p1);

	public java.lang.CharSequence getTextBeforeCursor (int p0, int p1)
	{
		return n_getTextBeforeCursor (p0, p1);
	}

	private native java.lang.CharSequence n_getTextBeforeCursor (int p0, int p1);

	public boolean performContextMenuAction (int p0)
	{
		return n_performContextMenuAction (p0);
	}

	private native boolean n_performContextMenuAction (int p0);

	public boolean performEditorAction (int p0)
	{
		return n_performEditorAction (p0);
	}

	private native boolean n_performEditorAction (int p0);

	public boolean performPrivateCommand (java.lang.String p0, android.os.Bundle p1)
	{
		return n_performPrivateCommand (p0, p1);
	}

	private native boolean n_performPrivateCommand (java.lang.String p0, android.os.Bundle p1);

	public boolean reportFullscreenMode (boolean p0)
	{
		return n_reportFullscreenMode (p0);
	}

	private native boolean n_reportFullscreenMode (boolean p0);

	public boolean requestCursorUpdates (int p0)
	{
		return n_requestCursorUpdates (p0);
	}

	private native boolean n_requestCursorUpdates (int p0);

	public boolean sendKeyEvent (android.view.KeyEvent p0)
	{
		return n_sendKeyEvent (p0);
	}

	private native boolean n_sendKeyEvent (android.view.KeyEvent p0);

	public boolean setComposingRegion (int p0, int p1)
	{
		return n_setComposingRegion (p0, p1);
	}

	private native boolean n_setComposingRegion (int p0, int p1);

	public boolean setComposingText (java.lang.CharSequence p0, int p1)
	{
		return n_setComposingText (p0, p1);
	}

	private native boolean n_setComposingText (java.lang.CharSequence p0, int p1);

	public boolean setSelection (int p0, int p1)
	{
		return n_setSelection (p0, p1);
	}

	private native boolean n_setSelection (int p0, int p1);

	public boolean commitText (java.lang.CharSequence p0, int p1, android.view.inputmethod.TextAttribute p2)
	{
		return n_commitText (p0, p1, p2);
	}

	private native boolean n_commitText (java.lang.CharSequence p0, int p1, android.view.inputmethod.TextAttribute p2);

	public android.view.inputmethod.SurroundingText getSurroundingText (int p0, int p1, int p2)
	{
		return n_getSurroundingText (p0, p1, p2);
	}

	private native android.view.inputmethod.SurroundingText n_getSurroundingText (int p0, int p1, int p2);

	public void performHandwritingGesture (android.view.inputmethod.HandwritingGesture p0, java.util.concurrent.Executor p1, java.util.function.IntConsumer p2)
	{
		n_performHandwritingGesture (p0, p1, p2);
	}

	private native void n_performHandwritingGesture (android.view.inputmethod.HandwritingGesture p0, java.util.concurrent.Executor p1, java.util.function.IntConsumer p2);

	public boolean performSpellCheck ()
	{
		return n_performSpellCheck ();
	}

	private native boolean n_performSpellCheck ();

	public boolean previewHandwritingGesture (android.view.inputmethod.PreviewableHandwritingGesture p0, android.os.CancellationSignal p1)
	{
		return n_previewHandwritingGesture (p0, p1);
	}

	private native boolean n_previewHandwritingGesture (android.view.inputmethod.PreviewableHandwritingGesture p0, android.os.CancellationSignal p1);

	public boolean replaceText (int p0, int p1, java.lang.CharSequence p2, int p3, android.view.inputmethod.TextAttribute p4)
	{
		return n_replaceText (p0, p1, p2, p3, p4);
	}

	private native boolean n_replaceText (int p0, int p1, java.lang.CharSequence p2, int p3, android.view.inputmethod.TextAttribute p4);

	public boolean requestCursorUpdates (int p0, int p1)
	{
		return n_requestCursorUpdates (p0, p1);
	}

	private native boolean n_requestCursorUpdates (int p0, int p1);

	public void requestTextBoundsInfo (android.graphics.RectF p0, java.util.concurrent.Executor p1, java.util.function.Consumer p2)
	{
		n_requestTextBoundsInfo (p0, p1, p2);
	}

	private native void n_requestTextBoundsInfo (android.graphics.RectF p0, java.util.concurrent.Executor p1, java.util.function.Consumer p2);

	public boolean setComposingRegion (int p0, int p1, android.view.inputmethod.TextAttribute p2)
	{
		return n_setComposingRegion (p0, p1, p2);
	}

	private native boolean n_setComposingRegion (int p0, int p1, android.view.inputmethod.TextAttribute p2);

	public boolean setComposingText (java.lang.CharSequence p0, int p1, android.view.inputmethod.TextAttribute p2)
	{
		return n_setComposingText (p0, p1, p2);
	}

	private native boolean n_setComposingText (java.lang.CharSequence p0, int p1, android.view.inputmethod.TextAttribute p2);

	public boolean setImeConsumesInput (boolean p0)
	{
		return n_setImeConsumesInput (p0);
	}

	private native boolean n_setImeConsumesInput (boolean p0);

	public android.view.inputmethod.TextSnapshot takeSnapshot ()
	{
		return n_takeSnapshot ();
	}

	private native android.view.inputmethod.TextSnapshot n_takeSnapshot ();

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
