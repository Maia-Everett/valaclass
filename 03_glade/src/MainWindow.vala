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
	public class MainWindow : Window {
		private int button_clicked = 0;
	
		public MainWindow () throws GLib.Error {
			title = "Glade/GtkBuilder Example Window";
			window_position = WindowPosition.CENTER;
			
			var builder = new Builder ();
			builder.add_from_file (PKGDATADIR + "/MainWindow.ui");
			
			var window_content = builder.get_object ("window_content") as Widget;
			add (window_content);
			
			// Configure widgets
			var info_label = builder.get_object ("info_label") as Label;
			
			var button = builder.get_object ("main_button") as Button;
			button.clicked.connect (() => {
				button_clicked++;
				
				var format_string = ngettext (
						"This <b>button</b> below has been clicked <b>%d</b> time.",
						"This <b>button</b> below has been clicked <b>%d</b> times.",
						button_clicked);
				
				info_label.set_markup (format_string.printf (button_clicked));
			});
		}
	}
}
