#SingleInstance Force
#NoEnv
; Script powered 2021 by AHK Province  (Alex_Sokolin)

/*
Loop %0%{
	ComParam%A_Index% := %A_Index%
}
*/

Version := 1.06
GuiVersion := % Version
TextCreator = Sokol
TextGroup = AHK Province
TextFooter = %TextGroup% (v.%GuiVersion%) © 2020 - 2022 by %TextCreator%

TrayTip, AHK MoH (%GuiVersion%), Скрипт успешно запущен.

Menu, Tray, NoStandard
Menu, Tray, Add, VKowner
Menu, Tray, Rename, VKowner, AHK PROVINCE
Menu, Tray, Add ; SEPARATOR
Menu, Tray, Add, VKmemo
Menu, Tray, Rename, VKmemo, Памятка
Menu, Tray, Add, VKhelp
Menu, Tray, Rename, VKhelp, Помощь
Menu, Tray, Add ; SEPARATOR
Menu, Tray, Add, ReloadMenu
Menu, Tray, Rename, ReloadMenu, Перезапуск
Menu, Tray, Add, ExitMenu
Menu, Tray, Rename, ExitMenu, Закрыть
Menu, Tray, Tip, AHK MoH (%GuiVersion%)

/*
If (ComParam1 = /Update){
	Update(ComParam2, ComParam3)
}
Else If (ComParam1 = /TempDelete){
	TempDelete(ComParam2, ComParam3)
}
Else{
	CheckUpdate(Version)
}
Return

CheckUpdate(Version) {
	NewVersionHTTP := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	NewVersionHTTP.Open("GET", "https://github.com/sokolin05/profile.moh/raw/master/version.profile.md", true)
	NewVersionHTTP.Send()
	NewVersionHTTP.WaitForResponse()
	NewVersion := NewVersionHTTP.ResponseText
	If (NewVersion <= Version){
		; MsgBox, 16, Обновление, Новых версий скрипта не найдено.
		Gosub, NoUpdate
		Return
	}
	Else{
		MsgBox, % 4+64+256, Обновление, Найдена новая версия скрипта!`nОбновить с %Version% до %NewVersion%?
		IfMsgBox, No
		{
			Gosub, NoUpdate
			Return
		}
		IfMsgBox, Yes
		{
			URLDownloadToFile, https://github.com/sokolin05/profile.moh/raw/master/ahk.moh.exe, %A_Temp%\ahk.moh.exe
			PID := DllCall("GetCurrentProcessId")
			Run %A_Temp%\ahk.moh.exe, "/Update" "%PID%" "%A_ScriptFullPath%"
			ExitApp
		}
	}
}

Update(PID, Path) {
	Process, Close, %PID%
	Process, WaitClose, %PID%, 3
	If ErrorLevel
	{
		MsgBox, % 16, Обновление, Не удаётся закрыть процесс.
		ExitApp
	}
	Else{
		FileCopy, %A_ScriptFullPath%, %Path%, 1
		If ErrorLevel
		{
			MsgBox, % 16, Обновление, Не удалось копирование, возможно были запущены несколько экземпляров программы.
			ExitApp
		}
		Else{
			PID := DllCall("GetCurrentProcessId")
			Run %Path% "/TempDelete" "%PID%" "%A_ScriptFullPath%"
			ExitApp
		}
	}
}

TempDelete(PID, Path) {
	Process, Close, %PID%
	Process, WaitClose, %PID%, 2
	FileDelete, %Path%
}
*/

GuiStandartCheck:

