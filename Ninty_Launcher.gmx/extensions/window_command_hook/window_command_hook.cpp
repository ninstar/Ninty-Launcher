/// @author YellowAfterlife

#include "stdafx.h"
#include <map>

#define dllx extern "C" __declspec(dllexport)

WNDPROC window_command_proc_base = nullptr;
HWND window_command_hwnd = nullptr;
bool window_command_direct = false;
std::map<WPARAM, bool> window_command_hooks;
std::map<WPARAM, bool> window_command_blocks;
LRESULT window_command_proc_hook(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {
	//printf("msg=%d\n", msg); fflush(stdout);
    if (!window_command_direct) switch (msg) {
        case WM_SYSCOMMAND:
            auto cmd = wp & ~15;
            if (window_command_blocks.find(cmd) != window_command_blocks.end()) return TRUE;
            auto q = window_command_hooks.find(cmd);
            if (q != window_command_hooks.end()) {
                window_command_hooks[q->first] = true;
                return TRUE;
            }
            break;
    }
    return CallWindowProc(window_command_proc_base, hwnd, msg, wp, lp);
}
dllx double window_command_run_raw(char* cwnd, double wp, double lp) {
    window_command_direct = true;
    auto r = SendMessage((HWND)cwnd, WM_SYSCOMMAND, (WPARAM)wp, (LPARAM)lp);
    window_command_direct = false;
    return r;
}
dllx double window_command_cleanup() {
    if (window_command_proc_base != nullptr) {
        SetWindowLongPtr(window_command_hwnd, GWL_WNDPROC, (LONG_PTR)window_command_proc_base);
        window_command_proc_base = nullptr;
    }
    window_command_hooks.clear(); 
    return 1;
}
dllx double window_command_init_raw(char* cwnd) {
    //
    return 1;
}
dllx double window_command_bind_raw(char* cwnd) {
    if (window_command_proc_base == nullptr) {
        window_command_hwnd = (HWND)cwnd;
        window_command_proc_base = (WNDPROC)SetWindowLongPtr((HWND)cwnd, GWL_WNDPROC, (LONG_PTR)window_command_proc_hook);
    }
    return 1;
}
dllx double window_command_hook_raw(char* cwnd, double button) {
    auto wb = (WPARAM)button;
    if (window_command_hooks.find(wb) != window_command_hooks.end()) return 1;
    window_command_bind_raw(cwnd);
    window_command_hooks[wb] = false;
    return 1;
}
dllx double window_command_unhook_raw(double button) {
    auto wb = (WPARAM)button;
    auto q = window_command_hooks.find(wb);
    if (q != window_command_hooks.end()) {
        window_command_hooks.erase(q);
    }
    return 1;
}
long window_command_long(double cmd) {
    switch ((WPARAM)cmd) {
        case SC_SIZE: return WS_SIZEBOX;
        case SC_MINIMIZE: return WS_MINIMIZEBOX;
        case SC_MAXIMIZE: return WS_MAXIMIZEBOX;
        default: return -1;
    }
}
int window_command_acc_active(char* cwnd, double cmd, double _val) {
    auto hwnd = (HWND)cwnd;
    auto wcmd = (WPARAM)cmd;
    auto get = _val < 0;
    auto set = _val > 0;
    switch (wcmd) {
        case SC_MOVE: case SC_SIZE: case SC_MOUSEMENU: {
            auto q = window_command_blocks.find(wcmd);
            if (get) return q == window_command_blocks.end();
            auto z = q != window_command_blocks.end();
            if (set) {
                if (z) window_command_blocks.erase(q);
            } else {
                window_command_bind_raw(cwnd);
                if (!z) window_command_blocks[wcmd] = true;
            }
            return 1;
        }; break;
        case SC_CLOSE: {
            auto menu = GetSystemMenu(hwnd, false);
            if (get) return (GetMenuState(menu, wcmd, MF_BYCOMMAND) & MF_GRAYED) == 0;
            if (EnableMenuItem(menu, wcmd, MF_BYCOMMAND | (set ? MF_ENABLED : MF_GRAYED)) < 0) return -1;
            return 1;
        }; break;
        default: {
            auto cl = window_command_long(cmd);
            if (cl < 0) return -1;
            auto wl = GetWindowLong(hwnd, GWL_STYLE);
            if (get) return (wl & cl) == cl;
            if (set) wl |= cl; else wl &= ~cl;
            SetWindowLong(hwnd, GWL_STYLE, wl);
            return 1;
        }; break;
    }
}
dllx double window_command_get_active_raw(char* cwnd, double cmd) {
    return window_command_acc_active(cwnd, cmd, -1);
}
dllx double window_command_set_active_raw(char* cwnd, double cmd, double val) {
    return window_command_acc_active(cwnd, cmd, val > 0.5 ? 1 : 0);
}
/// Returns whether the given button was pressed since the last call to this function.
dllx double window_command_check(double button) {
    auto wb = (WPARAM)button;
    auto q = window_command_hooks.find(wb);
    if (q != window_command_hooks.end()) {
        if (q->second) {
            window_command_hooks[wb] = false;
            return 1;
        } else return 0;
    } else return 0;
}

dllx double window_set_topmost_raw(char* cwnd, double stayontop) {
	SetWindowPos((HWND)cwnd, stayontop > 0.5 ? HWND_TOPMOST : HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE | SWP_NOSIZE);
	return 1;
}
