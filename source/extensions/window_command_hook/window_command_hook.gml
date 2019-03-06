#define window_command_init
//#window_command_close = $F060:
//#window_command_maximize = $F030:
//#window_command_minimize = $F020:
//#window_command_restore = $F120:
//#window_command_resize = $F000:
//#window_command_move = $F010:

#define window_command_hook
/// (index): Hooks the specified command 
return window_command_hook_raw(window_handle(), argument0);

#define window_command_unhook
/// (index):
return window_command_unhook_raw(window_handle(), argument0);

#define window_command_run
/// (index, param = 0):
var wp = argument[0], lp;
if (argument_count > 1) {
	lp = argument[1];
} else lp = 0;
return window_command_run_raw(window_handle(), wp, lp);

#define window_command_get_active
/// (command): Returns whether the given command is currently available.
return window_command_get_active_raw(window_handle(), argument0);

#define window_command_set_active
/// (command, status:bool): Enables/disables the command. Returns -1 if not possible.
return window_command_set_active_raw(window_handle(), argument0, argument1);

#define window_set_topmost
/// (stayontop:bool): Allows to set a window to show on top of the rest like with GM8.
return window_set_topmost_raw(window_handle(), argument0);