NoUpdate:
; Gui, Update:Hide
FilePath = %A_Temp%\data.profile
GLOBAL DataGroup = MoH
{

/*
	IniRead, Hello, %FilePath%, %DataGroup%, Hello
	IniRead, QuestionsHospital, %FilePath%, %DataGroup%, QuestionsHospital
	IniRead, QuestionsAC, %FilePath%, %DataGroup%, QuestionsAC
	IniRead, InspectionHospital, %FilePath%, %DataGroup%, InspectionHospital
	IniRead, InspectionAC, %FilePath%, %DataGroup%,InspectionAC 
	IniRead, TreatmentHospital, %FilePath%, %DataGroup%, TreatmentHospital
	IniRead, TreatmentAC, %FilePath%, %DataGroup%, TreatmentAC
	IniRead, Hospital, %FilePath%, %DataGroup%, Hospital
	IniRead, TransmitterOn, %FilePath%, %DataGroup%, TransmitterOn
	IniRead, TransmitterOff, %FilePath%, %DataGroup%, TransmitterOff
	IniRead, PassOn, %FilePath%, %DataGroup%, PassOnsay 
	IniRead, PassOff, %FilePath%, %DataGroup%, PassOff
*/

	IniRead, Gender, %FilePath%, %DataGroup%, Gender
	IniRead, City, %FilePath%, %DataGroup%, City
	IniRead, IdNumber, %FilePath%, %DataGroup%, IdNumber
	IniRead, SurName, %FilePath%, %DataGroup%, SurName
	IniRead, Name, %FilePath%, %DataGroup%, Name
	IniRead, SecondName, %FilePath%, %DataGroup%, SecondName
	IniRead, Rank, %FilePath%, %DataGroup%, Rank
	IniRead, Post, %FilePath%, %DataGroup%, Post
	IniRead, Logo, %FilePath%, %DataGroup%, Logo
	IniRead, NumberCall, %FilePath%, %DataGroup%, NumberCall
	IniRead, RankMES, %FilePath%, %DataGroup%, RankMES
	
	StringIdNumber = %IdNumber%
	RegExMatch(StringIdNumber, "([A-Z].*)-([0-9].*)-([0-9].*)", RegIdNumber)
	
/*
	Hello := RegExReplace(Hello, "!", "ALT+")
	 "^" "+" "Numpad1" "Numpad2" "Numpad3" "Numpad4" "Numpad5" "Numpad6" "Numpad7" "Numpad8" "Numpad9" "Numpad0" "NumpadDiv" "NumpadMult" "NumpadAdd" "NumpadSub" "NumpadEnter"  "PgUp" "PgDown" "Insert" "Home" "End"
	 "CTRL+" "SHIFT+" "NUM(1)" "NUM(2)" "NUM(3)" "NUM(4)" "NUM(5)" "NUM(6)" "NUM(7)" "NUM(8)" "NUM(9)" "NUM(0)" "NUM(/)" "NUM(*)" "NUM(+)" "NUM(-)" "NUM(ENTER)" "PGUP" "PGDN" "INSERT" "HOME" "END"
*/

 


		xnGuiStandart := 5
	Gui, GuiStandart:Add, GroupBox, x5 y5 w177 h300 c0a0a40, (Основные)
	Gui, GuiStandart:Add, Text, x10 yp+15, [ALT+Z] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, приветствие
	Gui, GuiStandart:Add, Text, x10 y+0, [ALT+1] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, вопросы в больнице
	Gui, GuiStandart:Add, Text, x10 y+0, [CTRL+1] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, вопросы в АСМП
	Gui, GuiStandart:Add, Text, x10 y+0, [ALT+X] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, осмотр в больнице
	Gui, GuiStandart:Add, Text, x10 y+0, [CTRL+X] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, осмотр в АСМП
	Gui, GuiStandart:Add, Text, x10 y+0, [ALT+N] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, лечение в больнице
	Gui, GuiStandart:Add, Text, x10 y+0, [CTRL+N] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, лечение в АСМП
	Gui, GuiStandart:Add, Text, x10 y+0, [ALT+M] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, стационар

	Gui, GuiStandart:Add, Text, x10 y+15, [ALT+-][ALT+=] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000,  рация
	Gui, GuiStandart:Add, Text, x10 y+0, [/ud ID][CTRL+=] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000,  пропуск
	Gui, GuiStandart:Add, Text, x10 y+0, [ALT+F12] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000,  часы (/timestamp)

	Gui, GuiStandart:Add, Text, x10 y+15, [/to ID] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000,   принять вызов
	Gui, GuiStandart:Add, Text, x10 y+0, [/хил] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000,   вылечить себя
	Gui, GuiStandart:Add, Text, x10 y+0, [/кпк+,-] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000,   КПК (/find)
	Gui, GuiStandart:Add, Text, x10 y+0, [/маска+,-] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000,   маска
	
	Gui, GuiStandart:Add, Text, x10 y+15, [/клятва] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000,   клятва врача

	Gui, GuiStandart:Add, GroupBox, x180 y5 w132 h300 c0a0a40, (Препараты)
	Gui, GuiStandart:Add, Text, x185 yp+15, [/голова] 
	Gui, GuiStandart:Add, Text, x185 y+0, [/отравление]
	Gui, GuiStandart:Add, Text, x185 y+0, [/ушиб]
	Gui, GuiStandart:Add, Text, x185 y+0, [/запор]
	Gui, GuiStandart:Add, Text, x185 y+0, [/геморрой]
	Gui, GuiStandart:Add, Text, x185 y+0, [/половой]
	Gui, GuiStandart:Add, Text, x185 y+0, [/сердце]
	Gui, GuiStandart:Add, Text, x185 y+0, [/зуб]
	Gui, GuiStandart:Add, Text, x185 y+0, [/ожог]
	Gui, GuiStandart:Add, Text, x185 y+0, [/ухо]
	Gui, GuiStandart:Add, Text, x185 y+0, [/обезбол]
	Gui, GuiStandart:Add, Text, x185 y+0, [/кашель]
	Gui, GuiStandart:Add, Text, x185 y+0, [/печень] 
	Gui, GuiStandart:Add, Text, x185 y+0, [/насморк] 
	Gui, GuiStandart:Add, Text, x185 y+0, [/аллергия] 

	Gui, GuiStandart:Add, GroupBox, x310 y5 w210 h300 c0a0a40, (МЧС)
	Gui, GuiStandart:Add, Text, x315 yp+15 +BackgroundTrans, [/огнетушитель+,-] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, огнетушитель
	Gui, GuiStandart:Add, Text, x315 y+0 +BackgroundTrans, [/рукава+,-] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, рукава
	Gui, GuiStandart:Add, Text, x315 y+0 +BackgroundTrans, [/заборводы+, вод, гид] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, забор воды
	Gui, GuiStandart:Add, Text, x320 y+0 w220 +BackgroundTrans c800000, ("вод" - из водоема)`n("гид" - из гидранта)
	Gui, GuiStandart:Add, Text, x315 y+0 +BackgroundTrans, [/лафствол+,-] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, лафетный ствол
	Gui, GuiStandart:Add, Text, x315 y+0 +BackgroundTrans, [/лестница+,-] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, лестница
	Gui, GuiStandart:Add, Text, x315 y+0 +BackgroundTrans, [/топор+,-] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, топор
	
	Gui, GuiStandart:Add, Text, x315 y+15 +BackgroundTrans, [/п+][/п-] -
	Gui, GuiStandart:Add, Text, x+%xnGuiStandart% yp c800000, пропуск МЧС

	Gui, GuiStandart:Add, Text, x315 y+40 w200 c800000 +0x01 +BackgroundTrans, "+" в команде означает достать предмет (закончить действие).`n "-" в команде противоположен плюсу, а точнее убрать предмет.

	Gui, GuiStandart:Add, Button, x300 y310 w120 h25 gButtonKeyGuiStandart, Изменение клавиш
	Gui, GuiStandart:Add, Button, x+0 yp w55 h25 gButtonDiscardGuiStandart, Меню

	Gui, GuiStandart:Menu
	Gui, GuiStandart:Show, h340 w525, Справочник биндов  

	SendChat(TextBind, SleepBind)
	{
	SendInput, {F8}%TextBind%{Enter}{F8}
	Sleep %SleepBind%
	}

	SendForCommand(Command)
	{
	SendInput, /%Command%{Space}
	Input, %Command%, V, {Enter} 
	SendInput, {bs 17} 
	}

	SendCommand(TextBind)
	{
	SendInput, {F6}
	Sleep 150
	SendInput, %TextBind%{Space}
	}

	If (City=="Невский"){
		CityShort = ЦГБ-Н
		CityLong = ЦГБ г. Невский
	}
	Else If (City=="Мирный"){
		CityShort = ОКБ-М
		CityLong = ОКБ г. Мирный
	}
	Else If (City=="Приволжск"){
		CityShort = ЦГБ-П
		CityLong = ЦГБ г. Приволжск
	}

	If (Gender=="Male"){
		lla = л
		ella = ел
		kca = к
		syaas = ся
		kaci = ка
	}
	Else If (Gender=="Female"){
		lla = ла
		ella = ла
		kca = ца
		syaas = ась
		kaci = цы
	}

	Голова = "Парацетамол"
	Отравление = "Смекту"
	Ушиб = "Финалгон"
	Запор = "Гутталакс"
	Геморрой = "Анестезол"
	Половой = "Простаплант"
	Сердце = "Эналаприл"
	Зуб = "Кеторол"
	Ожог = "Левомеколь"
	Ухо = "Анауран"
	Обезбол = "Нурофен"
	Кашель = "Гепабене"
	Печень = "Гербион"
	Насморк = "Отривин"
	Аллергия = "Лоратадин"
	Return

	ButtonKeyGuiStandart:
	MsgBox, 16, Ошибка, Функция недоступна, находится в разработке.
	Return

	ButtonDiscardGuiStandart:
	; MsgBox, 16, Ошибка, Функция недоступна, находится в разработке.
	Gui, GuiStandart:Hide
		Sleep 150
	Goto, GuiMenuGui
	Return

	GuiStandartGuiClose:
	{
		MsgBox, 36, Вопрос, Вы дейтвительно хотите закрыть скрипт?
		IfMsgBox, Yes
		{
			ExitApp
		}
		IfMsgBox, No
		{
			Return
		}
	}
Return



























{ ; BINDS
#IfWinActive MTA: Province
FilePath = %A_Temp%\data.profile

	Alt & F12:: ;
	{
		SendChat("do На запястье часы с гравировкой " Logo ".", "500")
		SendChat("me посмотрел на часы", "500")
		SendChat("do Время на часах: " A_DD "." A_MM "." A_YYYY " " A_Hour ":" A_Min ":" A_Sec ".", "100")
		SendChat("timestamp", "0")
	}
	Return
	
	:?:/ud:: ; ------ ПРОПУСК 1 ------
	{
		SendForCommand("ud")
		SendChat("say Здравствуйте{!} Я сотрудни" kca " " CityLong ", " Rank ", " SurName " " Name " " SecondName ".", "500")
		SendChat("do Служебное удостоверение в нагрудном кармане.", "500")
		SendChat("me достав из нагрудного кармана служебное удостоверение, разверну" lla " его и показа" lla " гражданину напротив", "0")
	}
	Return

	Ctrl & =:: ; ------ ПРОПУСК 2 ------
	{
		SendChat("me убра" lla " служебное удостоверение в нагрудный карман", "0")
	}
	Return

	Alt & Z:: ; ------ ПРИВЕТСТВИЕ ------
	{
		SendChat("say Здравствуйте, я лечащий врач " Name " " SecondName ".", "500")
		SendChat("do На одежде врача висит бейдж с надписью " CityLong ", " SurName " " Name " " SecondName ", " Rank ", " Post ".", "500")
		SendChat("todo Что вас беспокоит?*посмотрев на человека", "0")
	}
	Return

	Alt & 1:: ; ------ ВОПРОСЫ В БОЛЬНИЦЕ ------
	{
		SendChat("say Высыпаетесь? Употребляете алкоголь или курите?  Есть ли хронические заболевания?", "0")
	}
	Return

	Ctrl & 1:: ; ------ ВОПРОСЫ В АСМП ------
	{
		SendChat("say Есть ли жалобы на артериальное давление?", "1000")
		SendChat("say Есть ли хронические заболевания?", "1000")
		SendChat("say Противопоказания на лекарство есть?", "0")
	}
	Return

	Alt & X:: ; ------ ДИАГНОЗ В БОЛЬНИЦЕ ------
	{
		SendChat("say Сейчас я вас осмотрю. Прилягте на кровать, старайтесь дышать ровно и спокойно.", "500")
		SendChat("me осматривает пациента и ставит диагноз", "500")
		SendChat("do Диагноз поставлен.", "0")
	}
	Return

	Ctrl & X:: ; ------ ДИАГНОЗ В АСМП ------
	{
		SendChat("say Сейчас я вас осмотрю. Присядье, старайтесь дышать ровно и спокойно.", "500")
		SendChat("me осматривает пациента и ставит диагноз", "500")
		SendChat("do Диагноз поставлен.", "0")
	}
	Return

	Alt & N:: ; ------ ЛЕЧЕНИЕ В БОЛЬНИЦЕ ------
	{
		SendChat("say Пожалуйста, ожидайте, я выпишу вам заключение.", "500")
		SendChat("do У кушетки стоит стол, на котором лежат бланки выписных эпикризов № 22/4, ручка с логотипом " CityShort " и личный штамп сотрудни" kaci ".", "500")
		SendChat("me взяв со стола ручку, вписа" lla " в эпикриз дату, Ф.И.О. пациента, его дату рождения и свои Ф.И.О.", "500")
		SendChat("do Дата, Ф.И.О пациента, его дата рождения и Ф.И.О сотрудни" kaci " вписаны в эпикриз.", "500")
		SendChat("me вписа" lla " в эпикриз название нужного препарата и способ применения, после постави" lla " подпись и печать", "500")
		SendChat("do Выписной эпикриз заполнен.", "500")
		SendChat("me переда" lla " выписной эпикриз пациенту", "500")
		SendChat("do Рука протянута в сторону больного.", "500")
		SendChat("say Всего доброго, не болейте)", "100")
		SendCommand("/helpmed")
	}
	Return

	Ctrl & N:: ; ------ ЛЕЧЕНИЕ В АСМП ------
	{
		SendChat("say Так, посмотрим.", "500")
		SendChat("do Рядом с сотрудником лежит аптечка.", "500")
		SendChat("me откры" lla " аптечку", "500")
		SendChat("do Аптечка открыта.", "500")
		SendChat("me доста" lla " нужный лекарственный препарат из аптечки", "500")
		SendChat("do Лекарственный препарат в руке.", "500")
		SendChat("me переда" lla " препарат пациенту и забра" lla " деньги за лекарственный препарат", "500")
		SendChat("say Всего доброго, не болейте)", "100")
		SendCommand("/heal")
	}
	Return

	Alt & M:: ; ------ СТАЦИОНАР ------
	{
		SendChat("say Хорошо, тогда лечитесь в стационаре. Всего вам доброго{!}", "0")
	}
	Return

	:?:/to:: ; ------ ВЫЗОВ ------
	{
		SendForCommand("to")
		IniWrite %to%, %FilePath%, %DataGroup%, NumberCall
		SendChat("do На креплении висит радиостанция.", "500")
		SendChat("me потянул" syaas " рукой к рации и запроси" lla " дежурного врача", "500")
		SendChat("do Дежурный врач сообщил о вызове.", "100")
		SendChat("r " IdNumber " 10-81-" to "", "0")
	}
	Return

	Alt & -:: ; ------ РАЦИЯ 1 ------
	{
		SendChat("do На нагрудном кармане висит рация.", "200")
		SendChat("me сня" lla " радиостанцию с кармана, затем сказа" lla " что-то в нее", "200")
		SendChat("do Сотрудни" kca " говорит что-то в рацию.", "100")
		SendChat("fracvoice 1", "0")
	}
	Return

	Alt & =:: ; ------ РАЦИЯ 2 ------
	{
		SendChat("me сказа" lla " что-то в рацию и повеси " lla " ее на нагрудный карман", "200")
		SendChat("do Рация висит на нагрудном кармане.", "100")
		SendChat("fracvoice 0", "0")
	}
	Return
	
	
	
	
	
	
	:?:/хил::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("do Витаминка в кармане.", "500")
		SendChat("me взя" lla " витаминку", "500")
		SendChat("do Витаминка в руке.", "500")
		SendChat("me положи" lla " витаминку в рот", "500")
		SendChat("do Витаминка во рту.", "100")
		SendCommand("/heal")
	}
	Return
	
	:?:/кпк+::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("do КПК в кармане.", "500")
		SendChat("me достав КПК из кармана, заш" ella " в электронный журнал сотрудников", "500")
		SendChat("do Электронный журнал сотрудников запущен.", "100")
		SendChat("find", "0")
	}
	Return

	:?:/кпк-::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("me закрыл электронный журнал сотрудников", "500")
		SendChat("do Электронный журнал сотрудников закрыт.", "500")
		SendChat("me убра" lla " КПК в карман", "500")
		SendChat("do КПК в кармане.", "0")
	}
	Return

	:?:/маска+:: 
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("do Медицинская маска в кармане.", "500")
		SendChat("me доста" lla " медицинскую маску из кармана и оде" lla " на лицо", "500")
		SendChat("do Медицинская маска на лице.", "100")
		SendChat("medmask", "0")
	}
	Return

	:?:/маска-:: 
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("do Медицинская маска на лице.", "500")
		SendChat("me сня" lla " медицинскую маску с лица и положи" lla " в карман", "500")
		SendChat("do Медицинская маска в кармане.", "100")
		SendChat("medmask", "0")
	}
	Return
	
	
	
	
	
	
	

	:?:/голова::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас головная боль. Я вам выпишу "  Голова ". Его цена 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/отравление::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас отравление. Я вам выпишу " Отравление ". Его цена 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/ушиб::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас ушиб. Я вам выпишу " Ушиб ". Его цена 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/запор::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас запор. Я вам выпишу " Запор ". Его цена 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/геморрой::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас геморрой. Я вам выпишу " Геморрой ". Его цена 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/половой::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас проблема с половым органом. Я вам выпишу " Половой ".", "500")
		SendChat("say Его цена 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/сердце::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас боли в сердце. Я вам выпишу " Сердце ". Его цена 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/зуб::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас зубная боль. Я вам выпишу " Зуб ". Его цена 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/ожог::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас ожог кожи. Я вам выпишу " Ожог ". Его цена 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/ухо::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас ушная боль. Я вам выпишу " Ухо ". Его цена 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/обезбол::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say Я выпишу вам " Обезбол ". Его стоимость 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/печень::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас проблемы с печенью. Я выпишу вам " Печень ". Его стоимость 450 рублей. Вы согласны?", "0")
	}
	Return

	:?:/кашель::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас кашель. Я выпишу вам " Кашель ". Его стоимость 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/насморк::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас насморк. Я выпишу вам " Насморк ". Его стоимость 450 рублей. Вы согласны на лечение?", "0")
	}
	Return

	:?:/аллергия::
	SendInput, {Enter}
	Sleep 150
	{
		SendChat("say У вас аллергия. Я выпишу вам " Аллергия ". Его стоимость 450 рублей. Вы согласны на лечение?", "0")
	}
	Return
	
	
	
	
	
	
	:?:/огнетушитель+::
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("do Огнетушитель в отсеке пожарной автоцистерны.", "500") ; ----- ОГНЕТУШИТЕЛЬ -----
		SendChat("me вытащи" lla " огнетушитель с отсека", "500")
		SendChat("do Огнетушитель в руках.", "500")
		SendChat("me выдерну" lla " чеку с огнетушителя", "500")
		SendChat("do Огнетушитель в боевой готовности.", "0")
	}
	Return

	:?:/огнетушитель-::
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("me постави" lla " огнетушитель в отсек пожарной автоцистерны", "500")
		SendChat("do Использованный огнетушитель в отсеке пожарной автоцистерны.", "0")
	}
	Return

	:?:/рукава+::
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("do Пожарный рукав в отсеке пожарной автоцистерны.", "500") ; ----- РУКАВА -----
		SendChat("me откры" lla " отсек автоцистерны", "500")
		SendChat("do Отсек открыт.", "500")
		SendChat("me сняв ремешок, вытащи" lla " рукав из отсека", "500")
		SendChat("do Пожарный рукав в руках.", "500")
		SendChat("me разложи" lla " пожарный рукав", "500")
		SendChat("do Пожарный рукав разложен.", "500")
		SendChat("me присоедини" lla " пожарный рукав к гидронасосу", "500")
		SendChat("do Рукав присоединен к гидронасосу.", "500")
		SendChat("do Пожарный ствол в специальном отсеке пожарной автоцистерны.", "500")
		SendChat("me вытащи" lla " ствол из отсека", "500")
		SendChat("do Ствол в руке.", "500")
		SendChat("me подсоедини" lla " ствол к пожарному рукаву", "500")
		SendChat("do Ствол присоединен к рукаву.", "500")
		SendChat("me потянув рычаг, включи" lla " гидронасос", "500")
		SendChat("do Гидронасос запущен.", "0")
	}
	Return

	:?:/рукава-::
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("me выключи" lla " гидронасос", "500")
		SendChat("do Гидронасос выключен.", "500")
		SendChat("me сняв ствол с рукава, закрепи" lla " его в отсеке автоцистерны", "500")
		SendChat("do Ствол закреплен в отсеке автоцистерны.", "500")
		SendChat("me отсоедини" lla " рукав от гидронасоса", "500")
		SendChat("do Рукав отсоединен от гидронасоса.", "500")
		SendChat("me сложи" lla " рукав и убра" lla " его в отсек автоцистерны", "500")
		SendChat("do Рукав в отсеке пожарной автоцистерны.", "500")
		SendChat("me закры" lla " отсек автоцистерны", "500")
		SendChat("do Отсек закрыт.", "0")
	}
	Return

	:?:/заборводы+::
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("do Пожарные рукава находятся в пенале на крыше автоцистерны.", "500") ; ----- ЗАБОР ВОДЫ В ЦИСТЕРНУ -----
		SendChat("me откинув пенал, откры" lla " его", "500")
		SendChat("do Пенал открыт.", "500")
		SendChat("me вытащив рукав из пенала, разложи" lla " его", "500")
		SendChat("do Рукав разложен.", "500")
		SendChat("me закры" lla " пенал и закину" lla " его на крышу автоцистерны", "500")
		SendChat("do Закрытый пенал на крыше автоцистерны.", "500")
		SendChat("me взяв рукав в руки, присоедини" lla " его к гидронасосу", "500")
		SendChat("do Рукав присоединен к гидронасосу.", "0")
	}
	Return

	:?:/заборводывод::
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("me опусти" lla " рукав в воду", "500")
		SendChat("do Рукав в воде.", "500")
		SendChat("me запусти" lla " гидронасос", "500")
		SendChat("do Гидронасос запущен.", "500")
		SendChat("me выключи" lla " гидронасос", "500")
		SendChat("do Гидронасос выключен.", "500")
		SendChat("me вытащи" lla " рукав из воды", "500")
		SendChat("do Рукав вытащен из воды.", "500")
		SendChat("me отсоедини" lla " рукав от гидронасоса", "500")
		SendChat("do Рукав отсоединен от гидронасоса.", "500")
		SendChat("me откинув пенал, откры" lla " его", "500")
		SendChat("do Пенал открыт.", "500")
		SendChat("me сложив рукав в пенал, закры" lla " его", "500")
		SendChat("do Пенал закрыт.", "500")
		SendChat("me закину" lla " пенал на крышу автоцистерны", "500")
		SendChat("do Закрытый пенал на крыше автоцистерны.", "0")
	}
	Return

	:?:/заборводыгид::
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("me взяв рукав в руки, присоедини" lla " его к гидранту", "500")
		SendChat("do Рукав присоединен к гидранту.", "500")
		SendChat("me откры" lla " кран гидранта", "500")
		SendChat("do Кран гидранта открыт.", "500")
		SendChat("me запусти" lla " гидронасос", "500")
		SendChat("do Гидронасос запущен.", "500")
		SendChat("me выключи" lla " гидронасос", "500")
		SendChat("do Гидронасос выключен.", "500")
		SendChat("me закры" lla " кран гидранта ", "500")
		SendChat("do Кран гидранта закрыт.", "500")
		SendChat("me отсоедини" lla " рукав от гидронасоса", "500")
		SendChat("do Рукав отсоединен от гидронасоса.", "500")
		SendChat("me откинув пена" lla ", откры" lla " его", "500")
		SendChat("do Пенал открыт.", "500")
		SendChat("me сложив рукав в пенал, закры" lla " его", "500")
		SendChat("do Пенал закрыт.", "500")
		SendChat("me закину" lla " пенал на крышу автоцистерны", "500")
		SendChat("do Закрытый пенал на крыше автоцистерны.", "0")
	}
	Return

	:?:/лафствол+::
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("do В кабине автоцистерны установлен пульт управления лафетным стволом.", "500")  ; ----- ЛАФЕТНЫЙ СТВОЛ -----
		SendChat("me запусти" lla " пульт управления", "500")
		SendChat("do Пульт управления запущен.", "500")
		SendChat("me включи" lla " подачу воды на лафетный ствол", "500")
		SendChat("do Подача воды включена.", "0")
	}
	Return

	:?:/лафствол-::
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("me выключи" lla " подачу воды на лафетный ствол", "500")
		SendChat("do Подача воды выключена.", "500")
		SendChat("me выключи" lla " пульт управления", "500")
		SendChat("do Пульт управления лафетным стволом выключен.", "0")
	}
	Return

	:?:/лестница+::
	{
		SendChat("do Лестница штурмовка закреплена на крыше автоцистерны.", "500") ; ----- ЛЕСТНИЦА -----
		SendChat("me открепи" lla " лестницу с креплений", "500")
		SendChat("do Лестница снята с креплений.", "500")
		SendChat("me взя" lla " лестницу в руки", "500")
		SendChat("do Лестница в руках.", "0")
	}
	Return

	:?:/лестница-::
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("me убра" lla " лестницу-штурмовку на крышу автоцистерны", "500")
		SendChat("do Лестница на крыше автоцистерны.", "500")
		SendChat("me закрепи" lla " лестницу на крепления", "500")
		SendChat("do Лестница штурмовка закреплена на крыше автоцистерны.", "0")
	}
	Return

	:?:/топор+::
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("do Топорик закреплён на поясе.", "500")  ; ----- ТОПОР -----
		SendChat("me сня" lla " топорик с пояса", "0")
	}
	Return

	:?:/топор-::
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("me убра" lla " топорик на пояс и закрепи" lla " его", "500")
		SendChat("do Топорик закреплён на поясе.", "0")
	}
	Return
	
	
	
	
	
	:?:п+:: ; ------ ПРОПУСК 1 ------
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("say Здравствуйте{!} Я сотрудни" kca " ГУ-МЧС, " RankMES ", " SurName " " Name " " SecondName ".", "500")
		SendChat("do В нагрудном кармане лежит рабочий пропуск.", "500")
		SendChat("me доста" lla " из нагрудного кармана пропуск сотрудни" kaci " ГУ-МЧС и предъяви" lla " человеку напротив", "500")
		SendChat("do Пропуск: МЧС-" RegIdNumber2 "-" RegIdNumber3 ", " SurName " " Name " " SecondName ", " RankMES " [ГУ-МЧС Провинции].", "0")
	}
	Return

	:?:п-:: ; ------ ПРОПУСК 2 ------
	Sleep 150
	SendInput, {Enter}
	{
		SendChat("me убра" lla " пропуск в карман", "500")
		SendChat("do Пропуск в кармане.", "0")
	}
	Return
	
	
	
	:?:/психолог1::
	SendInput, {F8}
	Sleep 150
	{
		SendChat("say Здравствуйте, я врач-психолог " Name " " SecondName ", я задам вам несколько вопросов.","5000")
		SendChat("say Постарайтесь отвечать на все вопросы правдиво, не обманывать.","5000")
		SendChat("say Назовите ваше Ф.И.О, и сколько вам лет?","0")
		Return
	}

	:?:/психолог2::
	SendInput, {F8}
	Sleep 150
	{
		SendChat("say Расскажите о себе, чем занимаетесь, что вам нравится делать.","0")
		Return
	}

	:?:/психолог3::
	SendInput, {F8}
	Sleep 150
	{
		SendChat("say Вы употребляете алкоголь, наркотические вещества?","0")
		Return
	}

	:?:/психолог4::
	SendInput, {F8}
	Sleep 150
	{
		SendChat("say У вас есть страхи, депрессия, может быть вы волнуетесь из-за чего-то?","0")
		Return
	}

	:?:/психолог5::
	SendInput, {F8}
	Sleep 150
	{
		SendChat("say У вас были суицидальные мысли?","0")
		Return
	}

	:?:/психолог6::
	SendInput, {F8}
	Sleep 150
	{
		SendChat("say Что тяжелее - килограмм железа или килограмм ваты?","0")
		Return
	}

	:?:/психолог7::
	SendInput, {F8}
	Sleep 150
	{
		SendChat("say Чем отличается яблоко от яблони?","0")
		Return
	}

	:?:/психолог8::
	SendInput, {F8}
	Sleep 150
	{
		SendChat("say Чем птица по вашему отличается от самолета?","0")
		Return
	}


	:?:/хирург1::
	SendInput, {F8}  
	Sleep 150
	{
		SendChat("say Здравствуйте, я врач-хирург " Name " " SecondName ", начнем наш осмотр.", "5000") 
		SendChat("say Начнем.", "5000")   
		SendChat("say Вас оперировали когда-то?","0")
		Return
	}

	:?:/хирург2::
	SendInput, {F8}  
	Sleep 150
	{
		SendChat("say Ломали себе что-то? Может были какие либо травмы?","0")
		Return
	}

	:?:/хирург3::
	SendInput, {F8}  
	Sleep 150
	{
		SendChat("say Встаньте прямо, проверим вашу осанку.","0")
		Return
	}

	:?:/хирург4::
	SendInput, {F8}  
	Sleep 150
	{
		SendChat("me ощупывает позвоночник человека", "5000")   
		SendChat("do Позвоночник ощупан.", "5000")   
		SendChat("say Все, осмотр окончен, скоро я занесу все данные.", "5000")   
		SendChat("say Проходите к следующему врачу. Всего доброго{!}","0")
		Return
	}

	:?:/узи::
	SendInput,  {F8}
	Sleep 150
	{
		SendChat("say Здравствуйте, я врач-сонолог " Name " " SecondName ", начнем наш осмотр.", "5000") 
		SendChat("say Снимите кофту, пожалуйста, и ложитесь на койку.", "5000")   
		SendChat("me взя" lla " гель со стола и откры" lla " его", "5000")   
		SendChat("do Открытый гель в руке.", "5000")   
		SendChat("me выдави" lla " гель на живот пациента и размаза" lla " его", "5000")   
		SendChat("do Зона для сканирования обработана гелем.", "5000")   
		SendChat("me закры" lla " тюбик с гелем и постави" lla " на стол", "5000")   
		SendChat("do Возле койки стоит аппарат для УЗИ.", "5000")   
		SendChat("me включи" lla " аппарат для УЗИ и взя" lla " датчик с аппарата", "5000")   
		SendChat("do Датчик УЗИ в руке.", "5000")   
		SendChat("me поводи" lla " датчиком по животу и изучи" lla " результаты", "5000")   
		SendChat("do Результаты УЗИ на мониторе. ", "5000")   
		SendChat("me закончи" lla " осмотр и постави" lla " датчик на место", "5000")   
		SendChat("do Датчик УЗИ на аппарате.", "5000")   
		SendChat("me взя" lla " салфетки со стола и переда" lla " их пациенту", "5000")   
		SendChat("say Протрите живот и можете идти.","0")
		Return
	}

	:?:/окулист1::
	SendInput,  {F8}
	Sleep 150
	{
		SendChat("say Здравствуйте, я врач-офтальмолог " Name " " SecondName ", начнем наш осмотр.", "5000") 
		SendChat("say Передайте мне вашу мед. карту.","0")
		Return
	}

	:?:/окулист2::
	SendInput,  {F8}
	Sleep 150
	{
		SendChat("me взя" lla " мед. карту в руки", "5000")   
		SendChat("do Мед. карта в руках.", "5000")   
		SendChat("me положи" lla " мед.карту на стол", "5000")   
		SendChat("do Мед. карта на столе.", "5000")   
		SendChat("say Пожалуйста, успокойтесь и дышите ровно.","0")
		Return
	}

	:?:/окулист3::
	SendInput,  {F8}
	Sleep 150
	{
		SendChat("do На столике лежит пластиковая лопатка.", "5000")   
		SendChat("me указа" lla " на лопатку правой рукой", "5000")   
		SendChat("say Возьмите лопатку и закройте левый глаз.","0")
		Return
	}


	:?:/окулист4::
	SendInput,  {F8}
	Sleep 150
	{
		SendChat("say Следите за указкой, я буду показывать буквы.", "5000")   
		SendChat("do Указка в руках.", "5000")   
		SendChat("me указа" lla " на букву «Ш»", "5000")   
		SendChat("say Какую букву я показываю?","0")
		Return
	}


	:?:/окулист5::
	SendInput,  {F8}
	Sleep 150
	{
		SendChat("do Указка в руках.", "5000")   
		SendChat("me показа" lla " букву «Р»", "5000")   
		SendChat("say Какую букву я показываю.","0")
		Return
	}


	:?:/окулист6::
	SendInput,  {F8}
	Sleep 150
	{
		SendChat("say Хорошо. Закройте правый глаз.", "5000")   
		SendChat("me указа" lla " на букву «Ы»", "5000")   
		SendChat("say Какую букву я показываю?", "5000")   
		SendChat("say Хорошо, кладите лопатку на столик.","0")
		Return
	}


	:?:/окулист7::
	SendInput,  {F8}
	Sleep 150
	{
		SendChat("do На столе мед. карта.", "5000")   
		SendChat("me открыв мед. карту заполни" lla " результаты осмотра", "5000")   
		SendChat("do Мед. карта заполнена.", "5000")   
		SendChat("me протяну" lla " руку вдоль стола", "5000")   
		SendChat("do На столе печать.", "5000")   
		SendChat("me взяв печать со стола постави" lla " метку на мед. карте", "5000")   
		SendChat("do Печать поставлена.", "5000")   
		SendChat("me положи" lla " печать на стол", "5000")   
		SendChat("do Печать на столе.", "5000")   
		SendChat("me взяв мед. карту протяну" lla " её человеку напротив", "5000")   
		SendChat("say Отлично, Вы прошли осмотр.", "5000")   
		SendChat("say Можете быть свободны.","0")
		Return
	}

	:?:/нарколог1::
	SendInput, {F6}
	Sleep 150
	{
		SendChat("say Здравствуйте, я врач-нарколог " Name " " SecondName ", начнем наш осмотр.", "5000")  
		SendChat("say Ответьте пожалуйста на несколько моих вопросов.","0")
		Return
	}

	:?:/нарколог2::
	SendInput, {F6}  
	Sleep 150
	{
		SendChat("say Вы на данный момент употребляете наркотические вещества?", "5000")    
		SendChat("say Ранее баловались подобным?","0")
		Return
	}

	:?:/нарколог3::
	SendInput, {F6}  
	Sleep 150
	{
		SendChat("say Хорошо, следующий вопрос...", "5000")    
		SendChat("say Скажите, что у меня над головой?","0")
		Return
	}

	:?:/нарколог4::
	SendInput, {F6}  
	Sleep 150
	{
		SendChat("say Действительно, ещё один вопрос.", "5000")    
		SendChat("say Как меня зовут?","0")
		Return
	}

	:?:/нарколог5::
	SendInput, {F6}  
	Sleep 150
	{
		SendChat("say Верно, откуда вам знать.", "5000")    
		SendChat("do Врач отварачивается.", "5000")    
		SendChat("me показывает 3 пальца человеку напротив", "5000")    
		SendChat("do Врач показывает 3 пальца.", "5000")    
		SendChat("say Сколько пальцев я показываю вам?","0")
		Return
	}

	:?:/нарколог6::
	SendInput, {F6}  
	Sleep 150
	{
		SendChat("say Все хорошо, я запишу данные в вашу медицинскую карту.","0")
		Return
	}

	:?:/прививка1:: 
	SendInput, {F6}
	Sleep 150
	{
		SendChat("say Здравствуйте, я врач-педиатр " Name " " SecondName ", оголите пока что ваше плечо.", "5000")  
		SendChat("do На полке лежит антидот со шприцом. ", "5000")   
		SendChat("me взя" lla " шприц и сня" lla " с него обёртку ", "5000")   
		SendChat("do Обёртка снята. ", "5000")   
		SendChat("me взя" lla " антидот, затем нача" lla " вводить его в шприц ", "5000")   
		SendChat("do Антидот в шприце. ", "5000")   
		Return
	}

	:?:/прививка2:: 
	SendInput, {F6}
	Sleep 150
	{
		SendChat("do На полке лежит спиртовая салфетка. ", "5000")   
		SendChat("me взяв спиртовую салфетку, помаза" lla " ею по месту дальнейшего введения антидота", "5000")   
		SendChat("do Плечо человека напротив обработано. ", "5000")   
		SendChat("me вколо" lla " шприц в плечо, затем нача" lla " вводить антидот ", "5000")   
		SendChat("do Антидот введён. ", "5000")   
		SendChat("me выкину" lla " шприц в специальный бак ", "5000")   
		SendChat("do Шприц в мусорке. ", "5000")   
		SendChat("me оторва" lla " обертку от спиртовой салфетки, затем приложи" lla " салфетку к месту прокола ", "5000")   
		SendChat("say Придержите салфетку другой рукой, cейчас я вам ещё пачку масок дам.","0")
		Return
	}

	:?:/прививка3:: 
	SendInput, {F6}
	Sleep 150
	{
		SendChat("do Маски лежат на полке. ", "5000")   
		SendChat("me взя" lla " маски с полки, затем переда" lla " их человеку напротив", "5000")   
		SendChat("do Рука вытянута.", "5000")   
		SendChat("say Вот возьмите, старайтесь избегать большого скопление людей{!}", "5000")   
		SendChat("say Помните, МЗ заботится о вас и ваших близких{!}", "5000")   
		SendChat("say Всего доброго, не болейте{!})","0")
		Return
	}

	:?:/сдкрови1:: 
	SendInput, {F6}
	Sleep 150
	{
		SendChat("say Здравствуйте, я врач-гематолог " Name " " SecondName ", оголите пока что ваше плечо.", "5000")  
		SendChat("say Садитесь на койку, закатайте рукав, а я пока что приготовлюсь", "5000")   
		SendChat("do Шприц лежит на столике.", "5000")   
		SendChat("me взя" lla " шприц в руку", "5000")   
		SendChat("do Шприц в руке.", "5000")   
		SendChat("say Поработайте кулачком.","0")
		Return
	}

	:?:/сдкрови2:: 
	SendInput, {F6}
	Sleep 150 
	{
		SendChat("me встави" lla " шприц в вену и нача" lla " набирать кровь", "5000")   
		SendChat("do Шприц заполнен.", "5000")   
		SendChat("me доста" lla " шприц из вены и положи" lla " на столик", "5000")   
		SendChat("do Шприц на столе.","0")
		Return
	}

	:?:/сдкрови3:: 
	SendInput, {F6}
	Sleep 150 
	{
		SendChat("do Вата на столе.", "5000")   
		SendChat("me взя" lla " кусочек ваты в руку и приложи" lla " к месту укола", "5000")   
		SendChat("do Вата на месте укола.", "5000")   
		SendChat("say Зажмите вашу и держите на месте укола около 10 минут", "5000")   
		SendChat("say Проходите в следующий кабинет","0")
		Return
	}
	
	
	
	
	
	{ ; ЗАКРЫТЫЙ ПЕРЕЛОМ
		:?:/зперелом1::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("say Здравствуйте, при каких обстоятельствах у вас началась боль?", "0")
			Return
		}
		:?:/зперелом2::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("say Хорошо, оголите часть тела которая болит и ложитесь на кушетку и ожидайте.", "300")
			SendChat("do Рентген аппарат стоит около кушетки.", "300")
			SendChat("do Рентгенозащитный фартук на сотруднике.", "0")
			Return
		}
		:?:/зперелом3::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("me открыв дверь, заш" ella " в комнату просмотра снимков", "5000")
			SendChat("do Находится в изолированной комнате.", "5000")
			SendChat("me включи" lla " рентген аппарат и сдела" lla " снимок нужного места", "5000")
			SendChat("do Рентген совершил снимок.", "5000")
			SendChat("me взя" lla " снимок из аппарата и нача" lla " его изучать", "5000")
			SendChat("do У пострадавшего имеется перелом конечности?", "0")
			Return
		}
		:?:/зперелом-::
		Sleep 150
		SendInput, {Enter}
		{
			Долобене = "Долобене"
			SendChat("do У пострадавшего отсутствует перелом конечности.", "5000")
			SendChat("say На снимке перелома не замечено, у вас обычный ушиб.", "5000")
			SendChat("say Я вам выпишу мазь " Долобене " за 450 рублей. Вы согласны на лечение?", "0")
			Return
		}
		:?:/зперелом+::
		Sleep 150
		SendInput, {Enter}
		{
			Кетанов = "Кетанов"
			SendChat("do У пострадавшего обнаружен перелом конечности.", "5000")
			SendChat("do Вакуумный шкаф с нагретым фиксатором-турбокаст у стены.", "5000")
			SendChat("me открыв шкаф, взя" lla " фиксатор в руки и наложи" lla " на место перелома", "5000")
			SendChat("do Фиксатор зафиксирован на месте перелома.", "5000")
			SendChat("say Запрещено находиться в местах с высоким градусом тепла 1 месяц. Мочить фиксатор можно.", "5000")
			SendChat("say Стоимость обезболивающего препарата " Кетанов " 450 рублей. Вы согласны на лечение?", "0")
			Return
		}
	}
	
	:?:/пульс1:: 
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("me подне%Rod8% руку к сонной артерии пациента", "5000")
			SendChat("do Рука поднесена к сонной артерии пациента.", "5000")
			SendChat("try обнаружи" lla " пульс на сонной артерии", "0")
			Return
		}

