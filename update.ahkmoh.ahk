SetWorkingDir %A_ScriptDir%
#Include AHKBASE CU.ahk

url_version := "https://github.com/sokolin05/profile.moh/raw/master/version.profile" ; Ссылка на файл проверки обновлений (там указываю версию скрипта)
script_version := 2 ; Версия вашего текущего скрипта.
last_version := JSON.Decode(GetLastVersionSoft(url_version)) ; Получение данных с сервиса проверки обновлений

if(last_version.status = "success") { ; Данные о обновлении успешно получены
	if(script_version < last_version.msg) 
	{ ; Есть новые обновления
		MsgBox, 68, Доступна новая версия скрипта, % "Обнаруженая новая версия программы!`n`nВ новой версии:`n" last_version.site "`n`nТекущая версия: " script_version "`nВы хотите скачать новую версию?" ; Показ диалогового окна с информацией о новой версии.
		IfMsgBox, Yes ; Если нажата кнопка YES выполняем действия ниже;
		{
			;Run % last_version.url ; Запустить ссылку которая указана на сайте для скачивания обновлений.
			URLDownloadToFile,ссылка/testupdate.ahk,testupdate.ahk 
			ExitApp ; Закрыть скрипт
		}
	}
} else if (last_version.status = "error") { ; Ошибка при проверке обновлений
	MsgBox, 16, Ошибка, % "Неудалось проверить наличие обновлений.`n`nКод ошибки: " last_version.code "`nТекст: " last_version.msg "" ; Показ диалогового окна с информацией о ошибке.
}