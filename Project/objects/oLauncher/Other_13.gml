/// @description Textos predefinidos (Idioma)
/// @param Idioma

//Lista
text_settings_language[1] = "English";
text_settings_language[2] = "Português";
text_settings_language[3] = "Español";
text_settings_language[4] = "Français";
text_settings_language[5] = "Polski";
text_settings_language[6] = "Italiano";
text_settings_language[7] = "Русские";
text_settings_language_total = 7;

//Automático
var lang = 0;
if(language == 0){

    switch(os_get_language()){
    
        case("en"): lang = 1; break; //ENGLISH [Default]]
        case("pt"): lang = 2; break; //PORTUGUESE (Português)
        case("es"): lang = 3; break; //SPANISH (Español)
        case("fr"): lang = 4; break; //FRENCH (Français)
        case("pl"): lang = 5; break; //POLISH (Polski)
        case("it"): lang = 6; break; //ITALIAN (Italiano)
        case("ru"): lang = 7; break; //RUSSIAN (Русские)
        default: lang = 1;
    }
}
else
    lang = language;

//RUSSIAN (Русские) =====================================================
if(lang == 7){

//Interface --------------------------------------------------------------
text_deleting = "Удаление...";
text_moving = "Передвижение...";
text_notfound = "[НЕ ОБНАРУЖЕННО]";
text_forwarder[0] = "• Начать без игры";
text_forwarder[1] = "• Путь к файлу не найден.";
text_addforwarder = "Выберите любой файл";
text_dialog[0] = "Установите название игры:";
text_ctrl[0] = "Запустить";
text_ctrl[1] = "Закрыть";
text_ctrl[2] = "Передвигать";
text_ctrl[3] = "Отменить";
text_ctrl[4] = "Подтвердить";
text_icon[0] = "Убрать игру";
text_icon[1] = "Настроить игру";
text_icon[2] = "Найти игру";
text_icon[3] = "Цвет стиля";
text_icon[4] = "Задний фон";
text_icon[5] = "Добавить новою игру";
text_addgame[0] = "[ Использовать как ярлык? ]: Эта настройка полезна для приложений которые не являются играми, или программы которые используют потентованные лаунчеры (Например инструменты) | УЧТИТЕ: Если вы выберите эту настройку, то время игры не будет записано, а лаунчер не закроется.";
text_addgame[1] = "[ Использовать как FORWARDER? ]: Эта настройка полезна для эмуляторов, вы можете запустить один или более ROMов прямо из Ninty. | УЧТИТЕ: В следующем шаге вам потребуется выбрать папку в которой расположены ROMы.";
text_settings_title = "Настройки";
text_settings[0] = "Язык";
text_settings[1] = "Прорисовка интерфейса";
text_settings[2] = "Звуковые эффекты";
text_settings[3] = "Окно игры";
text_settings[4] = "Приоретет игры";
text_settings[5] = "Проверить на обновления";
text_settings[6] = "База данных обновлений";
text_settings[7] = "Папка профиля";
text_settings[8] = "Гид";
text_settings[9] = "Native Rich Presence";
text_settings_onoff[0] = "Выключено";
text_settings_onoff[1] = "Включено"; 
text_settings_language[0] = "Также как и в системе";  
text_settings_uirender[0] = "Совместимый";
text_settings_uirender[1] = "Современный";
text_settings_windowmode[0] = "Также как и Ninty";
text_settings_windowmode[1] = "Обычное";
text_settings_windowmode[2] = "Максимизированное";
text_settings_gamepriority[0] = "Нормально (Рекомдуется)";
text_settings_gamepriority[1] = "Высоко";
text_settings_gamepriority[2] = "Низко";
text_update[0] = "Перейти на страницу скачивания";
text_update[1] = "Возможно позже";
text_remove[0] = "Да";
text_remove[1] = "Нет";
text_rpc[0] = "Выбираем игру...";
text_rpc[1] = "Игры в библеотеке.";
//Ninny ------------------------------------------------------------------
guide[0] = @"Добро пожаловать в Лаунчер Ninty!
Меня зовут Нина, я буду вашим проводником и гидом.";

guide[1] = @"Ninty это лаунчер основанный на интерфейсе
Nintendo Switch для запуска ваших игр.";

guide[2] = @"Также, Ninty поддерживает
программы которые не являются играми.";

guide[3] = "Ну, давайте же начнем!.";

guide[4] = @"С помощью этих кнопок вы можете убрать
игру, добавить или поменять стиль лаунчера.";

guide[5] = @"Поосторожнее с кнопкой которая выглядит как мусорка, 
она опасна! Мы не хотим чтобы вы потеряли свое время игры...";

guide[6] = @"Но не волнуйтесь, чтобы избежать ситуаций вроде таких, 
у нас есть функция закрепления.";

guide[7] = @"Нажми 3 раза на эту настройку чтобы спрятать все основные 
функции, так можно избежать передвижения игр и приложений.";

guide[8] = @"Чтобы все вернуть на свои места,
нажми 3 раза на тоже место.";

guide[9] = @"Здесь можно найти всю информацию о лаунчере,
а также версию и кто помог
разроботке этого лаунчера.";

guide[10] = "Здесь распологаются настройки лаунчера.";

guide[11] = @"Меню начинается здесь, эта настройка ведет вас к
папке профиля вашего Ninty.";

guide[12] = @"Каждый пользователь на компьютере имеет собственный профиль,
а также папку с этим профилем, у каждого профиля свои игры, 
задний фои стиль и настройки.";

guide[13] = @"Если вы планируете изменить профиль или компьютер 
и хотите сохранить ваши настройки и время проведенное в играх,
сделайте копию этой папки.";

guide[14] = @"С этой настройкой, Ninty будет всегда проверять и
скачивать последнюю версию игры каждый раз,
когда вы запускаете ее.";

guide[15] = @"Каждый раз, когда лаунчер обновляется, 
будет проигранна анимация.";

guide[16] = @"Если вы включите эту настройку, я буду вам напоминать
о новых обновлениях Ninty!";

guide[17] = "Эта настройка устонавливает приоритет запуска игры.";

guide[18] = @"Я бы не рекомендовала менять это, так-как это может
повлиять производительность вашего компьютера в зависимости
от запущенной игры... БЕЗ ШУТОК!";

guide[19] = @"Эта настройка позволяет вам изменить размер окна игры
после ее запуска, однако это работает не во всех играх.";

guide[20] = @"Некоторые требуют вас играть в оконном режиме, это
не хорошо в зависимости от производительности вашего компьютера...";

guide[21] = @"С помощью этой настройки вы можете отключить все 
звуки Лаунчера, кроме музыки на заднем фоне.";

guide[22] = @"Эта настройка позволяет вам настроить способ прорисовки 
интерфейса, это особенно важно, так-как некоторые компьютеры
демонстрировать графические баги.";

guide[23] = @"'Совместимый' режим решает большинство проблем,
это стардартная настройка";

guide[24] = @"Но я рекомендую использовать 'Современный' режим, 
в нем лучше визуальные эффекты и производительность.";

guide[25] = "И наконец, эта настройка меняет язык лаунчера.";

guide[26] = "Не волнуйтесь, я знаю много языков!";

guide[27] = @"Если вы хотите доступ к гиду, выберете
вот это, я всегда вам помогу!";

guide[28] = "Ох! Чуть не забыла...";

guide[29] = @"Если вы используете Discord, это лучшее место для вас.
Ninty показывает статус вашей библиотеки игр
на вашем профиле когда вы играете!";

guide[30] = "Здесь большой выбор стилей для вас, наслаждайтесь!";
 
guide[31] = "Доступно новое обновление:  "+vnew+@"
версия в которой вы сейчас находитесь: "+vold;

guide[32] = @"Без проблем!
Я напомню вам позже.";

guide[33] = @"Вы действительно хотите убрать 
эту игру из вашей библиотеки?";
}
//ITALIAN (Italiano) =====================================================
else if(lang == 6){

//Interface --------------------------------------------------------------
text_deleting = "Cancellando...";
text_moving = "Spostando...";
text_notfound = "[NON TROVATO]";
text_forwarder[0] = "• Avvia senza gioco";
text_forwarder[1] = "• Percorso del File non trovato";
text_addforwarder = "Seleziona un File";
text_dialog[0] = "Imposta il nome del Gioco:";
text_ctrl[0] = "Avvia";
text_ctrl[1] = "Chiudi";
text_ctrl[2] = "Muovi";
text_ctrl[3] = "Cancella";
text_ctrl[4] = "Conferma";
text_icon[0] = "Rimuovi Gioco";
text_icon[1] = "Modifica Gioco";
text_icon[2] = "Cerca un Gioco";
text_icon[3] = "Colore del Tema";
text_icon[4] = "Sfondo";
text_icon[5] = "Aggiungi un nuovo Gioco";
text_addgame[0] = "[ Utilizzare come un COLLEGAMENTO? ]: Questa opzione è utile per applicazioni che non sono giochi, o software che utilizzano launcher propri (come alcuni strumenti) | NOTA: Quando avvii un collegamento tramite Ninty, il tempo di gioco non sarà registrato e il launcher non verrà sospeso.";
text_addgame[1] = "[ Utilizzare come un FORWARDER? ]: Questa opzione è utile per gli emulatori, puoi avviare una o più ROM direttamente da Ninty. | NOTA: Nel passo successivo dovrai selezionare il percorso dove si trovano le ROM.";
text_settings_title = "Impostazioni";
text_settings[0] = "Lingua";
text_settings[1] = "Resa dell'interfaccia";
text_settings[2] = "Effetti sonori";
text_settings[3] = "Finestra di Gioco";
text_settings[4] = "Priorità del Gioco";
text_settings[5] = "Controlla aggiornamenti";
text_settings[6] = "Aggiorna database";
text_settings[7] = "Cartella del profilo";
text_settings[8] = "Guida";
text_settings[9] = "Rich Presence Nativa";
text_settings_onoff[0] = "No";
text_settings_onoff[1] = "Si"; 
text_settings_language[0] = "Uguale al Sistema";  
text_settings_uirender[0] = "Compatibile";
text_settings_uirender[1] = "Moderna";
text_settings_windowmode[0] = "Uguale a Ninty";
text_settings_windowmode[1] = "Predefinita";
text_settings_windowmode[2] = "Ingrandita";
text_settings_gamepriority[0] = "Predefinita (Raccomandata)";
text_settings_gamepriority[1] = "Alta";
text_settings_gamepriority[2] = "Bassa";
text_update[0] = "Vai alla pagina del Download";
text_update[1] = "Magari dopo";
text_remove[0] = "Sì";
text_remove[1] = "No";
text_rpc[0] = "Selezionando un Gioco...";
text_rpc[1] = "Giochi in libreria.";
//Ninny ------------------------------------------------------------------
guide[0] = @"Benvenuto su Ninty Launcher!
Il mio nome è Ninny, e sarò la tua guida.";

guide[1] = @"Ninty è un launcher basato sull'interfaccia 
Switch per avviare i tuoi Giochi.";

guide[2] = @"Ma non solo: Ninty supporta vari
tipi di software oltre ai Giochi.";

guide[3] = "Bene, penso che possiamo iniziare.";

guide[4] = @"Queste sono le icone funzionali, con esse puoi cambiare
un Gioco, aggiungerne uno nuovo oppure cambiare il tema.";

guide[5] = @"Ma stai attento all'icona del cestino, è pericolosa!
Non vogliamo che tu perda il tuo tempo di gioco...";

guide[6] = @"Ma non ti preoccupare, per evitare situazioni 
come questa, esiste un'opzione di blocco.";

guide[7] = @"Clicca 3 volte su questa opzione per nascondere tutte le 
funzioni principali, così da prevenire lo spostamento di 
Giochi e App.";

guide[8] = @"Per far riapparire le funzioni dovrai cliccare
per 3 volte nello stesso posto.";

guide[9] = @"Qui puoi accedere alle informazioni del Launcher,
alla versione attuale e alle persone che hanno 
contribuito a svilupparlo.";

guide[10] = "Quest'altro ti farà accedere alle impostazioni di Ninty.";

guide[11] = @"Il menù comincia qui, questa impostazione ti porta
alla cartella del tuo profilo di Ninty.";

guide[12] = @"Ogni utente sul computer ha una cartella come 
questa, e quindi ognuno ha la sua lista di Giochi,
i suoi temi e le sue impostazioni.";

guide[13] = @"Se pensi di cambiare account o computer e vuoi che i 
tuoi dati siano al sicuro, fai un backup di questa cartella.";

guide[14] = @"Con questa impostazione, Ninty cercherà e 
scaricherà sempre il database dei Giochi più recente ogni
volta che lo avvierai.";

guide[15] = @"Un'animazione apparira ogni volta che il Launcher
sta scaricando qualcosa dal database.";

guide[16] = @"Se abiliti questa impostazione, ti avviserò
ogni volta che c'è una nuova versione di Ninty!";

guide[17] = "Questa impostazione stabilisce la priorità dei Giochi.";

guide[18] = @"Non ti consiglio di cambiare questo poiché potrebbe avere 
un impatto immediato sulla performance del tuo computer a 
seconda del Gioco che hai avviato... SUL SERIO!";

guide[19] = @"Con questa impostazione puoi cambiare la dimensione 
della finestra di Gioco dopo averlo avviato, ma non 
funziona con tutti i Giochi.";

guide[20] = @"Alcuni ti forzeranno a giocare in modalità finestra, 
qualcosa che a seconda delle tue preferenze può risultare 
non piacevole...";

guide[21] = @"Con questa impostazione puoi disattivare tutti gli effetti 
sonori del Launcher, eccetto i temi contenenti musica.";

guide[22] = @"Con questa impostazione puoi scegliere il metodo di resa 
dell'interfaccia, ed è estremamente importante poiché alcuni 
computer possono presentare bug grafici.";

guide[23] = @"La modalità 'Compatibile' può risolvere gran parte di
questi problemi, ed è l'opzione predefinita";

guide[24] = @"Ma ti consiglio di utilizzare la modalità 'Moderna', 
essa ti offre grafica e performance migliorate.";

guide[25] = @"E infine, questa impostazione ti permette di 
cambiare la lingua del Launcher.";

guide[26] = "Ma non ti preoccupare, so parlare molte lingue!";

guide[27] = @"Se vuoi accedere alla guida di nuovo puoi selezionare 
questa opzione e sarò sempre con te ad aiutarti!";

guide[28] = "Oh! Quasi dimenticavo...";

guide[29] = @"Se usi Discord, questo è il posto migliore per te.
Ninty ti mostra lo stato della tua libreria nel tuo
profilo quando stai giocando!";

guide[30] = "Ci sono svariati temi per te, divertiti!";
 
guide[31] = "Un nuovo aggiornamento è disponibile: "+vnew+@"
la tua versione corrente è: "+vold;

guide[32] = @"Nessun problema!
Te lo ricorderò più tardi.";

guide[33] = @"Vuoi davvero rimuovere questo 
gioco dalla tua libreria?";
}
//POLISH (Polski) ========================================================
else if(lang == 5){
 
//Interface --------------------------------------------------------------
text_deleting = "Usuwanie...";
text_moving = "Przesuwanie...";
text_notfound = "[NIE ZNALEZIONO]";
text_forwarder[0] = "• Rozpocznij bez gry";
text_forwarder[1] = "• Nie znaleziono œcieżki pliku.";
text_addforwarder = "Wybierz jakikolwiek plik";
text_dialog[0] = "Ustaw nazwę gry:";
text_ctrl[0] = "Rozpocznij";
text_ctrl[1] = "Zamknij";
text_ctrl[2] = "Przesuń";
text_ctrl[3] = "Anuluj";
text_ctrl[4] = "PotwierdŸ";
text_icon[0] = "Usuń grę";
text_icon[1] = "Zmodyfikuj grę";
text_icon[2] = "Szukaj gry";
text_icon[3] = "Kolor Motywu";
text_icon[4] = "Tapeta";
text_icon[5] = "Dodaj grę";
text_addgame[0] = "[ Użyćjako SKRÓT? ]: Ta opcja jest pożyteczna dla aplikacji które nie są grami, lub programów które używają własnych launcherów (jak przybory) | UWAGA: Kiedy włączasz skrót przez Ninty, czas gry nie będzie licznony i launcher zostanie wstrzymany.";
text_addgame[1] = "[ Użyćjako TRYB WYSY£AJ¥CY? ]: Ta opcja jest pożyteczna dla emulatorów, możesz włączyćjeden lub więcej ROMów bezpoœrednio z Ninty. | UWAGA: W następnym kroku musisz wybraćfolder docelowy w którym znajdują się ROMy.";
text_settings_title = "Ustawienia";
text_settings[0] = "Język";
text_settings[1] = "Renderowanie Interfejsu";
text_settings[2] = "Efekty Dzwiękowe";
text_settings[3] = "Okno Gry";
text_settings[4] = "Pierwszeństwo gry";
text_settings[5] = "Sprawdzanie Aktualizacji";
text_settings[6] = "Baza Danych Aktualizacji";
text_settings[7] = "Folder Profilu";
text_settings[8] = "Poradnik";
text_settings[9] = "Rich Presence";
text_settings_onoff[0] = "Wyłączone";
text_settings_onoff[1] = "Włączone"; 
text_settings_language[0] = "Jak system";  
text_settings_uirender[0] = "Kompatibilne";
text_settings_uirender[1] = "Nowoczesne";
text_settings_windowmode[0] = "Takie Same jak Ninty";
text_settings_windowmode[1] = "Domyœlne";
text_settings_windowmode[2] = "Zmaksymalizowane";
text_settings_gamepriority[0] = "Normalne (Rekomendowane)";
text_settings_gamepriority[1] = "Duże";
text_settings_gamepriority[2] = "Małe";
text_update[0] = "PrzejdŸ do strony pobierania";
text_update[1] = "Może póżniej";
text_remove[0] = "Tak";
text_remove[1] = "Nie";
text_rpc[0] = "Wybieranie gry...";
text_rpc[1] = "Gry w bibliotece.";
//Ninny ------------------------------------------------------------------
guide[0] = @"Witaj w Ninty Launcher!
Nazywam się Ninny, i będe twoim przewodnikiem.";

guide[1] = @"Ninty to launcher bazowany na interfejsu Nintendo 
Switch'a aby włączaćswoje gry.";

guide[2] = @"Lecz nie tylko to: Ninty obsługuje różne
typy programów oprócz gier.";

guide[3] = "Dobrze, myœlę że możemy zacząæ.";

guide[4] = @"To są ikony funkcji. Z nimi możesz zmieniæ
grę, dodaćinną lub zmienićmotyw launchera.";

guide[5] = @"Ale bądŸ ostrożny z ikoną kosza na œmieci, jest niebezpieczna!
Nie chcemy, abyœ stracił swój czas gry...";

guide[6] = @"Lecz się nie martw. Aby zapobiec takim sytuacjom, 
mamy funkcje zablokowania funkcji interfejsu.";

guide[7] = @"Kliknij trzy razy na ikonę kłódki aby ukryćwszystkie główne 
funkcje, zapobiegająćusuwania lub przesuwania gier.";

guide[8] = @"Aby te funkcje się znowu pojawiły, musisz
kliknąćte same miejsce trzy razy.";

guide[9] = @"Tutaj możesz zobaczyćinformacje o launcherze,
aktualną wersję oraz ludzi, którzy
przyczynili się do produkcji Ninty.";

guide[10] = "Ten przycisk pokazuje ci opcje Ninty.";

guide[11] = @"Menu zaczyna się tutaj. Ta opcja prowadzi cię
do folderu twojego profilu Ninty.";

guide[12] = @"Każda osoba na komputerze ma taki
folder, więćkażdy ma inną listę gier,
motywy i ustawienia.";

guide[13] = @"Jeœli planujesz zmienićswoje konto lub komputer i
chcesz zachowaćwszystkie rekordy, utwórz kopię 
zapasową tego folderu.";

guide[14] = @"Z tą opcją, Ninty zawsze będzie sprawdzaći
pobieraćnajnowszą baze danych gier za każdym 
razem kiedy włączasz Ninty.";

guide[15] = @"Pojawi się animacja kiedy launcher
pobiera coœ z bazy danych.";

guide[16] = @"Jeœli włączysz tą opcje, powiadomie cię za 
każdym razem kiedy jest nowa wersja Ninty!";

guide[17] = "Ta opcja zmienia pierwszeństwo procesu gry.";

guide[18] = @"Nie polecam ci tego zmieniaæ, bo może miećnatychmiastowy 
wpływ na wydajnoœćkomputera w zależnoœci gry co została 
włączona... NAPRAWDÊ!";

guide[19] = @"Ta opcja zmienia wielkoœćokna gry po jej włączeniu, 
ale ta opcja nie działa ze wszystkimi grami.";

guide[20] =@"Niektóre cię zmuszą do grania w trybie okna, coœ
niezbyt dobrego w zależnoœci twoich preferencji...";

guide[21] = @"Z tym ustawieniem możesz wyłączyćwszystkie efekty
dzwiękowe launchera, oprócz motywów zawierających muzykę.";

guide[22] = @"Ta opcja zmienia metodę renderowania interfejsu
i ona jest bardzo ważna bo niektóre komputery mogą
pokazywaćbłędy graficzne.";

guide[23] = @"Tryb 'Kompatibilny' może rozwiązaćdużą iloœćtych
problemów, to domyœlne ustawienie.";

guide[24] = @"Lecz polecam ci używaćtryb 'Nowoczesny', ten tryb 
daje lepsze efekty wizualne oraz lepszą wydajnoœæ.";

guide[25] = "I wreszczie, ta opcja może zmienićjęzyk launchera.";

guide[26] = "Lecz się nie martw, umiem mówićwieloma językami!";

guide[27] = @"Jeœli chcesz ponownie uzyskaćdostęp do przewodnika 
możesz wybraćtą opcje. Zawsze tutaj będę ci pomóc!";

guide[28] = "O tak! I nie mogę zapomnieæ...";

guide[29] = @"Jesli używasz Discord'a, to dla ciebie najlepsze miejsce.
Ninty pokazuje status twojej biblioteki gry w twoim
profilu kiedy grasz!";

guide[30] = "Są dla ciebie różne motywy, baw się dobrze!";
 
guide[31] = "Nowa aktualizacja jest dostępna:  "+vnew+@"
twoja wersja to: "+vold;

guide[32] = @"Nie ma problemu!
Przypomnę ci póŸniej.";

guide[33] = @"Czy jesteś absolutnie pewien że
chcesz usunąć tą grę z biblioteki?";
}
//FRENCH (Français) ======================================================
else if(lang == 4){
 
//Interface --------------------------------------------------------------
text_deleting = "Suppression...";
text_moving = "Déplacement...";
text_notfound = "[PAS TROUVÉ]";
text_forwarder[0] = "• Lancer sans jeu";
text_forwarder[1] = "• Fichier non trouvé.";
text_addforwarder = "Sélectionnez n'importe quel fichier";
text_dialog[0] = "Définir le titre du jeu:";
text_ctrl[0] = "Lancer";
text_ctrl[1] = "Fermer";
text_ctrl[2] = "Déplacer";
text_ctrl[3] = "Annuler";
text_ctrl[4] = "Confirmer";
text_icon[0] = "Retirer le jeu";
text_icon[1] = "Modifier le jeu";
text_icon[2] = "Rechercher un jeu";
text_icon[3] = "Couleur du thème";
text_icon[4] = "Changer de thème";
text_icon[5] = "Ajouter un nouveau jeu";
text_addgame[0] = "[ Utiliser comme un RACCOURCI? ] : Cette option est utile pour les applications qui ne sont pas des jeux ou des outils | NOTE : lorsque vous lancez un raccourci via Ninty, le temps de jeu ne sera pas enregistré et le lanceur ne sera pas suspendu.";
text_addgame[1] = "[Utiliser comme EXPÉDITEUR? ]: Cette option est utile pour les émulateurs, vous pouvez exécuter une ou plusieurs ROM directement à partir de Ninty. | REMARQUE: à l'étape suivante, vous devez choisir le dossier de destination dans lequel se trouvent les ROM.";
text_settings_title = "Paramètres";
text_settings[0] = "Langue";
text_settings[1] = "Rendu d'interface";
text_settings[2] = "Effets sonores";
text_settings[3] = "Fenêtre de jeu";
text_settings[4] = "Priorité du jeu";
text_settings[5] = "Mise à jour";
text_settings[6] = "Mise à jour de la base de données";
text_settings[7] = "Dossier du profil";
text_settings[8] = "Guide";
text_settings[9] = "Activer Rich Presence";
text_settings_onoff[0] = "Off";
text_settings_onoff[1] = "On"; 
text_settings_language[0] = "Identique au système";  
text_settings_uirender[0] = "Compatible";
text_settings_uirender[1] = "Moderne";
text_settings_windowmode[0] = "Identique à Ninty";
text_settings_windowmode[1] = "Par défaut";
text_settings_windowmode[2] = "Maximum";
text_settings_gamepriority[0] = "Normal (Recommandé)";
text_settings_gamepriority[1] = "Faible";
text_settings_gamepriority[2] = "Elevé";
text_update[0] = "Aller à la page de téléchargement";
text_update[1] = "Plus tard";
text_remove[0] = "Oui";
text_remove[1] = "Non";
text_rpc[0] = "Sélection d'un jeu...";
text_rpc[1] = "Jeux dans la bibliothèque.";
//Ninny ------------------------------------------------------------------
guide[0] = @"Bienvenue sur Ninty Launcher!
Je m'appelle Ninny et je serai votre guide";

guide[1] = @"Ninty est un lanceur de jeu basé sur l’interface
de la Nintendo Switch pour lancer vos jeux.";

guide[2] = @"Mais pas seulement cela: Ninty est compatible 
avec divers types de logiciels en plus des jeux";

guide[3] = "Eh bien, je pense que nous pouvons commencer.";

guide[4] = @"Ce sont des fonctions vous permettant de modifier, ajouter 
un jeu, ou de modifier le thème du lanceur de jeu.";

guide[5] = @"Mais attention à l’icône de la corbeille, c'est dangereux! 
Nous ne voulons pas que vous perdiez le temps de jeu de 
votre jeu..";

guide[6] = @"Mais ne vous inquiétez pas, pour éviter que cela arrive, il y 
a une option de verrouillage de l'interface.";

guide[7] = @"Cliquez 3 fois sur cette option pour masquer les boutons 
principales, De cette façon,vous ne pourrez pas déplacer ou 
supprimer les jeux et les applications accidentellement.";

guide[8] = @"Pour afficher à nouveau ces fonctions, vous devrez 
cliquer au même endroit 3 fois.";

guide[9] = @"Ici vous pouvez accéder aux informations du lanceur de jeu, 
ainsi que la version actuelle et les personnes qui ont contribué 
à son développement.";

guide[10] = "Et ici l’accès aux paramètres de Ninty.";

guide[11] = @"Le menu commence ici, ce réglage vous mène au dossier 
de votre profil sur Ninty.";

guide[12] = @"Chaque utilisateur a son propre profil, donc tout le monde 
a ses propres jeux, liste, thèmes et paramètres.";

guide[13] = @"Si vous envisagez de changer de compte ou d'ordinateur, 
faites une sauvegarde de ce dossier si vous souhaitez 
garder votre profil.";

guide[14] = @"Avec ce réglage, Ninty vérifiera toujours et téléchargera 
à chaque fois la base de données de jeux la plus récente.";

guide[15] = @"Cette animation apparaîtra à chaque fois que le lanceur 
de jeu télécharge quelque chose sur la base de données.";

guide[16] = @"Si vous activez ce paramètre, je vous alerterai à chaque 
fois qu'il y a une nouvelle version de Ninty!";

guide[17] = "Ce paramètre définit la priorité du processus du jeu.";

guide[18] = @"Je ne vous recommande pas de changer cela car il peut y 
avoir un impact immédiat sur les performances de votre 
ordinateur en fonction du jeu que vous avez commencé... 
POUR DE VRAI!";

guide[19] = @"Ce paramètre vous permet de définir la taille de la fenêtre 
du jeu mais cela ne fonctionne pas avec tous les jeux.";

guide[20] = @"Certains vont vous forcer à jouer en mode fenêtré, 
quelque chose de pas très bon selon vos préférences.";

guide[21] = @"Avec ce réglage, vous pouvez désactiver tous les 
sons dulanceur de jeu. À l'exception des thèmes 
contenant de la musique.";

guide[22] = @"Ce paramètre vous permet de définir la méthode de 
rendu d'interface, et c’est extrêmement important 
puisque certains ordinateurs peuvent montrer des 
bugs graphiques.";

guide[23] = @"Le mode 'Compatible' peut résoudre une bonne 
partie de ces problèmes, c'est le réglage standard.";

guide[24] = @"Mais je vous recommande d'utiliser le mode 
'Moderne', il offre de meilleurs effets visuels 
et une meilleure performance";

guide[25] = @"Et enfin, ce paramètre peut changer 
la langue du lanceur de jeu.";

guide[26] = "Mais ne vous inquiétez pas, je parle beaucoup de langues!";

guide[27] = @"Si vous souhaitez accéder à nouveau au guide, vous pouvez 
sélectionner cette option. Je serai toujours là pour vous aider!";

guide[28] = "Oh! J’ai failli oublier...";

guide[29] = @"Si vous utilisez Discord, c'est le meilleur endroit pour 
vous. Ninty indique l’état de votre bibliothèque de jeux 
dans votre profil lorsque vous jouez!";

guide[30] = "Il y a plusieurs thèmes pour vous, profitez-en!";
 
guide[31] = "Une nouvelle mise à jour est disponible:  "+vnew+@"
votre version actuelle est: "+vold;

guide[32] = @"Pas de problème! 
Je vous en rappellerais un peu plus tard.";

guide[33] = @"Voulez-vous vraiment supprimer 
ce jeu de votre bibliothèque?";
}
//SPANISH (Español) ======================================================
else if(lang == 3){

//Interface --------------------------------------------------------------
text_deleting = "Eliminando...";
text_moving = "Moviendo...";
text_notfound = "[NO SE ENCONTRÓ]";
text_forwarder[0] = "• Empezar sin juego";
text_forwarder[1] = "• No se han encontrado la carpeta de destino.";
text_addforwarder = "Seleccione cualquier archivo";
text_dialog[0] = "Establecer el título del juego:";
text_ctrl[0] = "Empezar";
text_ctrl[1] = "Cerrar";
text_ctrl[2] = "Mover";
text_ctrl[3] = "Cancelar";
text_ctrl[4] = "Confirmar";
text_icon[0] = "Remover Juego";
text_icon[1] = "Cambiar Juego";
text_icon[2] = "Buscar un Juego";
text_icon[3] = "Color de Tema";
text_icon[4] = "Fondo de Pantalla";
text_icon[5] = "Agregar Nuevo Juego";
text_addgame[0] = "[ ¿Utilizar como ATAJO? ]: Esta opción es útil para aplicaciones que no son juegos, o softwares que utilizan lanzadores propietarios (como herramientas) | NOTA: Cuando inicias un atajo a través de Ninty, el tiempo del juego no se registrará y el lanzador no se suspenderá.";
text_addgame[1] = "[ ¿Utilizar como FORWARDER? ]: Esta opción es útil para los emuladores, Puede ejecutar una o más ROM directamente de Ninty. | NOTA: En el siguiente paso, debe elegir la carpeta de destino donde se encuentran las ROM.";
text_settings_title = "Ajustes";
text_settings[0] = "Idioma";
text_settings[1] = "Renderización de la interfaz";
text_settings[2] = "Efectos de sonido";
text_settings[3] = "Ventana de los juegos";
text_settings[4] = "Prioridad de los juegos";
text_settings[5] = "Buscar actualizaciones";
text_settings[6] = "Actualizar base de datos";
text_settings[7] = "Carpeta de perfil";
text_settings[8] = "Guia";
text_settings[9] = "Rich Presence nativa";
text_settings_onoff[0] = "Apagada";
text_settings_onoff[1] = "Ligada";
text_settings_language[0] = "El mismo del sistema";  
text_settings_uirender[0] = "Compatible";
text_settings_uirender[1] = "Moderno";
text_settings_windowmode[0] = "El mismo de Ninty";
text_settings_windowmode[1] = "Estándar";
text_settings_windowmode[2] = "Maximizada";
text_settings_gamepriority[0] = "Normal (Recomendado)";
text_settings_gamepriority[1] = "Alta";
text_settings_gamepriority[2] = "Baja";
text_update[0] = "Ir a la página de descarga";
text_update[1] = "Quizas mas tarde";
text_remove[0] = "Sí";
text_remove[1] = "No";
text_rpc[0] = "Seleccionando un Juego...";
text_rpc[1] = "Juegos en la Biblioteca";
//Ninny ------------------------------------------------------------------
guide[0] = @"¡Bienvenido a Ninty Launcher!
Mi nombre es Ninny, y seré tu guía.";

guide[1] = @"Ninty es un 'Launcher' basado en la
interfaz de Nintendo Switch para iniciar tus juegos.";

guide[2] = @"No sólo eso: Ninty soporta varios
tipos de software además de juegos.";

guide[3] = "Pues vale, creo que podemos empezar.";

guide[4] = @"Estos son los íconos de función, con ellos puedes 
modificar un juego, agregar uno nuevo o cambiar el tema del Launcher.";

guide[5] = @"Pero cuidado con el ícono de el cesto de basura, ¡es peligroso!
No queremos que pierdas tus tiempos de juego...";

guide[6] = @"Pero no te preocupes, para evitar situaciones como esta, 
tenemos el botón de bloqueo de la interfaz.";

guide[7] = @"Haz clic 3 veces en esta opción para esconder todas las 
funciones principales, así se evita mover o eliminar juegos.";

guide[8] = @"Para volver a mostrar estas opciones tendrás 
que hacer clic 3 veces de nuevo.";

guide[9] = @"Aquí puedes acceder a la información del Launcher,
al igual que la versión del mismo y las personas que
contribuyeron a su desarrollo.";

guide[10] = "Este otro da acceso a las opciones de Ninty.";

guide[11] = @"El menú empieza aquí, esta opción te lleva a tu
carpeta de perfil de Ninty.";

guide[12] = @"Cada usuario en esta computadora tiene su propia carpeta 
al igual que esta, por lo cual todos tienen su propia lista
de juegos, temas y opciones.";

guide[13] = @"Si planeas cambiar de cuenta o computador y quieres mantener
tus récords, haz una copia de seguridad de esta carpeta.";

guide[14] = @"Con esta opción, Ninty siempre revisará y descargará 
la base de datos de juegos más reciente cada vez 
que inicies el Launcher.";

guide[15] = @"Una animación aparecerá cada vez que Launcher esté 
descargando algo de la base de datos.";

guide[16] = @"Si habilitas esta opción, ¡te avisaré cada vez
que haya una nueva versión de Ninty!";

guide[17] = "Esta opción cambia la prioridad del proceso del juego.";

guide[18] = @"No recomiendo cambiar esto ya que puede tener un impacto
inmediato en el rendimiento de tu computador dependiendo en el
juego que hayas iniciado... ¡DE VERAS!";

guide[19] = @"Esta opción te permite ajustar el tamaño de ventana del juego 
después de iniciado, pero no funciona con todos los juegos.";

guide[20] = @"Algunos te forzarán a jugar en modo ventana, algo
no muy bueno dependiendo en tus preferencias...";

guide[21] = @"Esta opción apaga todos los efectos de sonido del Launcher,
excepto la música de los temas (si aplica).";

guide[22] = @"Esta opción te permite cambiar el modo de renderizado, y es 
extremadamente importante ya que algunas computadoras muestran 
errores gráficos.";

guide[23] = @"El modo 'compatible' resuelve la mayoría de 
los problemas, y es la opción por defecto";

guide[24] = @"Pero recomiendo el modo 'moderno', 
porque ofrece mejores efectos visuales y mejor rendimiento.";

guide[25] = "Y para finalizar, esta opción cambia el lenguaje del Launcher.";

guide[26] = "No te preocupes, ¡puedo hablar varios lenguajes!";

guide[27] = @"Si quieres acceder a la guía otra vez, selecciona esta opción. 
¡Siempre estaré aquí para ayudarte!";

guide[28] = "¡Oh! Por poco se me olvida...";

guide[29] = @"Si usas Discord, te tengo buenas noticias.
¡Ninty muestra el estado de tu librería de 
juegos en tu perfil mientras juegas!";

guide[30] = "¡He aquí varios temas para ti, disfruta!";
 
guide[31] = "Nueva actualización disponible:  "+vnew+@"
tu versión actual es: "+vold;

guide[32] = @"¡Vale!
Te recordaré más tarde.";

guide[33] = @"¿Realmente quieres eliminar
este juego de tu biblioteca?";
}
//PORTUGUESE (Português) =================================================
else if(lang == 2){

//Interface --------------------------------------------------------------
text_deleting = "Deletando...";
text_moving = "Movendo...";
text_notfound = "[NÃO LOCALIZADO]";
text_forwarder[0] = "• Iniciar sem jogo";
text_forwarder[1] = "• Pasta de destino não encontrada.";
text_addforwarder = "Selecione qualquer arquivo";
text_dialog[0] = "Defina o título do jogo:";
text_ctrl[0] = "Iniciar";
text_ctrl[1] = "Fechar";
text_ctrl[2] = "Mover";
text_ctrl[3] = "Cancelar";
text_ctrl[4] = "Confirmar";
text_icon[0] = "Remover Jogo";
text_icon[1] = "Modificar Jogo";
text_icon[2] = "Procurar por um Jogo";
text_icon[3] = "Cor de Tema";
text_icon[4] = "Alterar o Plano de Fundo";
text_icon[5] = "Adicionar um Novo Jogo";
text_addgame[0] = "[ Usar como ATALHO? ]: Essa opção é útil para aplicativos que não são jogos, ou softwares que usam launchers proprietários (como ferramentas) | OBS.: Ao iniciar um atalho pelo Ninty o tempo de jogo não sera registrado e o launcher não sera suspenso.";
text_addgame[1] = "[ Usar como FORWARDER? ]: Essa opção é útil para emuladores, você pode iniciar uma ou várias ROMs direto do Ninty. | OBS.: Na próxima etapa, você deve escolher a pasta de destino em que as ROMs estão localizadas.";
text_settings_title = "Configurações";
text_settings[0] = "Idioma";
text_settings[1] = "Renderização da interface";
text_settings[2] = "Efeitos sonoros";
text_settings[3] = "Janela dos jogos";
text_settings[4] = "Prioridade dos jogos";
text_settings[5] = "Checar atualizações";
text_settings[6] = "Atualizar base de dados";
text_settings[7] = "Pasta de perfil";
text_settings[8] = "Guia";
text_settings[9] = "Rich Presence nativo";
text_settings_onoff[0] = "Desligado";
text_settings_onoff[1] = "Ligado";
text_settings_language[0] = "O mesmo que o sistema";  
text_settings_uirender[0] = "Compatível";
text_settings_uirender[1] = "Moderna";
text_settings_windowmode[0] = "Mesma do Ninty";
text_settings_windowmode[1] = "Padrão";
text_settings_windowmode[2] = "Máximizado";
text_settings_gamepriority[0] = "Normal (Recomendado)";
text_settings_gamepriority[1] = "Alta";
text_settings_gamepriority[2] = "Baixa";
text_update[0] = "Ir até a página de download";
text_update[1] = "Talvez depois";
text_remove[0] = "Sim";
text_remove[1] = "Não";
text_rpc[0] = "Selecionando um Jogo...";
text_rpc[1] = "Jogos na Biblioteca.";
//Ninny ------------------------------------------------------------------
guide[0] = @"Bem-vindo ao Ninty Launcher!
Meu nome é Ninny, eu irei ser sua guia.";
 
guide[1] = @"Ninty é um launcher baseado na interface do 
Nintendo Switch para você iniciar seus jogos";
 
guide[2] = @"Mas não só isso: Ninty suporta vários outros
tipos de softwares além de jogos.";
 
guide[3] = "Sendo assim, acho que podemos começar.";
 
guide[4] = @"Estes sãos os ícones de funções, com eles você
pode alterar um jogo, adicionar novos e também
alterar o tema do launcher.";
 
guide[5] = @"Só tome cuidado com o ícone de lixeira, ele é 
perigoso! Não queremos que você perca seu 
registro de tempo nos jogos...";
 
guide[6] = @"Mas não se preocupe, para evitarmos situações como 
essa temos a função de bloqueio da interface.";

guide[7] = @"Clique 3 vezes nessa opção e todas funções de
alteração serão ocultadas, isso também impede que 
os jogos sejam  movidos.";
 
guide[8] = @"Para desbloquear a interface novamente você só 
precisa clicar no mesmo local 3 vezes.";
 
guide[9] = @"Aqui você pode acessar as informações do Launcher,
assim como a versão atual e as pessoas que contribuiram
para o desenvolvimento dele.";
 
guide[10] = "Essa outra opção lhe da acesso as configurações do Ninty.";
 
guide[11] = @"O menu começa por aqui, essa opção te leva para 
a pasta do seu perfil no Ninty.";
 
guide[12] = @"Cada usuário no computador tem sua própria pasta de
perfil como essa, sendo assim cada um deles tem sua 
própria lista de jogos, temas e configurações";
 
guide[13] = @"Se você tiver planos de mudar de conta ou até mesmo
de computador e quiser levar junto todos seus registros,
faça um backup dessa pasta.";
 
guide[14] = @"Com essa opção o Ninty sempre vai checar e baixar a base de
dados de jogos compatíveis mais recente ao incializa-lo.";
 
guide[15] = @"Uma animação vai aparecer sempre que o launcher 
estiver baixando algo da base de dados de jogos.";
 
guide[16] = @"Se você ativar essa opção, eu sempre vou te avisar 
quando houver uma nova versão do Ninty!";
 
guide[17] = "Essa opção determina a prioridade do processo dos jogos.";
 
guide[18] = @"Eu não recomendo você alterar isso pois pode ter 
impacto imediato no desempenho do seu computador
dependendo do jogo iniciado... É SERIO!";
 
guide[19] = @"Com essa opção você pode definir o tamanho da 
janela dos jogos ao inicia-los, mas não funciona com
todos os jogos.";
 
guide[20] = @"Alguns vão te obrigar a jogar em modo janela, algo
não muito bom dependendo da sua preferência...";
 
guide[21] = @"Com essa opção você pode desativar todos efeitos sonoros
do launcher, com exceção de temas que incluam músicas.";
 
guide[22] = @"Essa opção define o método de renderização da interface, 
é extremamente importante pois alguns computadores podem 
ter problemas como bugs gráficos.";
 
guide[23] = @"O modo 'compatível' pode resolver grande parte desses 
problemas, essa é a opção que vem por padrão.";
 
guide[24] = @"Mas eu aconselho você a utilizar o modo 'moderno', 
pois oferece melhores efeitos visuais e um melhor 
desempenho.";
 
guide[25] = @"E por fim, com essa opção você pode alterar o
idioma do launcher.";
 
guide[26] = "Mas não se preocupe, eu sei falar vários idiomas!";
 
guide[27] = @"Caso você queira acessar o guia novamente você pode
selecionar essa opção, sempre estarei aqui para te
ajudar!";
 
guide[28] = "Ah! não poderia me esquecer...";
 
guide[29] = @"Caso você use Discord essa opção é ideal para você.
Ela permite colocar os jogos da sua biblioteca Ninty
no seu status de perfil enquanto você joga!";
 
guide[30] = "Há vários temas para você utilizar, aproveite.";
 
guide[31] = "Uma nova atualização esta disponível:  "+vnew+@"
a sua atual versão é: "+vold;

guide[32] = @"Sem problemas!
Irei te relembrar mais tarde.";

guide[33] = @"Você realmente quer remover 
este jogo da sua biblioteca?";
}
//ENGLISH [Default] ======================================================
else{

//Interface --------------------------------------------------------------
text_deleting = "Deleting...";
text_moving = "Moving...";
text_notfound = "[NOT FOUND]";
text_forwarder[0] = "• Start without game";
text_forwarder[1] = "• File path not found.";
text_addforwarder = "Select any File";
text_dialog[0] = "Set game title:";
text_ctrl[0] = "Start";
text_ctrl[1] = "Close";
text_ctrl[2] = "Move";
text_ctrl[3] = "Cancel";
text_ctrl[4] = "Confirm";
text_icon[0] = "Remove Game";
text_icon[1] = "Modify Game";
text_icon[2] = "Search for a Game";
text_icon[3] = "Theme Color";
text_icon[4] = "Wallpaper";
text_icon[5] = "Add a New Game";
text_addgame[0] = "[ Use as a SHORTCUT? ]: This option is useful for applications that are not games, or softwares that use proprietary launchers (such as tools) | NOTE: When you start a shortcut through Ninty, the game time will not be recorded and the launcher will not be suspended.";
text_addgame[1] = "[ Use as a FORWARDER? ]: This option is useful for emulators, you can run one or more ROMs directly from Ninty. | NOTE: In the next step you must choose the destination folder that ROMs are located.";
text_settings_title = "Settings";
text_settings[0] = "Language";
text_settings[1] = "Interface rendering";
text_settings[2] = "Sound effects";
text_settings[3] = "Game window";
text_settings[4] = "Game priority";
text_settings[5] = "Check for updates";
text_settings[6] = "Update database";
text_settings[7] = "Profile folder";
text_settings[8] = "Guide";
text_settings[9] = "Native Rich Presence";
text_settings_onoff[0] = "Off";
text_settings_onoff[1] = "On"; 
text_settings_language[0] = "Same as the system";  
text_settings_uirender[0] = "Compatible";
text_settings_uirender[1] = "Modern";
text_settings_windowmode[0] = "Same as Ninty";
text_settings_windowmode[1] = "Default";
text_settings_windowmode[2] = "Maximized";
text_settings_gamepriority[0] = "Normal (Recommended)";
text_settings_gamepriority[1] = "High";
text_settings_gamepriority[2] = "Low";
text_update[0] = "Go to download page";
text_update[1] = "Maybe later";
text_remove[0] = "Yes";
text_remove[1] = "No";
text_rpc[0] = "Selecting a Game...";
text_rpc[1] = "Games in Library.";
//Ninny ------------------------------------------------------------------
guide[0] = @"Welcome to Ninty Launcher!
My name is Ninny, and I'll be your guide.";

guide[1] = @"Ninty is a launcher based on Nintendo Switch's
interface to start your games.";

guide[2] = @"But not only that: Ninty supports various
types of softwares besides games.";

guide[3] = "Well then, I think we can start.";

guide[4] = @"These are the function icons, with them you can change 
a game, add a new one or change the launcher's theme.";

guide[5] = @"But be careful with the trash can icon, it's dangerous!
We don't want you losing your game's playtime...";

guide[6] = @"But don't worry, to avoid situations like this, 
we have the interface's lock function.";

guide[7] = @"Click 3 times in this option to hide all main functions,
that way preventing moving games and apps.";

guide[8] = @"To unhide these functions again you will need to
click the same place 3 times.";

guide[9] = @"Here you can access the Launcher's informations,
as well as the current version and the people who
contributed to its development.";

guide[10] = "This other one gives access to Ninty's settings.";

guide[11] = @"The menu starts here, this setting leads you to the
folder of your profile on Ninty.";

guide[12] = @"Every user on the computer has its own profile
folder like this, thus everyone has its own games
list, themes and settings.";

guide[13] = @"If you're planning to change your account or computer 
and want to have all records, do a backup of this folder.";

guide[14] = @"With this setting, Ninty will always check and
download the most recent game database every time 
you start it.";

guide[15] = @"An animation will appear whenever the Launcher is 
downloading something of the database.";

guide[16] = @"If you enable this setting, I'll alert you 
everytime when there's a new version of Ninty!";

guide[17] = "This setting settles the game's process priority.";

guide[18] = @"I don't recommend you to change this since it can have an
immediate impact on your computer's performance depending
of the game you started... FOR REAL!";

guide[19] = @"This setting you can set the size of the game window 
after start it, but it doesn't work with all games.";

guide[20] = @"Some will force you to play in windowed mode, something
not very good depending on your preference...";

guide[21] = @"With this setting you can turn off all Launcher's sound
effects, except of themes containing music.";

guide[22] = @"This setting you set the interface render method, 
and it's extremely important since some computers can 
show some graphical bugs.";

guide[23] = @"The 'compatible' mode can solve good portion of these 
problems, this is the standard setting";

guide[24] = @"But I do recommend you to use the 'modern' mode, 
it offers better visual effects and a better performance.";

guide[25] = "And finally, this setting can change the launcher's language.";

guide[26] = "But don't worry, I can speak a lot of languages!";

guide[27] = @"If you want to access the guide again you can select this 
option I'll be always here to help you!";

guide[28] = "Oh! And I cannot forget...";

guide[29] = @"If you use Discord, this is the best place to you.
Ninty shows a status of your game library in your
profile when you're playing!";

guide[30] = "There's various themes for you, enjoy!";
 
guide[31] = "A new update is available:  "+vnew+@"
your current version is: "+vold;

guide[32] = @"No problem!
I'll remind you later.";

guide[33] = @"Do you really want to remove 
this game from your library?";
}

