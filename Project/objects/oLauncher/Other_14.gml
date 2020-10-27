/// @description Salvar configurações do Launcher
ini_open(game_save_id+"config.ini")
ini_write_real("NINTY_CONFIG","fullscreen",fullscreen);
ini_write_real("NINTY_CONFIG","position",select_index);
ini_write_real("NINTY_CONFIG","parental",parental_control);
ini_write_real("NINTY_CONFIG","helptour",help_tour);
ini_write_real("NINTY_CONFIG","language",language);
ini_write_real("NINTY_CONFIG","uirender",uirender);
ini_write_real("NINTY_CONFIG","soundeffects",soundeffects);
ini_write_real("NINTY_CONFIG","windowmode",windowmode);
ini_write_real("NINTY_CONFIG","gamepriority",gamepriority);
ini_write_real("NINTY_CONFIG","updateninty",updateninty);
ini_write_real("NINTY_CONFIG","updatedatabase",updatedatabase);
ini_write_real("NINTY_CONFIG","nativerpc",nativerpc);
ini_write_real("NINTY_CONFIG","iconrpc",iconrpc);
ini_write_real("NINTY_CONFIG","clockmode",time_12h);
ini_close();