:?:/пульс+:: 
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Сумка в руке.", "5000")
			SendChat("me постави" lla " на землю", "5000")
			SendChat("do Сумка на земле.", "5000")
			SendChat("me откры" lla " сумку", "5000")
			SendChat("do Сумка открыта.", "5000")
			SendChat("me доста" lla " спирт и вату из сумки", "5000")
			SendChat("do Спирт и вата в руках.", "5000")
			SendChat("me смочи" lla " вату", "5000")
			SendChat("do Вата смоченая.", "5000")
			SendChat("me прове" lla " ватой около носа человека", "5000")
			SendChat("do Человек пришёл в сознание.", "5000")
			SendChat("me убирает вату и спирт в сумку", "5000")
			SendChat("do Вата и спирт в сумке.", "5000")
			SendChat("me закры" lla " сумку", "5000")
			SendChat("do Сумка закрыта.", "5000")
			SendChat("me взя" lla " сумку в руку", "5000")
			SendChat("do Сумка в руке.", "0")
			Return
		}

:?:/пульс-:: 
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("me приподня" lla " голову пациента", "5000")
			SendChat("do Голова поднята.", "5000")
			SendChat("me разорва" lla " верхнюю одежду человека", "5000")
			SendChat("do Одежда разорвана.", "5000")
			SendChat("me нача" lla " делать непрямой массаж сердца", "5000")
			SendChat("do Сделал непрямой массаж сердца.", "5000")
			SendChat("me нача" lla " делать искусственное дыхание человеку", "5000")
			SendChat("try обнаружи" lla " пульс на сонной артерии", "0")
			Return
		}

