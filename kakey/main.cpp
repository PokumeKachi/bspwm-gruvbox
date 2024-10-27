// MINIMAL JAPANESE KEYBINDING PROGRAM

#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/keysym.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>

#define MOD_MASK (ControlMask | Mod1Mask) // Control + Alt


#define JPKEY1 102
#define JPKEY2 100
#define JPKEY3 101
#define JPKEY4 97
#define JPKEY5 132


void execute_command() {
    system("echo 'Hotkey pressed!'");
}

int main() {
    Display *display;
    Window root;
    XEvent event;

    display = XOpenDisplay(NULL);
    if (display == NULL) {
        fprintf(stderr, "Unable to open X display\n");
        return 1;
    }

    root = DefaultRootWindow(display);

    KeyCode keycode = XKeysymToKeycode(display, XK_A);
    XGrabKey(display, 132, 0, root, True, GrabModeAsync, GrabModeAsync);
    XG

    // Event loop
    while (true) {
        std::cout << "ye" << std::flush;
        XNextEvent(display, &event);
        std::cout << "ye" << std::flush;
        

        if (event.type == KeyPress) {
            // Check if the key pressed matches our hotkey
            if (/*event.xkey.state & MOD_MASK && */event.xkey.keycode == keycode) {
                execute_command();
            }
            if (event.xkey.keycode == JPKEY1) {
                execute_command();
            }
        }
    }

    // Cleanup
    XUngrabKey(display, keycode, MOD_MASK, root);
    XCloseDisplay(display);
    return 0;
}
