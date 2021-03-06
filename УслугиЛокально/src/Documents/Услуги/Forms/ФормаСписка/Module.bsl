&НаКлиенте
Процедура РассчитатьИтогЗаГод(Команда)

	РассчитатьИтогЗаГодНаСервере();
КонецПроцедуры

&НаСервере
Процедура РассчитатьИтогЗаГодНаСервере()

	СхемаКомпоновкиДанных = элементы.Список.ПолучитьИсполняемуюСхемуКомпоновкиДанных();
	НастройкиКомпоновкиДанных = Элементы.Список.ПолучитьИсполняемыеНастройкиКомпоновкиДанных();

	КомпоновщикМакета = Новый КомпоновщикМакетаКомпоновкиДанных;
	МакетКомпоновки = КомпоновщикМакета.Выполнить(СхемаКомпоновкиДанных, НастройкиКомпоновкиДанных, , , Тип(
		"ГенераторМакетаКомпоновкиДанныхДляКоллекцииЗначений"));

	ПроцессорКомпоновки = Новый ПроцессорКомпоновкиДанных;
	ПроцессорКомпоновки.Инициализировать(МакетКомпоновки);
	ТаблицаЗначений = Новый ТаблицаЗначений;
	ПроцессорВывода = Новый ПроцессорВыводаРезультатаКомпоновкиДанныхВКоллекциюЗначений;
	ПроцессорВывода.УстановитьОбъект(ТаблицаЗначений);
	ПроцессорВывода.Вывести(ПроцессорКомпоновки);
	ИтоговаяСумма 			= ТаблицаЗначений.Итог("СуммаПлатежей");
	ИтогоЗаСвет 			=  ТаблицаЗначений.Итог("ОплаченоСвет");
	ИтогоЗаГаз 				=  ТаблицаЗначений.Итог("ОплаченоГаз");
	ИтогоИзрасходованоГаза 	=  ТаблицаЗначений.Итог("РазницаГаз");
	ИтогоизрасходованоСвета =  ТаблицаЗначений.Итог("РазницаСвет");
	ИтогоОплаченоЗаГод = ТаблицаЗначений.Итог("СуммаПлатежей");

КонецПроцедуры

&НаСервере
Процедура ПечататьСписокНаСервере(ТабличныйДокумент)
	СхемаКомпоновкиДанных = Элементы.Список.ПолучитьИсполняемуюСхемуКомпоновкиДанных();
	НастройкиКомановкиДанных =  Элементы.Список.ПолучитьИсполняемыеНастройкиКомпоновкиДанных();

	НастройкиКомановкиДанных.ПараметрыВывода.УстановитьЗначениеПараметра("МакетОформления", "Зеленый");
	НастройкиКомановкиДанных.ПараметрыВывода.УстановитьЗначениеПараметра("Заголовок", "Список документов оплаты");
	НастройкиКомановкиДанных.ПараметрыВывода.УстановитьЗначениеПараметра("ВыводитьОтбор",
		ТипВыводаТекстаКомпоновкиДанных.НеВыводить);
	КомпановщикМакета  = Новый КомпоновщикМакетаКомпоновкиДанных;
	МакетКомановки = КомпановщикМакета.Выполнить(СхемаКомпоновкиДанных, НастройкиКомановкиДанных);
	ПроцессорКомпоновкиДанных  = Новый ПроцессорКомпоновкиДанных;
	ПроцессорКомпоновкиДанных.Инициализировать(МакетКомановки);
	ПроцессорВывода = Новый ПроцессорВыводаРезультатаКомпоновкиДанныхВТабличныйДокумент;

	ПроцессорВывода.УстановитьДокумент(ТабличныйДокумент);
	ПроцессорВывода.Вывести(ПроцессорКомпоновкиДанных);
КонецПроцедуры

&НаКлиенте
Процедура ПечататьСписок(Команда)
	ТабличныйДокумент = Новый ТабличныйДокумент;
	ПечататьСписокНаСервере(ТабличныйДокумент);
	ТабличныйДокумент.ОтображатьСетку = Ложь;
	ТабличныйДокумент.ОтображатьЗаголовки = Ложь;
	ТабличныйДокумент.Показать("Заголовок");
КонецПроцедуры