:?:/сотряс1:: 
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do В нагрудном кармане лежит фонарь.", "5000")
			SendChat("me откры" lla " карман и взя" lla " фонарь", "5000")
			SendChat("do Фонарь в руке.", "5000")
			SendChat("me светит фонарем в глаза пациента", "5000")
			SendChat("do Свет на глазах.", "5000")
			SendChat("try увиде" lla " реакцию зрачков на свет", "0")
			Return
		}

:?:/сотряс+:: 
		Sleep 150
		SendInput, {Enter}
		{
			Анальгин = "Анальгин"
			Гепариновая = "Гепариновую мазь"
			SendChat("me осмотре" lla " пациента и постави" lla " диагноз", "5000")
			SendChat("do Диагноз поставлен.", "5000")
			SendChat("say У вас ушиб головного мозга.", "5000")
			SendChat("Я вам выпишу " Гепариновая " и " Анальгин ", также рекомендую поспать.", "0")
			Return
		}


:?:/сотряс-:: 
		Sleep 150
		SendInput, {Enter}
		{
			Анальгин = "Анальгин"
			SendChat("me осмотре" lla " пациента и постави" lla " диагноз", "5000")
			SendChat("do Диагноз поставлен.", "5000")
			SendChat("say У вас сотрясение головного мозга.", "5000")
			SendChat("say Я вам выпишу " Анальгин ", также рекомендую поспать.", "0")
			Return
		}
	
	{ ; ОТКРЫТЫЙ ПЕРЕЛОМ
		:?:/оперелом1::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do У стены стоит хирургический стол с инструментами.", "5000")
			SendChat("say Сейчас я вам вколю внутривенный наркоз.", "5000")
			SendChat("do Шкаф у стены с медикаментами закрыт.", "5000")
			SendChat("me открыв шкаф, доста" lla " шприц и наполни" lla " его кетамином", "5000")
			SendChat("do Шприц наполненный кетамином в руке.", "0")
			Return
		}
		:?:/оперелом2::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("me нача" lla " вводить кетамин в вену", "5000")
			SendChat("do Наркоз введен.", "0")
			Return
		}
		:?:/оперелом3::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Хирургический стол возле кушетки.", "5000")
			SendChat("me взя" lla " антисептик и ватную палочку со стола", "5000")
			SendChat("do Антисептик и ватная палочка в руках.", "5000")
			SendChat("me обработа" lla " место перелома", "5000")
			SendChat("do Место вокруг перелома обработано.", "0")
			Return
		}
		:?:/оперелом4::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do На хирургическом столе лежит рано расширитель «Госсе».", "5000")
			SendChat("me взя" lla " расширитель и расшири" lla " рану", "5000")
			SendChat("do Рана расширена.", "0")
			Return
		}
		:?:/оперелом5::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do На столе лежит пинцет и медицинский лоток.", "5000")
			SendChat("me взя" lla " предметы в руки нача" lla " извлекать осколки кости из раны", "5000")
			SendChat("do Все осколки находятся в лотке.", "0")
			Return
		}
		:?:/оперелом6::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("me нача" lla " вправлять кость на место", "5000")
			SendChat("do Кость вправлена на место.", "0")
			Return
		}
		:?:/оперелом7::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Хирургическая нить и игла на столе.", "5000")
			SendChat("me взяв иглу, нача" lla " зашивать рану", "5000")
			SendChat("do Рана зашита.", "0")
			Return
		}
	}

	{ ; ВЫВИХ
		:?:/вывих1::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do У стены стоит холодильник с ледяными компрессами.", "5000")
			SendChat("me откры" lla " холодильник и взя" lla " один компрессор", "5000")
			SendChat("do Компрессор в руке.", "0")
			Return
		}
		:?:/вывих2::
		Sleep 150
		SendInput, {Enter}
		{
			Долобене = "Долобене"
			SendChat("me переда" lla "  компрессор пациенту напротив", "5000")
			SendChat("say Держите, приложите его к месту вывиха и держите 15 минут.", "5000")
			SendChat("say Стоимость мази " Долобене " 450 рублей. Вы согласны на лечение?", "0")
			Return
		}
	}

	{ ; РАСТЯЖЕНИЕ
		:?:/растяжение1::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Шкаф у стены с медикаментами закрыт.", "5000")
			SendChat("me открыв шкаф, взя" lla " эластичный бинт", "5000")
			SendChat("do Бинт в руках.", "0")
		}
		:?:/растяжение2::
		Sleep 150
		SendInput, {Enter}
		{
			Долобене = "Долобене"
			SendChat("me наложи" lla " бинт на место растяжения", "5000")
			SendChat("do Бинт наложен.", "5000")
			SendChat("say Стоимость мази " Долобене " 450 рублей. Вы согласны на лечение?", "0")
			Return
		}
	}

	{ ; БОЛЬ В ОБЛАСТИ ЖИВОТА
		:?:/бживот::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("say Сейчас я вас осмотрю.", "5000")
			SendChat("do Перчатки на сотруднике.", "5000")
			SendChat("me нача" lla " ощупывать пациента в области желудка", "5000")
			SendChat("do Пальпация.", "5000")
			SendChat("me закончи" lla " осмотр и сня" lla " перчатки", "5000")
			SendChat("do Перчатки сняты.", "0")
			Return 
		}
	}

	{ ; ОТРАВЛЕНИЕ
		:?:/отравление1::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("say Начнем процедуру, откройте рот и высуньте язык на максимум.", "0")
			Return 
		}
		:?:/отравление2::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Желудочный зонд на столе.", "5000")
			SendChat("me подстави" lla " к языку пациента желудочный зонд", "5000")
			SendChat("do Зонд на языке пациента.", "5000")
			SendChat("say Сейчас сделайте несколько глотков.", "0")
			Return 
		}
		:?:/отравление3::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Зонд в желудке.", "5000")
			SendChat("do На столе емкость с водой.", "5000")
			SendChat("me взяв емкость, нача" lla " заливать воду в воронку", "5000")
			SendChat("do Промывание желудка закончилось.", "0")
			Return 
		}
		:?:/отравление4::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Шкаф стоит у стены.", "5000")
			SendChat("me открыв шкаф, взя" lla " полотенце и переда" lla " пациенту", "5000")
			SendChat("do Рука с полотенцем протянута.", "5000")
			SendChat("say Вытирайтесь и одевайтесь, сейчас я вам выпишу препараты.", "0")
			Return 
		}
	}

	{ ; ГАСТРИТ
		:?:/гастрит1::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("say Раздевайтесь до пояса для начала процедуры.", "0")
			Return 
		}
			
		:?:/гастрит2::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Шкаф стоит у стены.", "5000")
			SendChat("me открыв шкаф, взя" lla " средство и продезинфицирова" lla " зонд", "5000")
			SendChat("do Эндоскопический зонд продезинфицирован.", "5000")
			SendChat("say Откройте рот и максимально высуньте язык.", "0")
			Return 
		}
		:?:/гастрит3::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("me приложи" lla " зонд к языку пациента", "5000")
			SendChat("do Зонд на языке пациента.", "5000")
			SendChat("say А сейчас сделайте пару глотков.", "0")
			Return 
		}
		:?:/гастрит4::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Зонд в желудке.", "5000")
			SendChat("me нача" lla " отслеживать желудок изнутри с помощью панели-монитора", "5000")
			SendChat("do Взгляд на монитор.", "5000")
			SendChat("me увиде" lla ", что на мониторе есть нарушения органов", "5000")
			SendChat("do Обнаружено нарушение органов.", "0")
			Return 
		}
		:?:/гастрит5::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("me аккуратно доста" lla " зонд из человека", "5000")
			SendChat("do Зонд в руке.", "5000")
			SendChat("say Одевайтесь, сейчас я поставлю диагноз и выпишу препарат.", "0")
			Return 
		}
	}

	{ ; АППЕНДИЦИТ 
		:?:/аппендицит1::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("say Есть ли у вас аппетит?", "0")
			Return 
		}
		:?:/аппендицит2::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Градусник на столе.", "5000")
			SendChat("me взя" lla " градусник в руку и переда" lla " пациенту", "5000")
			SendChat("say Держите градусник и измеряйте температуру вашего тела.", "0")
			Return 
		}
		:?:/аппендицит3::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("me взя" lla " градусник у пациента и посмотре" lla " температуру тела", "5000")
			SendChat("do Изучение температуры тела.", "5000")
			SendChat("do У пациента завышена температура?", "0")
			Return 
		}
		:?:/аппендицит-::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("say Температура у вас нормальная, ладно, продолжим осмотр.", "0")
			Return 
		}
		:?:/аппендицит1+::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("say Температура повышена. Ожидайте, сейчас продолжим осмотр.", "5000")
			SendChat("say Раздевайтесь до пояса и ожидайте.", "0")
			Return 
		}
		:?:/аппендицит2+::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Перчатки на сотруднике.", "5000")
			SendChat("me нача" lla " легонько надавливать правее пупка рукой", "5000")
			SendChat("do Пальпация.", "5000")
			SendChat("say Как болит и где именно?", "0")
			Return 
		}
		:?:/аппендицит3+::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("say Да, это аппендицит.", "0")
			SendChat("say Раздевайтесь до пояса и ложитесь на кушетку. Ожидайте.", "5000")
			SendChat("do Шкаф у стены с медикаментами закрыт.", "5000")
			SendChat("me открыв шкаф, доста" lla " шприц и наполни" lla " его кетамином", "0")
			Return 
		}
		:?:/аппендицит4+::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("me нача" lla " вводить кетамин в вену", "5000")
			SendChat("me взя" lla " антисептик и обработа" lla " место манипуляций", "5000")
			SendChat("do Маркер в кармане.", "5000")
			SendChat("me взя" lla " маркер и нача" lla " чертить линию пореза", "0")
			Return 
		}
		:?:/аппендицит5+::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Хирургический лоток с инструментами на столе.", "5000")
			SendChat("me взя" lla " скальпель и нача" lla " делать надрез по маркеру", "5000")
			SendChat("me взя" lla " из лотка зажим и расширитель, затем расшири" lla " разрез", "5000")
			SendChat("me зажа" lla " зажимом переход к аппендициту", "5000")
			SendChat("do Основа аппендицита зажата.", "5000")
			SendChat("me взя" lla " скальпель из лотка и прове" lla " по переходу в аппендицит", "5000")
			SendChat("do Аппендицит отрезан.", "5000")
			SendChat("me взяв хирургическую иглу, нача" lla " зашивать переход к аппендициту и разрез", "5000")
			SendChat("do Переход и место разреза зашито.", "5000")
			SendChat("me взяв упаковку бинта, нача" lla " перевязку на месте зашитой раны", "5000")
			SendChat("do Перевязка наложена.", "0")
			Return 
		}
	}

	{ ; ОГНЕСТРЕЛЬНОЕ РАНЕНИЕ
		:?:/огнестрельное1::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("say Аккуратно снимайте верхнюю одежду и ложитесь на кушетку.", "0")
			Return 
		}
		:?:/огнестрельное2::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Перчатки на сотруднике.", "5000")
			SendChat("me нача" lla " осмотр пулевого ранения", "0")
			Return 
		}
		:?:/огнестрельное3::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Шкаф у стены с медикаментами закрыт.", "5000")
			SendChat("me открыв шкаф, доста" lla " шприц и наполни" lla " его кетамином", "5000")
			SendChat("me нача" lla " вводить кетамин в вену", "5000")
			SendChat("me взя" lla " антисептик и обработа" lla " место манипуляций", "5000")
			SendChat("me взя" lla " пинцет из лотка и доста" lla " пулю из раны с помощь пинцета", "5000")
			SendChat("do Пуля в пинцете.", "5000")
			SendChat("me положи" lla " пулю в лоток и пинцет в лоток использованных инструментов", "5000")
			SendChat("me взя" lla " кусочек ваты и пинцет, затем нача" lla " обрабатывать рану", "5000")
			SendChat("do Рана обработана.", "5000")
			SendChat("me доста" lla " бинт и нача" lla " делать перевязку на месте ранения", "5000")
			SendChat("do Перевязка наложена.", "0")
			Return 
		}
	}
	
	{ ; РУКИ (ПОМЫТЬ)
		:?:/руки:: 
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do Кран у стола.", "3000")
			SendChat("me откры" lla " кран", "3000")
			SendChat("do Кран открыт.", "3000")
			SendChat("do В мыльнице лежит мыло.", "3000")
			SendChat("me взя" lla " мыло и начал мыть руки", "3000")
			SendChat("do Руки вымыты.", "3000")
			SendChat("me положи" lla " мыло в мыльницу", "3000")
			SendChat("do Мыло в мыльнице.", "3000")
			SendChat("me выключи" lla " кран", "3000")
			SendChat("do Кран выключен.", "0")
			Return 
		}
	}
	
	{ ; ПЕРЧАТКИ
		:?:/перчатки::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("do У стены стоит стол с хирургическими инструментами.", "3000")
			SendChat("me взя" lla " со стола упаковку хирургических перчаток и откры" lla " её", "3000")
			SendChat("do Упаковка открыта.", "3000")
			SendChat("me доста" lla " из упаковки хирургические перчатки и оде" lla " их", "3000")
			SendChat("do Хирургические перчатки на руках.", "0")
			Return 
		}
	}
	
	{ ; КЛЯТВА
		:?:/клятва::
		Sleep 150
		SendInput, {Enter}
		{
			SendChat("s Я торжественно клянусь посвятить свою жизнь служению человечеству.", "5000")
			SendChat("s Я воздам моим учителям должное уважение и благодарность.", "5000")
			SendChat("s Я достойно и добросовестно буду исполнять свои профессиональные обязанности.", "5000")
			SendChat("s Здоровье моего пациента будет основной моей заботой.", "5000")
			SendChat("s Я буду уважать доверенные мне тайны.", "5000")
			SendChat("s Я всеми средствами, которые в моей власти, буду поддерживать честь и благородные традиции профессии врача.", "5000")
			SendChat("s К своим коллегам я буду относиться как к братьям.", "5000")
			SendChat("s Никакой мотив мне не помешает исполнить свой долг по отношению к пациенту.", "5000")
			SendChat("s Я буду придерживаться глубочайшего уважения к человеческой жизни, начиная с момента зачатия.", "5000")
			SendChat("s Даже под угрозой я не буду использовать свои знания против законов человечности.", "5000")
			SendChat("s Я обещаю это торжественно, добровольно и чистосердечно.", "0")
			Return 
		}
	}
	
}








