/*
	Copyright 2014 Maia Everett <maia@lucidfox.org>

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
*/

using Gtk;
using Constants;

namespace GladeExample {
	void init_gettext () {
		// Magic
		Intl.textdomain (GETTEXT_PACKAGE);
		Intl.bindtextdomain (GETTEXT_PACKAGE, DATADIR + "/locale");
		Intl.bind_textdomain_codeset (GETTEXT_PACKAGE, "utf-8");
	}

	void main(string[] args) {
		init_gettext ();
		Gtk.init (ref args);
	
		Window wnd;
		
		try {
			wnd = new MainWindow ();
		} catch (GLib.Error e) {
			// Terminate the application
			error (_("Cannot create main window: %s\n"), e.message);
		}
		
		// delete_event rather than destroy, to intercept the X button
		wnd.delete_event.connect (() => {
			var dialog = new MessageDialog (wnd, DialogFlags.MODAL, MessageType.WARNING, ButtonsType.OK_CANCEL,
					_("Are you sure you want to close the application?"));
			
			var response = dialog.run ();
			dialog.destroy ();
			
			return response != ResponseType.OK;
		});
		
		// And actually connect destroy, which is called if delete_event propagates
		wnd.destroy.connect (() => {
			Gtk.main_quit ();
		});
		
		wnd.show ();
		Gtk.main ();
	}
}
