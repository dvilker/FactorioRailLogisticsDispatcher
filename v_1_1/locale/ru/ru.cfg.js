// Common

lang['mod-name.viirld'] = `Диспетчер железнодорожной логистики`
lang['mod-description.viirld'] = `
Добавляет диспетчер (здание) для автоматизации железнодорожной логистики на основе предложения и запросов.

Мод оптимизирован для мультитоварных доставок, обладает интуитивно понятным интерфейсом и издается под свободной лицензией.
`

// Settings (Common)

lang['mod-setting-name.viirld-dispatcherSignalSlotCount'] = `Сигнальных слотов диспетчера`
lang['mod-setting-description.viirld-dispatcherSignalSlotCount'] = `Количество слотов для сигналов в настройках диспетчера. Один слот резервируется для общего режима.`

lang['mod-setting-name.viirld-minEnergyUseTrain'] = `Запас энергии (MJ)`
lang['mod-setting-description.viirld-minEnergyUseTrain'] = `
Минимальное количество заправленной энергии в поезде для его использования в доставках.
Если по окончании доставки или по прибытии в депо в поезде окажется меньше заправленной энергии, чем указано в этой настройке, он будет направлен на заправку или будет ожидать заправки в депо (если отдельных заправок нет).

Задается в мегаджоулях (MJ).
`

lang['mod-setting-name.viirld-fuelScheduleTime'] = `Ожидание на заправке (тик)`
lang['mod-setting-description.viirld-fuelScheduleTime'] = `Время бездействия в расписании заправки (в тиках).`

lang['mod-setting-name.viirld-correctScheduleBeforeProvider'] = `Корректировать до поставщика`
lang['mod-setting-description.viirld-correctScheduleBeforeProvider'] = `Если во время пути поезда к станции снабжения в ней увеличится предложение, то доставка может быть скорректирована в сторону увеличения.`

lang['mod-setting-name.viirld-correctScheduleAndAtProvider'] = `Корректировать на поставщике`
lang['mod-setting-description.viirld-correctScheduleAndAtProvider'] = `
Если во время загрузки поезда на станции снабжения в ней увеличится предложение, то доставка может быть скорректирована в сторону увеличения.

Эта опция работает, только если активна опция "Корректировать до поставщика".
`

lang['mod-setting-name.viirld-countingInsertersContent'] = `Учитывать содержимое манипуляторов`
lang['mod-setting-description.viirld-countingInsertersContent'] = `При подсчете содержимого станций учитывается поступающий сигнал и содержимое поезда. Это иногда приводит к скачкам содержимого во время загрузки или разгрузки, т.к. часть груза какое-то время находится в манипуляторах. Эта опция включает учет содержимого манипуляторов.`

lang['mod-setting-name.viirld-updateTicks'] = `Интервал обновления (тик)`
lang['mod-setting-description.viirld-updateTicks'] = `
Мод обновляет данные по одной грузовой станции за подход. Подходы делаются с интервалом из этой настройки.
Меньше значение — чаще обновление, больше нагрузка на процессор.
`
lang['mod-setting-name.viirld-version'] = `Версия`