GuiMenuGui:
FilePath = %A_Temp%\data.profile
AllFilePath = %A_WorkingDir%
	
Gui, GuiMenu:Add, Button, x10 y10 w130 gGuiStandart, Справочник биндов
Gui, GuiMenu:Add, Button, x10 y+1 w130 gGuiOperations, Справочник операций/проверок
Gui, GuiMenu:Add, Button, x10 y+1 w130 gGuiLecture, Панель лекций
Gui, GuiMenu:Add, Button, x10 y+1 w130 gGuiUserData, Изменение данных

Gui, GuiMenu:Add, Button, x10 y+7 w270 gGuiMenuClose, Закрыть

Gui, GuiMenu:Add, Button, x150 y10 w130 gLinkRegulation, Устав
Gui, GuiMenu:Add, Button, x150 y+1 w130 gLinkTrainingManual, Методичка
Gui, GuiMenu:Add, Button, x150 y+1 w130 gLinkStipend, Пособие

; Gui, GuiMenu:Add, Button, x150 y+14 w130 gAHKupdate, Обновить (убрано)


Gui, GuiMenu:Menu
Gui, GuiMenu:-SysMenu
Gui, GuiMenu:Show, h170 w290, Меню
Gui, GuiMenu:Add, Text, x0 w290 y152 +0x01 cBDBDBD, %TextFooter%
Return

