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

void main (string[] args) {
	Gtk.init (ref args);

	print ("Creating GTK Window...\n");
	
	// Initialize window and its contents
	var wnd = new Window ();
	wnd.title = "Some Window";
	wnd.window_position = WindowPosition.CENTER;
	wnd.set_default_size (350, 150);
	
	wnd.add (new Label ("Hello GTK!"));
	
	// Lambdas! Yay!
	wnd.destroy.connect (() => {
		message ("Hello, I'm the Close button!\n");
		Gtk.main_quit ();
	});
	
	// If you put just "wnd.show" here, the label won't be visible
	wnd.show_all ();
	
	// Enter main loop
	Gtk.main ();
	
	// When we get here, it is because the user requested exiting the main loop
	stdout.printf ("GTK Window closed\n");
}