/*
AHKupdate:
{
	Return
}
*/

LinkRegulation:
{
Run, https://vk.cc/c8e0Sa
Return
}
LinkTrainingManual:
{
Run, https://vk.cc/c7ysX7
Return
}
LinkStipend:
{
Run, https://vk.cc/c8e1jA
Return
}

GuiStandart:
; MsgBox, 16, Ошибка, Функция недоступна, находится в разработке.
Gui, GuiMenu:Hide
	Sleep 150
Gui, GuiStandart:Show
Return

GuiOperations:
; MsgBox, 16, Ошибка, Функция недоступна, находится в разработке.
Gui, GuiMenu:Hide
	Sleep 150
Goto, GuiOperationsGui
Return

GuiLecture:
; MsgBox, 16, Ошибка, Функция недоступна, находится в разработке.
Gui, GuiMenu:Hide
	Sleep 150
Goto, GuiLectureGui
Return

GuiUserData:
; MsgBox, 16, Ошибка, Функция недоступна, находится в разработке.
Gui, GuiMenu:Hide
	Sleep 150
Goto, GuiUserDataGui
Return

GuiMenuClose:
{
	MsgBox, 36, Вопрос, Вы дейтвительно хотите закрыть скрипт?
	IfMsgBox, Yes
	{
		ExitApp
	}
	IfMsgBox, No
	{
		Return
	}
}
Return






GuiOperationsGui:
FilePath = %A_Temp%\data.profile
	xnGuiOperations := 5
	Gui, GuiOperations:Add, GroupBox, x5 y5 w197 h240 c0a0a40, (Проверки)
	Gui, GuiOperations:Add, Text, x10 yp+15 gPsychologist, [/психолог(1-8)] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, психолог
	Gui, GuiOperations:Add, Text, x10 y+0 gSurgeon, [/хирург(1-4)] 
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, хирург
	Gui, GuiOperations:Add, Text, x10 y+0 gOptometrist, [/окулист(1-7)] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, окулист
	Gui, GuiOperations:Add, Text, x10 y+0 gNarcologist, [/нарколог(1-6)] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, нарколог
	Gui, GuiOperations:Add, Text, x10 y+0 gNarcologist, [/узи] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, УЗИ
	
	Gui, GuiOperations:Add, Text, x10 y+0 gNarcologist, [/сдкрови(1-3)] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, сдача крови
	Gui, GuiOperations:Add, Text, x10 y+0 gNarcologist, [/прививка(1-3)] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, прививка
	
	Gui, GuiOperations:Add, Text, x10 y+15 gStomachPain, [/бживот] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, боль в животе
	
	Gui, GuiOperations:Add, Text, x10 y+15, [/сотряс(1,+,-)] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, сотрясение мозга
	Gui, GuiOperations:Add, Text, x10 y+0, [/пульс(1,+, -)] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, пульс и нашатырь

	Gui, GuiOperations:Add, GroupBox, x200 y5 w185 h240 c0a0a40, (Операции)
	Gui, GuiOperations:Add, Text, x205 yp+15 gClosedFracture, [/зперелом] - 
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, закрытый перелом
	Gui, GuiOperations:Add, Text, x205 y+0 gOpenFracture, [/оперелом] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, открытый перелом
	Gui, GuiOperations:Add, Text, x205 y+0 gDislocation, [/вывих] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, вывих
	Gui, GuiOperations:Add, Text, x205 y+0 gStretching, [/растяжение] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, растяжение
	Gui, GuiOperations:Add, Text, x205 y+0 gPoisoning, [/отравление] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, отравление
	Gui, GuiOperations:Add, Text, x205 y+0 gGastritis, [/гастрит] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, гастрит
	Gui, GuiOperations:Add, Text, x205 y+0 gAppendicitis, [/аппендицит] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, аппендицит
	Gui, GuiOperations:Add, Text, x205 y+0 gGunshotWound, [/огнестрельное] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, огнестрельное
	Gui, GuiOperations:Add, Text, x265 y+0 c800000, ранение
	Gui, GuiOperations:Add, Text, x205 y+15, [/руки] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, помыть руки
	Gui, GuiOperations:Add, Text, x205 y+0, [/перчатки] -
	Gui, GuiOperations:Add, Text, x+%xnGuiOperations% yp c800000, одеть перчатки
	
	Gui, GuiOperations:Add, Text, x200 y+25 w185 c800000 +0x01 +BackgroundTrans, Нажмите на команду, чтобы`nполучить подробное описание.

	Gui, GuiOperations:Add, Button, x290 y250 w55 h25 gButtonDiscardGuiOperations, Меню

	Gui, GuiOperations:Menu
	Gui, GuiOperations:Show, h280 w390, Справочник операций/проверок
	Return 
	
	
	ButtonDiscardGuiOperations:
	; MsgBox, 16, Ошибка, Функция недоступна, находится в разработке.
	Gui, GuiOperations:Hide
		Sleep 150
	Goto, GuiMenuGui
	Return

	GuiOperationsGuiClose:
	{
		MsgBox, 36, Вопрос, Вы дейтвительно хотите закрыть скрипт?
		IfMsgBox, Yes
		{
			ExitApp
		}
		IfMsgBox, No
		{
			Return
		}
	}
		
	Psychologist:
	{
	MsgBox, 16, Ошибка, Функция недоступна.
	Return
	}
	Surgeon:
	{
	MsgBox, 16, Ошибка, Функция недоступна.
	Return
	}
	Optometrist:
	{
	MsgBox, 16, Ошибка, Функция недоступна.
	Return
	}
	Narcologist:
	{
	MsgBox, 16, Ошибка, Функция недоступна.
	Return
	}
	
	ClosedFracture:
	{
		MsgBox, 0, [/зперелом] - закрытый перелом, [/зперелом1]:`nsay Здравствуйте, при каких обстоятельствах у вас началась боль?`n`n[/зперелом2]:`nsay Хорошо, оголите часть тела которая болит и ложитесь на кушетку и ожидайте.`ndo Рентген аппарат стоит около кушетки.`ndo Рентгенозащитный фартук на сотруднике.`n`n[/зперелом3]:`nme открыв дверь, заш%ella% в комнату просмотра снимков`ndo Находится в изолированной комнате.`nme включи%lla% рентген аппарат и сдела%lla% снимок нужного места`ndo Рентген совершил снимок.`nme взя%lla% снимок из аппарата и нача%lla% его изучать`ndo У пострадавшего имеется перелом конечности?`n`n[/зперелом-]:`ndo У пострадавшего отсутствует перелом конечности.`nsay На снимке перелома не замечено, у вас обычный ушиб.`nsay Я вам выпишу мазь "Долобене" за 450 рублей. Вы согласны на лечение?`n`n[/зперелом+]:`ndo У пострадавшего обнаружен перелом конечности.`ndo Вакуумный шкаф с нагретым фиксатором-турбокаст у стены.`nme открыв шкаф, взя%lla% фиксатор в руки и наложи%lla% на место перелома`ndo Фиксатор зафиксирован на месте перелома.`nsay Запрещено находиться в местах с высоким градусом тепла 1 месяц. Мочить фиксатор можно.`nsay Стоимость обезболивающего препарата "Кетанов" 450 рублей. Вы согласны на лечение?
	}
	Return
	OpenFracture:
	{
		MsgBox, 0, [/оперелом] - открытый перелом, [/оперелом1]:`ndo У стены стоит хирургический стол с инструментами.`nsay Сейчас я вам вколю внутривенный наркоз.`ndo Шкаф у стены с медикаментами закрыт.`nme открыв шкаф, доста%lla% шприц и наполни%lla% его кетамином`ndo Шприц наполненный кетамином в руке.`n`n[/оперелом2]:`nme нача%lla% вводить кетамин в вену`ndo Наркоз введен.`n`n[/оперелом3]:`ndo Хирургический стол возле кушетки.`nme взя%lla% антисептик и ватную палочку со стола`ndo Антисептик и ватная палочка в руках.`nme обработа%lla% место перелома`ndo Место вокруг перелома обработано.`n`n[/оперелом4]:`ndo На хирургическом столе лежит рано расширитель "Госсе".`nme взя%lla% расширитель и расшири%lla% рану`ndo Рана расширена.`n`n[/оперелом5]:`ndo На столе лежит пинцет и медицинский лоток.`nme взя%lla% предметы в руки нача%lla% извлекать осколки кости из раны`ndo Все осколки находятся в лотке.`n`n[/оперелом6]:`nme нача%lla% вправлять кость на место`ndo Кость вправлена на место.`n`n[/оперелом7]:`ndo Хирургическая нить и игла на столе.`nme взяв иглу, нача%lla% зашивать рану`ndo Рана зашита.
		Return
	}
	Dislocation:
	{
		MsgBox, 0, [/вывих] - вывих, [/вывих1]:`ndo У стены стоит холодильник с ледяными компрессами.`nme откры%lla% холодильник и взя%lla% один компрессор`ndo Компрессор в руке.``nn[/вывих2]:`nme переда%lla%  компрессор пациенту напротив`nsay Держите, приложите его к месту вывиха и держите 15 минут.`nsay Стоимость мази "Долобене" 450 рублей. Вы согласны на лечение?
		Return
	}
	Stretching:
	{
		MsgBox, 0, [/растяжение] - растяжение, [/растяжение1]:`ndo Шкаф у стены с медикаментами закрыт.`nme открыв шкаф, взя%lla% эластичный бинт`ndo Бинт в руках.`n`n[/растяжение2]:`nme наложи%lla% бинт на место растяжения`ndo Бинт наложен.`nsay Стоимость мази "Долобене" 450 рублей. Вы согласны на лечение?
		Return
	}
	Poisoning:
	{
		MsgBox, 0, [/отравление] - отравление, [/отравление1]:`nsay Начнем процедуру, откройте рот и высуньте язык на максимум.`n`n[/отравление2]:`ndo Желудочный зонд на столе.`nme подстави%lla% к языку пациента желудочный зонд`ndo Зонд на языке пациента.`nsay Сейчас сделайте несколько глотков.`n`n[/отравление3]:`ndo Зонд в желудке.`ndo На столе емкость с водой.`nme взяв емкость, нача%lla% заливать воду в воронку`ndo Промывание желудка закончилось.`n`n[/отравление4]:`ndo Шкаф стоит у стены.`nme открыв шкаф, взя%lla% полотенце и переда%lla% пациенту`ndo Рука с полотенцем протянута.`nsay Вытирайтесь и одевайтесь, сейчас я вам выпишу препараты.
		Return
	}
	Gastritis:
	{
		MsgBox, 0, [/гастрит] - гастрит, [/гастрит1]:`nsay Раздевайтесь до пояса для начала процедуры.`n`n[/гастрит2]:`ndo Шкаф стоит у стены.`nme открыв шкаф, взя%lla% средство и продезинфицирова%lla% зонд`ndo Эндоскопический зонд продезинфицирован.`nsay Откройте рот и максимально высуньте язык.`n`n[/гастрит3]:`nme приложи%lla% зонд к языку пациента`ndo Зонд на языке пациента.`nsay А сейчас сделайте пару глотков.`n`n[/гастрит4]:`ndo Зонд в желудке.`nme нача%lla% отслеживать желудок изнутри с помощью панели-монитора`ndo Взгляд на монитор.`nme увиде%lla%, что на мониторе есть нарушения органов`ndo Обнаружено нарушение органов.`n`n[/гастрит5]:`nme аккуратно доста%lla% зонд из человека`ndo Зонд в руке.`nsay Одевайтесь, сейчас я поставлю диагноз и выпишу препарат.
		Return
	}
	Appendicitis:
	{
		MsgBox, 0, [/аппендицит] - аппендицит (стр. 1), [/аппендицит1]:`nsay Есть ли у вас аппетит?`n`n[/аппендицит2]:`ndo Градусник на столе.`nme взя%lla% градусник в руку и переда%lla% пациенту`nsay Держите градусник и измеряйте температуру вашего тела.`n`n[/аппендицит3]:`nme взя%lla% градусник у пациента и посмотре%lla% температуру тела`ndo Изучение температуры тела.`ndo У пациента завышена температура?`n`n[/аппендицит-]:`nsay Температура у вас нормальная, ладно, продолжим осмотр.`n`n[/аппендицит1+]:`nsay Температура повышена. Ожидайте, сейчас продолжим осмотр.`nsay Раздевайтесь до пояса и ожидайте.`n`n[/аппендицит2+]:`ndo Перчатки на сотруднике.`nme нача%lla% легонько надавливать правее пупка рукой`ndo Пальпация.`nsay Как болит и где именно?`n`n`n(нажмите "ОК" чтобы открыть следующую страницу)
		MsgBox, 0, [/аппендицит] - аппендицит (стр. 2), [/аппендицит3+]:`nsay Да, это аппендицит. `nsay Раздевайтесь до пояса и ложитесь на кушетку. Ожидайте.`ndo Шкаф у стены с медикаментами закрыт.`nme открыв шкаф, доста%lla% шприц и наполни%lla% его кетамином`n`n[/аппендицит4+]:`nme нача%lla% вводить кетамин в вену`nme взя%lla% антисептик и обработа%lla% место манипуляций`ndo Маркер в кармане.`nme взя%lla% маркер и нача%lla% чертить линию пореза`n`n[/аппендицит5+]:`ndo Хирургический лоток с инструментами на столе.`nme взя%lla% скальпель и нача%lla% делать надрез по маркеру`nme взя%lla% из лотка зажим и расширитель, затем расшири%lla% разрез`nme зажа%lla% зажимом переход к аппендициту`ndo Основа аппендицита зажата.`nme взя%lla% скальпель из лотка и прове%lla% по переходу в аппендицит`ndo Аппендицит отрезан.`nme взяв хирургическую иглу, нача%lla% зашивать переход к аппендициту и разрез`ndo Переход и место разреза зашито.`nme взяв упаковку бинта, нача%lla% перевязку на месте зашитой раны`ndo Перевязка наложена.
		Return
	}
	GunshotWound:
	{
		MsgBox, 0, [/огнестрельное] - огнестрельное ранение, [/огнестрельное1]:`nsay Аккуратно снимайте верхнюю одежду и ложитесь на кушетку.`n`n[/огнестрельное2]:`ndo Перчатки на сотруднике.`nme нача%lla% осмотр пулевого ранения`n`n[/огнестрельное3]:`ndo Шкаф у стены с медикаментами закрыт.`nme открыв шкаф, доста%lla% шприц и наполни%lla% его кетамином`nme нача%lla% вводить кетамин в вену`nme взя%lla% антисептик и обработа%lla% место манипуляций`nme взя%lla% пинцет из лотка и доста%lla% пулю из раны с помощь пинцета`ndo Пуля в пинцете.`nme положи%lla% пулю в лоток и пинцет в лоток использованных инструментов`nme взя%lla% кусочек ваты и пинцет, затем нача%lla% обрабатывать рану`ndo Рана обработана.`nme доста%lla% бинт и нача%lla% делать перевязку на месте ранения`ndo Перевязка наложена.
		Return
	}
	StomachPain:
	{
		MsgBox, 0, [/бживот] - боль в области живота, [/бживот]:`nsay Сейчас я вас осмотрю.`ndo Перчатки на сотруднике.`nme нача%lla% ощупывать пациента в области желудка`ndo Пальпация.`nme закончи%lla% осмотр и сня%lla% перчатки`ndo Перчатки сняты.
		Return 
	}








GuiLectureGui:
FilePath = %A_Temp%\data.profile

Gui, GuiLecture:Add, GroupBox, x5 y5 w315 h41 c0a0a40, (Путь к файлу)
Gui, GuiLecture:Add, Edit, x10 y20 w305 h20 vEditLectureFile ReadOnly,

Gui, GuiLecture:Add, GroupBox, x5 y55 w315 h171 c0a0a40, (Предпросмотр файла)
Gui, GuiLecture:Add, Edit, x10 y70 w305 h150 vEditPreviewFile ReadOnly,

Gui, GuiLecture:Add, GroupBox, x5 y235 w315 h101 c0a0a40, (Памятка)
Gui, GuiLecture:Add, Text, x10 y255 w315 +0x01 +BackgroundTrans c800000, При написании лекции, знаки +, !, #, ? нужно указывать`nв фигурных скобках (пример: {#}), в конце каждой лекции писать "end"`nперед зачитыванием лекции на публику проверьте её`nна крыше, для активации используйте /лекция.

Gui, GuiLecture:Add, Button, x135 y340 w100 h25 gButtonOpenGuiLecture, Открыть файл
Gui, GuiLecture:Add, Button, x+0 yp w55 h25 gButtonDiscardGuiLecture, Меню

Gui, GuiLecture:Menu
Gui, GuiLecture:Show, h370 w325, Панель лекций  
Return

ButtonOpenGuiLecture:
FileEncoding, UTF-8
FileSelectFile, LectureFile, 3, %A_WorkingDir%, Панель лекций, Текстовые файлы (*.txt)
Gui, GuiLecture:Submit, NoHide
GuiControl,, EditLectureFile,  %LectureFile%
Goto, PreviewFileGuiLecture
Return

PreviewFileGuiLecture:
FileRead, PreviewFileText, %LectureFile%
Gui, GuiLecture:Submit, NoHide
GuiControl,, EditPreviewFile, %PreviewFileText%
Return
	
	
	#IfWinActive MTA:Province
	:?:/лекция::
	SendInput, {Enter}
	Sleep 1000
	FileEncoding, UTF-8-RAW
	Loop{
		FileReadLine, LectureFileLine, %LectureFile%, %A_Index%
		If ErrorLevel{
			MsgBox, 16, Ошибка, Произошла ошибка`nВы не открыли файл либо обнаружена ошибка.
			Break
		}
		Else If (LectureFileLine=="end"){
			Break
		}
		Else{
			Clipboard := 
			SendInput, {F8}%LectureFileLine%{Enter}{F8}
			Sleep 4000
		}
	}
	Return
	

	ButtonDiscardGuiLecture:
	; MsgBox, 16, Ошибка, Функция недоступна, находится в разработке.
	Gui, GuiLecture:Destroy
		Sleep 150
	Gui, GuiMenu:Show
	Return

	GuiLectureGuiClose:
	{
		MsgBox, 36, Вопрос, Вы дейтвительно хотите закрыть скрипт?
		IfMsgBox, Yes
		{
			ExitApp
		}
		IfMsgBox, No
		{
			Return
		}
	}
	Return


































GuiUserDataGui:
FilePath = %A_Temp%\data.profile
	IniRead Gender, %FilePath%, %DataGroup%, Gender
IniRead City, %FilePath%, %DataGroup%, City
IniRead IdNumber, %FilePath%, %DataGroup%, IdNumber
IniRead SurName, %FilePath%, %DataGroup%, SurName
IniRead Name, %FilePath%, %DataGroup%, Name
IniRead SecondName, %FilePath%, %DataGroup%, SecondName
IniRead Rank, %FilePath%, %DataGroup%, Rank
IniRead Post, %FilePath%, %DataGroup%, Post
IniRead Logo, %FilePath%, %DataGroup%, Logo
IniRead RankMES, %FilePath%, %DataGroup%, RankMES

	If(City=="Мирный") ; ----- ГОРОД -----
		CitySort = Мирный||Приволжск|Невский
	Else If(City=="Приволжск")
		CitySort = Приволжск||Мирный|Невский
	Else If(City=="Невский")
		CitySort = Невский||Мирный|Приволжск
	Else
		CitySort = Мирный|Приволжск|Невский


	If (Logo=="ERROR"){ ; ----- ЧАСЫ -----
		LogoSort = 
	}
	Else{
		LogoSort = %Logo%
	}


	If (SurName=="ERROR"){ ; ----- ФАМИЛИЯ -----
		SurNameSort = 
	}
	Else{
		SurNameSort = %SurName%
	}


	If (Name=="ERROR"){ ; ----- ИМЯ -----
		NameSort = 
	}
	Else{
		NameSort = %Name%
	}


	If (SecondName=="ERROR"){ ; ----- ОТЧЕСТВО -----
		SecondNameSort = 
	}
	Else{
		SecondNameSort = %SecondName%
	}


	If (Rank=="Интерн"){ ; ----- ДОЛЖНОСТЬ -----
		RankSort = Интерн||Фельдшер|Лаборант|Врач-стажер|Врач-участковый|Врач-терапевт|Врач-хирург|Заведующий отделением|Заместитель главного врача|Главный врач
	}
	Else If (Rank=="Фельдшер"){
		RankSort = Фельдшер||Интерн|Лаборант|Врач-стажер|Врач-участковый|Врач-терапевт|Врач-хирург|Заведующий отделением|Заместитель главного врача|Главный врач
	}
	Else If (Rank=="Лаборант"){
		RankSort = Лаборант||Интерн|Фельдшер|Врач-стажер|Врач-участковый|Врач-терапевт|Врач-хирург|Заведующий отделением|Заместитель главного врача|Главный врач
	}
	Else If (Rank=="Врач-стажер"){
		RankSort = Врач-стажер||Интерн|Фельдшер|Лаборант|Врач-участковый|Врач-терапевт|Врач-хирург|Заведующий отделением|Заместитель главного врача|Главный врач
	}
	Else If (Rank=="Врач-участковый"){
		RankSort = Врач-участковый||Интерн|Фельдшер|Лаборант|Врач-стажер|Врач-терапевт|Врач-хирург|Заведующий отделением|Заместитель главного врача|Главный врач
	}
	Else If (Rank=="Врач-терапевт"){
		RankSort = Врач-терапевт||Интерн|Фельдшер|Лаборант|Врач-стажер|Врач-участковый|Врач-хирург|Заведующий отделением|Заместитель главного врача|Главный врач
	}
	Else If (Rank=="Врач-хирург"){
		RankSort = Врач-хирург||Интерн|Фельдшер|Лаборант|Врач-стажер|Врач-участковый|Врач-терапевт|Заведующий отделением|Заместитель главного врача|Главный врач
	}
	Else If (Rank=="Заведующий отделением"){
		RankSort = Заведующий отделением||Интерн|Фельдшер|Лаборант|Врач-стажер|Врач-участковый|Врач-терапевт|Врач-хирург|Заместитель главного врача|Главный врач
	}
	Else If (Rank=="Заместитель главного врача"){
		RankSort = Заместитель главного врача||Интерн|Фельдшер|Лаборант|Врач-стажер|Врач-участковый|Врач-терапевт|Врач-хирург|Заведующий отделением|Главный врач
	}
	Else If (Rank=="Главный врач"){
		RankSort = Главный врач||Интерн|Фельдшер|Лаборант|Врач-стажер|Врач-участковый|Врач-терапевт|Врач-хирург|Заведующий отделением|Заместитель главного врача
	}
	Else{
		RankSort = Интерн|Фельдшер|Лаборант|Врач-стажер|Врач-участковый|Врач-терапевт|Врач-хирург|Заведующий отделением|Заместитель главного врача|Главный врач
	}

	If (RankMES=="Рядовой ВН. СЛ."){ ; ----- ДОЛЖНОСТЬ -----
		RankMESSort = Рядовой ВН. СЛ.||Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Младший сержант ВН. СЛ."){
		RankMESSort = Младший сержант ВН. СЛ.||Рядовой ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Сержант ВН. СЛ."){
		RankMESSort = Сержант ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Старший сержант ВН. СЛ."){
		RankMESSort = Старший сержант ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Старшина ВН. СЛ."){ 
		RankMESSort = Старшина ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Прапорщик ВН. СЛ."){
		RankMESSort = Прапорщик ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Старший прапорщик ВН. СЛ."){
		RankMESSort = Старший прапорщик ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Младший лейтенант ВН. СЛ."){
		RankMESSort = Младший лейтенант ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Лейтенант ВН. СЛ."){
		RankMESSort = Лейтенант ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Старший лейтенант ВН. СЛ."){
		RankMESSort = Старший лейтенант ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Капитан ВН. СЛ."){
		RankMESSort = Капитан ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Майор ВН. СЛ."){ 
		RankMESSort = Майор ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Подполковник ВН. СЛ."){
		RankMESSort = Подполковник ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Полковник ВН. СЛ."){
		RankMESSort = Полковник ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Генерал-майор ВН. СЛ."){
		RankMESSort = Генерал-майор ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Генерал-лейтенант ВН. СЛ."){ 
		RankMESSort = Генерал-лейтенант ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}
	Else If (RankMES=="Генерал-полковник ВН. СЛ."){ 
		RankMESSort = Генерал-полковник ВН. СЛ.||Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.
		}
	Else{ 
		RankMESSort = Рядовой ВН. СЛ.|Младший сержант ВН. СЛ.|Сержант ВН. СЛ.|Старший сержант ВН. СЛ.|Старшина ВН. СЛ.|Прапорщик ВН. СЛ.|Старший прапорщик ВН. СЛ.|Младший лейтенант ВН. СЛ.|Лейтенант ВН. СЛ.|Старший лейтенант ВН. СЛ.|Капитан ВН. СЛ.|Майор ВН. СЛ.|Подполковник ВН. СЛ.|Полковник ВН. СЛ.|Генерал-майор ВН. СЛ.|Генерал-лейтенант ВН. СЛ.|Генерал-полковник ВН. СЛ.
		}


	If (Post=="ERROR"){ ; ----- ОТДЕЛЕНИЕ -----
		PostSort = 
	}
	Else{
		PostSort = %Post%
	}


	If (IdNumber=="ERROR"){
		IdNumberSort = 000001
	}
	Else{
		IdNumberSort = %IdNumber%||000001
	}


	If (Gender=="Male"){
		CheckedMale = Checked
		CheckedFemale = 
	}
	Else If (Gender=="Female"){
		CheckedMale = 
		CheckedFemale = Checked
	}

Gui, GuiUserData:Add, GroupBox, x5 y5 w400 h173 c0a0a40, (Личные данные)

Gui, GuiUserData:Add, DropDownList, xp+5 yp+17 w100 r3 h100 vEditCity, % CitySort
Gui, GuiUserData:Add, Text, xp+105 yp+2 h15, город

Gui, GuiUserData:Add, Edit, xp-105 y+15 w100 h20 vEditSurName, % SurNameSort
Gui, GuiUserData:Add, Text, xp+105 yp+2 h15, фамилия
Gui, GuiUserData:Add, Edit, xp-105 y+5 w100 h20 vEditName, % NameSort
Gui, GuiUserData:Add, Text, xp+105 yp+2 h15, имя
Gui, GuiUserData:Add, Edit, xp-105 y+5 w100 h20 vEditSecondName, % SecondNameSort
Gui, GuiUserData:Add, Text, xp+105 yp+2 h15, отчество

Gui, GuiUserData:Add, Edit, x200 y22 w100 h20 vEditLogo, % LogoSort
Gui, GuiUserData:Add, Text, xp+105 yp+2 h15, гравировка (часы)

Gui, GuiUserData:Add, ComboBox, xp-105 y+15 w100 r4 h20 vEditIdNumber, % IdNumberSort
GUIControl, +Limit6, EditIdNumber
Gui, GuiUserData:Add, Text, xp+105 yp+2 h15, удостоверение
Gui, GuiUserData:Add, Edit, xp-105 y+5 w100 h20 vEditPost, % PostSort
Gui, GuiUserData:Add, Text, xp+105 yp+2 h15, отделение
Gui, GuiUserData:Add, DropDownList, xp-105 y+5 w100 r10 h20 vEditRank, % RankSort
Gui, GuiUserData:Add, Text, xp+105 yp+2 h15, должность
Gui, GuiUserData:Add, DropDownList, xp-105 y+15 w100 r17 h20 vEditRankMES, % RankMESSort
Gui, GuiUserData:Add, Text, xp+105 yp+2 h15, должность (МЧС)
Gui, GuiUserData:Add, Radio, xp-290 y+9 h15 Group %CheckedMale% vRadioMale,  мужской
Gui, GuiUserData:Add, Radio, xp+190 yp+0 h15 %CheckedFemale% vRadioFemale, женский

Gui, GuiUserData:Add, Button, xp-20 yp+28 w70 h25 gButtonClearGuiUserData, Очистить
Gui, GuiUserData:Add, Button, x+0 yp+0 w75 h25 gButtonSaveGuiUserData, Сохранить
Gui, GuiUserData:Add, Button, x+0 yp+0 w55 h25 gButtonDiscardGuiUserData, Меню

Gui, GuiUserData:Menu
Gui, GuiUserData:Show, h217 w410, Изменение данных  
Return

	ButtonClearGuiUserData:
	MsgBox, 36, Вопрос, Вы действительно хотите очистить данные?`n(если вы нажмете на "да", то все удалиться)
		IfMsgBox, Yes
		{
			FileDelete, %FilePath%
			Gui, GuiUserData:Submit, NoHide
			GuiControl, Text, EditIdNumber
			GuiControl, Text, EditSurName
			GuiControl, Text, EditName
			GuiControl, Text, EditSecondName
			GuiControl, Text, EditPost
			GuiControl, Text, EditLogo
			GuiControl, Text, EditRankMES
			GuiControl, Choose, EditRank, 0
			GuiControl, Text, Gender, -1
			GuiControl, Choose, EditCity, 0
		}
		IfMsgBox, No
		{
			Return
		}
	Return

	ButtonSaveGuiUserData:
	Gui, GuiUserData:Submit, NoHide
	If (RadioMale=="1"){
		Gender = Male
	}
	Else If (RadioFemale=="1"){
		Gender = Female
	}
	
IniWrite %Gender%, %FilePath%, %DataGroup%, Gender
IniWrite %EditCity%, %FilePath%, %DataGroup%, City
IniWrite %EditIdNumber%, %FilePath%, %DataGroup%, IdNumber
IniWrite %EditSurName%, %FilePath%, %DataGroup%, SurName
IniWrite %EditName%, %FilePath%, %DataGroup%, Name
IniWrite %EditSecondName%, %FilePath%, %DataGroup%, SecondName
IniWrite %EditRank%, %FilePath%, %DataGroup%, Rank
IniWrite %EditPost%, %FilePath%, %DataGroup%, Post
IniWrite %EditLogo%, %FilePath%, %DataGroup%, Logo
IniWrite %EditRankMES%, %FilePath%, %DataGroup%, RankMES

MsgBox, 64, Уведомление, Ваши данные сохранены.
Return

	ButtonDiscardGuiUserData:
	; MsgBox, 16, Ошибка, Функция недоступна, находится в разработке.
	Gui, GuiUserData:Destroy
		Sleep 150
	Gui, GuiMenu:Show
	Return

	GuiUserDataGuiClose:
	{
		MsgBox, 36, Вопрос, Вы дейтвительно хотите закрыть скрипт?
		IfMsgBox, Yes
		{
			ExitApp
		}
		IfMsgBox, No
		{
			Return
		}
	}
	Return
}

VKowner:
Run, https://vk.com/provinceahk
Return

VKhelp:
Run, https://vk.com/sookolin
Return

VKmemo:
Run, https://vk.com/@provinceahk-pamyatkaahk
Return

ReloadMenu:
Reload
Return 

ExitMenu:
ExitApp
Reload

YesUpdate:
Return
