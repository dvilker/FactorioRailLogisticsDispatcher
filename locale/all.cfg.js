lang._languages = ['ru', 'en'] // first is default


// Common

lang['mod-name.viirld'] = {
    ru: `Диспетчер железнодорожной логистики 2(beta)`,
    en: `Rail Logistics Dispatcher 2(beta)`,
}

lang['mod-description.viirld'] = {
    ru: `
        Добавляет диспетчер (здание) для автоматизации железнодорожной логистики на основе станций предложения и запросов.
        
        Обладает интуитивно понятным интерфейсом. Вдохновлен модом LTN, но пошел своим путем.
        `,
    en: `
        Adds a dispatcher (building) to automate railway logistics based on provide and request stations.
        
        Has intuitive interface. Was inspired by LTN but went a different way.
        `,
}

// Settings (Common)

lang['mod-setting-name.viirld-minEnergyUseTrainMJ'] = {
    ru: `Запас энергии (МДж)`,
    en: `Minimum train energy (MJ)`,
}
lang['mod-setting-description.viirld-minEnergyUseTrainMJ'] = {
    ru: `
        Минимальное количество заправленной энергии в поезде для его использования в доставках.
        Поезд, у которого запас энергии меньше указанного не будет использоваться для доставок, будет оставаться в депо.
        Задается в мегаджоулях (МДж).
        
        Для примера: 100 МДж = 25 угля.
        `,
    en: `
        The minimum amount of charged energy in a train to be used in deliveries.
        A train with an energy reserve less than specified will not be used for deliveries; it will remain at the depot.
        Specified in megajoules (MJ).
        
        For example: 100 MJ = 25 coal.
        `,
}
lang['mod-setting-name.viirld-correctScheduleAtProvider'] = {
    ru: `Корректировать доставки`,
    en: `Adjust deliveries`,
}
lang['mod-setting-description.viirld-correctScheduleAtProvider'] = {
    ru: `По прибытии на станцию снабжения доставка может быть скорректирована с учетом изменения предложения и запроса, пока поезд ехал до станции.`,
    en: `Upon arriving at the supply station, the delivery can be adjusted based on changes in supply and request that occurred while the train was en route to the station.`
}
lang['mod-setting-name.viirld-countingInsertersContent'] = {
    ru: `Учитывать содержимое манипуляторов`,
    en: `Consider contents of inserters`,
}
lang['mod-setting-description.viirld-countingInsertersContent'] = {
    ru: `
        При подсчете содержимого станций учитывается поступающий сигнал и содержимое поезда.
        Это иногда приводит к скачкам содержимого во время загрузки или разгрузки, т.к. часть груза какое-то время находится в манипуляторах.
        Эта опция включает учет содержимого манипуляторов.
        `,
    en: `
        When calculating the contents of stations, the incoming signal and the contents of the train are taken into account.
        This sometimes results in content jumps during load or unload, because part of the cargo is in the inserters for some time.
        This option enables inserters content accounting.`,
}
lang['mod-setting-name.viirld-updateTicks'] = {
    ru: `Интервал обновления (тик)`,
    en: `Update interval (tick)`,
}
lang['mod-setting-description.viirld-updateTicks'] = {
    ru: `
        Обновление станции — это переучет ее содержимого, настроек, запроса и предложения.
         
        Меньше значение — чаще обновление, больше нагрузка на процессор.
        
        Обратите внимание, что каждая станция обновляется не чаще чем раз в 60 тиков.
        `,
    en: `
        Update station — it's a recount of its contents, settings, request, and supply.
        
        Lower value — more frequent updates, more load on the CPU.
        
        Note that each station is updated no more than once every 60 ticks.
        `,
}
lang['mod-setting-name.viirld-debug'] = {
    ru: `Отладка`,
    en: `Debug`,
}
lang['mod-setting-description.viirld-debug'] = {
    ru: `Включает некоторые отладочные сообщения и обозначения.`,
    en: `Enables some debugging messages and indicators.`,
}

// Entities

lang['entity-name.viirld-dispatcher'] = {
    ru: `Диспетчер ЖД логистики`,
    en: `Rail Logistics Dispatcher`,
}
lang['entity-name.viirld-io'] = {
    ru: `Скрытый порт диспетчера`,
    en: `Hidden port of the dispatcher`,
}

lang['entity-description.viirld-dispatcher'] = {
    ru: `
        Задействует расположенную рядом станцию в железнодорожной логистике.
        Подключите ко входу диспетчера сигнал с содержимым станции (что в сундуках или резервуарах) и настройте диспетчер.
        При остановке поезда на выходной порт будет подан сигнал с информацией о доставке.
        `,
    en: `
        A nearby station is activated in rail logistics.
        Connect the signal with the contents of the station to the input port.
        When the train stops, a signal with delivery information will be sent to the output port.
        `
}

// Tech

lang['technology-name.viirld-dispatcher'] = {
    ru: `Диспетчер железнодорожной логистики`,
    en: `Rail Logistics Dispatcher`,
}
lang['technology-description.viirld-dispatcher'] = {
    ru: `Автоматизирует железнодорожную логистику объединяя станции снабжения, станции запроса и поезда (в депо) в единую автоматизированную сеть.`,
    en: `Automates rail logistics by combining supply stations, request stations and trains into a single automated network.`
}

// Virtual signals

lang['virtual-signal-name.viirld-delivery'] = {
    ru: `Номер доставки`,
    en: `Delivery ID`,
}
lang['virtual-signal-description.viirld-delivery'] = {
    ru: () => `
        С помощью этого номера ${lang['entity-name.viirld-dispatcher'].ru} определяет доставку, которая прибыла к станции.
        Это технический сигнал, изменять его вручную не следует.
        `,
    en: () =>`
        ${lang['entity-name.viirld-dispatcher'].en} determines the delivery, which arrived at the station. 
        This is a technical signal and should not be changed manually.
        `,
}

lang['virtual-signal-name.viirld-delivery-pause'] = {
    ru: `Не создавать доставки`,
    en: `Do not make deliveries`,
}
lang['virtual-signal-description.viirld-delivery-pause'] = {
    ru: () => `
        Получив этот сигнал на вход, ${lang['entity-name.viirld-dispatcher'].ru} приостановит создание доставок на этой станции.
        `,
    en: () => `
        ${lang['entity-name.viirld-dispatcher'].en} stops making deliveries when it receives this signal on the input.
        `
}

// Disp Gui

// "[item=passive-provider-chest] Снабжение"
// "[item=requester-chest] Запрос:"
// "Память:"
//
// { "viirld-gui.ANY_ITEM_BY_SIGNALS" }"Груз на основе сигналов:"
// {"viirld-gui.EL_ALLOW_ANY_ITEM_PROVIDE"}"[item=passive-provider-chest] Снабжение"
//
// "[item=requester-chest] Запрос"
// { "viirld-gui.ANY_FLUID_BY_SIGNALS" } "Жидкость на основе сигналов:"
//
// "Выберите предмет или жидкость.",


lang['viirld-gui.EL_ROLLBACK'] = {
    ru: `Откатить`,
    en: `Rollback`,
}
lang['viirld-gui.EL_APPLY'] = {
    ru: `Применить`,
    en: `Apply`,
}
lang['viirld-gui.EL_MODE_OFF'] = {
    ru: `Выключен`,
    en: `Off`,
}
lang['viirld-gui.EL_MODE_OFF-tt'] = {
    ru: `Диспетчер не будет управлять этой станцией.`,
    en: `The dispatcher will not control this station.`,
}
lang['viirld-gui.EL_MODE_ENDPOINT'] = {
    ru: `[item=passive-provider-chest] Снабжение / [item=requester-chest] Запрос`,
    en: `[item=passive-provider-chest] Supply / [item=requester-chest] Request`,
}
lang['viirld-gui.EL_MODE_ENDPOINT-tt'] = {
    ru: `
        В зависимости от настроек и сигналов, станция станет участником заданий на доставку.
        
        Для каждого вида груза (твердого или жидкого) можно включить режим Запроса или Снабжения.
        
        Также можно настроить общий режим [virtual-signal=signal-anything] — запрос (<0) и предложение (>0) будет браться с сигнала на входном порту диспетчера.
        
        Когда в сети появятся две станции с аналогичным запросом и снабжением — создается доставка, при наличии подходящего поезда.
        `,
    en: `
        Depending on the settings and material signals, the station becomes a participant in delivery tasks.
        
        For each type of cargo (solid or liquid), you can enable the Request or Supply mode.
        
        Also may be configured the general mode [virtual-signal=signal-anything] - the request (<0) and offer (>0) will be taken from the signal on the dispatcher's input port.
        
        When two stations with a similar request and supply appear in the network, a delivery is created if there is a suitable train available.
    `,
}
lang['viirld-gui.EL_MODE_LIQUIDATION'] = {
    ru: `[item=active-provider-chest] Ликвидация`,
    en: `[item=active-provider-chest] Liquidation`,
}
lang['viirld-gui.EL_MODE_LIQUIDATION-tt'] = {
    ru: () => `
        Похож на режим «${lang['viirld-gui.EL_MODE_ENDPOINT'].ru}», со следующими изменениями:
        - Запрос на этой станции отключается;
        - Приоритет снабжения этой станции становится максимальным;
        - При запросе груза этой станции на других станциях будет игнорироваться минимум.   
        
        Режим полезен для того чтобы вывести остатки груза со станции, готовящейся к демонтажу.
        `,
    en: () => `
        Similar to the «${lang['viirld-gui.EL_MODE_ENDPOINT'].en}» mode, but with the following changes:
        - The request on this station is disabled;
        - The priority of the supply is the highest;
        - When requesting cargo from this station on other stations, it will be ignored at the minimum.
        
        Useful for to unload the cargo from the station, ready for destruction.
    `,
}
lang['viirld-gui.EL_MODE_DEPOT'] = {
    ru: `[item=locomotive] Депо`,
    en: `[item=locomotive] Depot`,
}
lang['viirld-gui.EL_MODE_DEPOT-tt'] = {
    ru: `
        В депо поезда ждут заданий на доставку и заправляются.
        
        Поезд всегда следует депо с тем же названием откуда выехал, находя его по названию станции.
        
        Если вы хотите иметь разное депо для разных типов поездов — называйте их по-разному.
        
        Если в депо окажется поезд с маленьким запасом топлива или с грузом в вагонах — он будет стоять и ждать, пока его не заправят и опустошат.
        `,
    en: `
        In the depot, trains wait for delivery tasks and refuel.
        
        A train always goes to the depot with the same name from which it left, finding it by the name of the station.
        
        If you want to have different depots for different types of trains, name them differently.
                
        If a train with a small fuel supply or with cargo in the wagons, it will stand and wait until it is refueled and emptied.
    `,
}
lang['viirld-gui.EL_NETWORK'] = {
    ru: `Сеть:`,
    en: `Net:`,
}

lang['viirld-gui.EL_NETWORK-tt'] = {
    ru: `Вы можете задать сеть этой станции. Например: 1, 2, ...
        
        Каждая сеть изолирована: доставки организуются только в рамках одной сети. Однако поезда общие. 
        `,
    en: `
        You can specify the network of this station. For example: 1, 2, ...
        
        Each network is isolated: deliveries are organized within one network. However, trains are common.
        `,
}
lang['viirld-gui.EL_LEN'] = {
    ru: `Вагонов от–до:`,
    en: `Wagons:`,
}
lang['viirld-gui.EL_LEN-tt'] = {
    ru: `
        Ограничение на длину поезда для данной станции: «от»–«до» — включительно.
        
        Например, если задать «2»–«3», то в доставках с этой станцией будут поезда только с двумя или тремя вагонами, включая локомотивы.
        Какое-то значение можно не указывать: « »–«3» — один, два или три вагона.
        `,
    en: `
        Train length limit for this station: "from"–"to" — inclusive.
        
        For example, if you specify "2"–"3", then deliveries from this station will only have trains with two or three cars, including locomotives.
        You can omit some values: " "–"3" — one, two or three cars.
        `,
}
lang['viirld-gui.EL_STATION_TEMPLATE'] = {
    ru: `Имя станции:`,
    en: `Station name:`,
}
lang['viirld-gui.EL_STATION_TEMPLATE-tt'] = {
    ru: () => `
        Шаблон для автоматического переименовывания станции.
        
        Для режимов «${lang['viirld-gui.EL_MODE_ENDPOINT'].ru}» или «${lang['viirld-gui.EL_MODE_LIQUIDATION'].ru}» в поле можно использовать подстановки:
        - %d – соответствует числу. Будет заменено на какое-либо число так, чтобы имя станции стало уникальным;
        - %s – соответствует любой строке. Будет заменено на «blabla%d» так, чтобы имя станции стало уникальным;
        - %x – будет заменено x-координату станции;
        - %y – будет заменено y-координату станции;
        - %u – будет заменено на уникальный идентификатор станции.
        
        Для «${lang['viirld-gui.EL_MODE_DEPOT'].ru}» подстановок нет.
        
        Обратите внимание, что если название станции уже соответствует шаблону, то переименования не произойдет, например,
        если станция уже называется «[item=iron-plate] Железногорск» (и других станций с таким названием нет), то при шаблоне «[item=iron-plate] %s» переименования в «[item=iron-plate] blabla1» не произойдет.
        
        Примеры:
        - Шаблон «[item=iron-plate] %d» → «[item=iron-plate] 1» или «[item=iron-plate] 2», ...
        - Шаблон «[item=iron-plate] %s» → «[item=iron-plate] blabla1» или «[item=iron-plate] blabla2», ...
        - Шаблон «[item=iron-plate] %xx%y» → «[item=iron-plate] 45x76»
        - Шаблон «[item=iron-plate]» → «[item=iron-plate]1» — нет %d или %s, поэтому число приписано справа
        
        Если пусто — диспетчер не обновляет имя станции.
        `,
    en: () => `
        Template for automatic station renaming.
        
        For the modes «${lang['viirld-gui.EL_MODE_ENDPOINT'].en}» or «${lang['viirld-gui.EL_MODE_LIQUIDATION'].en}» the field can use substitutions:
        - %d – corresponds to a number. Will be replaced with any number so that the station name becomes unique;
        - %s – corresponds to any string. Will be replaced with «blabla%d» so that the station name becomes unique;
        - %x – will be replaced with the x-coordinate of the station;
        - %y – will be replaced with the y-coordinate of the station;
        - %u – will be replaced with a unique station identifier.
        
        For «${lang['viirld-gui.EL_MODE_DEPOT'].en}» there are no substitutions.
        
        Please note that if the station name already matches the template, then the renaming will not occur, for example,
        if the station is already called "[item=iron-plate] Zheleznogorsk" (and there are no other stations with this name), then with the template "[item=iron-plate] %s" the renaming to "[item=iron-plate] blabla1" will not occur.
        
        Examples: 
        - Template "[item=iron-plate] %d" → "[item=iron-plate] 1" or "[item=iron-plate] 2", ...
        - Template "[item=iron-plate] %s" → "[item=iron-plate] blabla1" or "[item=iron-plate] blabla2", ...
        - Template "[item=iron-plate] %xx%y" → "[item=iron-plate] 45x76"
        - Template "[item=iron-plate]" → "[item=iron-plate]1" - there is no %d or %s, so the number is added to the right.
        
        If empty, the dispatcher does not update the station name.
    `,
}
lang['viirld-gui.EL_OUT_MODE_TARGET_CONTENTS'] = {
    ru: `Выводить требуемое содержимое`,
    en: `Output required content`,
}
const outputSignals = {
    ru: `Также на выход подаются сигналы:
        [virtual-signal=signal-P] — При наличии поезда, если это станция снабжения. От слова Provider.
        [virtual-signal=signal-R] — При наличии поезда, если это станция запроса. От слова Requester.
        [virtual-signal=signal-E] — При каких-либо ошибках.
        [virtual-signal=signal-L] — Длина поезда, включая локомотивы.
        [virtual-signal=signal-C] — Число грузовых вагонов.
        [virtual-signal=signal-F] — Число цистерн.
        `,
    en: `eThe following signals are also sent to the output port:
        [virtual-signal=signal-P] — When there is a train, if this is a supply station. From the word Provider.
        [virtual-signal=signal-R] — When there is a train, if this is a request station. From the word Requester.
        [virtual-signal=signal-E] — When there are any errors.
        [virtual-signal=signal-L] — Length of the train, including locomotives.
        [virtual-signal=signal-C] — Number of cargo cars.
        [virtual-signal=signal-F] — Number of tank cars.
    `
}
lang['viirld-gui.EL_OUT_MODE_TARGET_CONTENTS-tt'] = {
    ru: `
        На выходном порту будет отображено требуемое для отправки содержимое поезда.
        
        Например, на станции снабжения будет отражен загружаемый груз. А на станции запроса — пусто — в поезде ничего не должно оставаться.
        
        ${outputSignals.ru}
        `,
        en: `
        The output port will display the contents of the train that are required to be sent.
        
        For example, the supply station will display the cargo being loaded. And the request station will be empty — there should be nothing left in the train.
        
        ${outputSignals.en}
    `,
}
lang['viirld-gui.EL_OUT_MODE_EXCHANGE'] = {
    ru: `Выводить требуемый обмен`,
    en: `Output required exchange`,
}
lang['viirld-gui.EL_OUT_MODE_EXCHANGE-tt'] = {
    ru: () => `
        На выходном порту будет отображен груз, который необходимо погрузить (>0) или выгрузить (<0) для отправки поезда.
        
        Например, на станции снабжения будет отражен загружаемый груз со знаком плюс. А на станции запроса — то же, но со знаком минус.
        
        Обратите внимание, что опция «${lang['viirld-gui.EL_OUT_MODE_NEGATE'].ru}» может изменить знак: погрузить — <0 и выгрузить — >0.

        ${outputSignals.ru}
        `,
    en: () => `
        The output port will display the cargo that needs to be loaded (>0) or unloaded (<0) to send the train.
        
        For example, the supply station will display the loaded cargo with a plus sign. And the request station will display the same, but with a minus sign.
        
        Note that the option "${lang['viirld-gui.EL_OUT_MODE_NEGATE'].en}" can change the sign: load — <0 and unload — >0.
        
        ${outputSignals.en}
        `,
}
lang['viirld-gui.EL_OUT_MODE_NEGATE'] = {
    ru: `Со знаком минус`,
    en: `Negate output`,
}
lang['viirld-gui.EL_OUT_MODE_NEGATE-tt'] = {
    ru: () => `
        Изменит знак на выходном порту.
        
        Для режима «${lang['viirld-gui.EL_OUT_MODE_TARGET_CONTENTS'].ru}» содержимое поезда, требуемое для отправки, будет со знаком минус.
        А для режима «${lang['viirld-gui.EL_OUT_MODE_EXCHANGE'].ru}» знаки поменяются: погрузить — <0 и выгрузить — >0.
        `,
    en: `
        Changes the sign on the output port.
        
        For the "${lang['viirld-gui.EL_OUT_MODE_TARGET_CONTENTS'].en}" mode, the train contents required for sending will be with a minus sign.
        And for the "${lang['viirld-gui.EL_OUT_MODE_EXCHANGE'].en}" mode, the signs will change: load — <0 and unload — >0.
    `,
}
lang['viirld-gui.FLAG_useSignals'] = {
    ru: `Сигнальный режим`,
    en: `Signals mode`,
}
lang['viirld-gui.FLAG_useSignals-tt'] = {
    ru: `Формировать для этой станции расписание на основе сигналов ([virtual-signal=signal-green]). Не забудьте подключить станцию.`,
    en: `Generate a schedule for this station based on signals ([virtual-signal=signal-green]). Don't forget to connect the station.`,
}
lang['viirld-gui.FLAG_useEquals'] = {
    ru: `Равенства в расписании`,
    en: `Equality in the schedule`,
}
lang['viirld-gui.FLAG_useEquals-tt'] = {
    ru: `По умолчанию в расписаниях используется нестрогое сравнение (≥). Эта опция включает строгое сравнение (=). Это может быть полезно для более точных загрузок.`,
    en: `By default, schedules use non-strict comparison (>=). This option enables strict comparison (=). This can be useful for more accurate loads.`,
}
lang['viirld-gui.FLAG_turnInserters'] = {
    ru: `Разворачивать манипуляторы`,
    en: `Turn inserters`,
}
lang['viirld-gui.FLAG_turnInserters-tt'] = {
    ru: `Иногда, при отправке поезда, в манипуляторах что-то может остаться. Эта опция временно развернет манипуляторы с грузом при отправке поезда, чтобы положить предмет обратно в сундук.`,
    en: `Sometimes, when sending a train, something may remain in the inserters. This option will temporarily turn inserters around when sending the train to put the item back in the chest.`,
}
// lang['viirld-gui.FLAG_itemCompounds'] = {
//     ru: `Несколько грузов`,
//     en: ``,
// }
// lang['viirld-gui.FLAG_itemCompounds-tt'] = {
//     ru: `
//         Разрешить провозить несколько видов груза (не жидкостей) в одном поезде.
//
//         Например, если станция А предоставляет [item=iron-plate] и [item=copper-plate], а станция Б их запрашивает, то поезд может повести сразу оба груза одновременно, при условии, что эта опция включена на обеих станциях.
//
//         Данный режим потребует использования логики и фильтров манипуляторов как минимум на станции снабжения.
//         `,
//     en: ``,
// }
// lang['viirld-gui.FLAG_fluidCompounds'] = {
//     ru: `Несколько жидкостей`,
//     en: ``,
// }
// lang['viirld-gui.FLAG_fluidCompounds-tt'] = {
//     ru: `
//         Разрешить провозить несколько видов жидкостей в одном поезде.
//
//         Например, если станция А предоставляет [fluid=water] и [fluid=crude-oil], а станция Б их запрашивает, то поезд может повести сразу обе эти жидкости одновременно, при условии, что эта опция включена на обеих станциях.
//
//         Одновременно можно провозить не больше жидкостей, чем вагонов-цистерн в составе поезда.
//         `,
//     en: ``,
// }
lang['viirld-gui.EL_ITEM_BUTTON-ANY-tt'] = {
    ru: `
        Кнопка настроек на основе сигналов, поступающих на входной порт диспетчера.
        
        Если подавать отрицательный (< 0) грузовой или жидкостный сигнал, то станция будет запрашивать этот ресурс.
        Если положительный (> 0), предлагать.
        Если соответствующие настройки включены.
        `,
    en: `
        Button for settings based on signals coming into the dispatcher input port.
        
        If a negative (< 0) cargo or fluid signal is given, the station will request this resource.
        If positive (> 0), offer.
        If the corresponding settings are enabled.    
    `,
}
lang['viirld-gui.EL_ITEM_BUTTON-tt'] = {
    ru: `
        Выберите предмет или жидкость, а затем задайте параметры запроса или снабжения.
        
        Станция будет запрашивать или предлагать выбранный ресурс в ЖД сети в зависимости от настроек.
        `,
    en: `
        Select an item or fluid, then set the request or supply parameters.
        
        The station will request or offer the selected resource in the railway network depending on the settings.
    `,
}
lang['viirld-gui.EL_ITEM_ALLOW_PROVIDE'] = {
    ru: `[item=passive-provider-chest] Снабжение`,
    en: `[item=passive-provider-chest] Supply`,
}
lang['viirld-gui.EL_ITEM_ALLOW_PROVIDE-tt'] = {
    ru: `
        Станция будет поставлять выбранный ресурс.
        
        Величина снабжения определяется полученным сигналом на входной порт диспетчера.
        Он должен быть подключен к сундукам и/или резервуарам станции.
        `,
    en: `
    The station will supply the selected resource.

    The amount of supply is determined by the signal received at the dispatcher's input port.
    It must be connected to the station's chests and/or tanks.
    `,
}
lang['viirld-gui.EL_ITEM_ALLOW_REQUEST'] = {
    ru: `[item=requester-chest] Запрос:`,
    en: `[item=requester-chest] Request:`,
}
lang['viirld-gui.EL_ITEM_ALLOW_REQUEST-tt'] = {
    ru: `
        Станция будет запрашивать выбранный ресурс.
        
        Величина запроса определяется заданным параметром и сигналом на входном порту диспетчера.
        Он должен быть подключен к сундукам и/или резервуарам станции.
        
        Настройка минимума позволит возить не менее указанного значения за одну доставку.
        `,
    en: `
        The station will request the selected resource.
        
        The request amount is determined by the specified parameter and the signal on the dispatcher input port.
        It must be connected to the chests and/or tanks of the station.
        
        Setting the minimum will allow you to carry no less than the specified value per delivery.
    `,
}
lang['viirld-gui.EL_ITEM_REQUEST-tt'] = {
    ru: () => lang['viirld-gui.EL_ITEM_ALLOW_REQUEST-tt'].ru,
    en: () => lang['viirld-gui.EL_ITEM_ALLOW_REQUEST-tt'].en,
}
lang['viirld-gui.EL_ITEM_MIN'] = {
    ru: `Мин:`,
    en: `Min:`,
}
lang['viirld-gui.EL_ITEM_MIN-tt'] = {
    ru: () => lang['viirld-gui.EL_ITEM_ALLOW_REQUEST-tt'].ru,
    en: () => lang['viirld-gui.EL_ITEM_ALLOW_REQUEST-tt'].en,
}
lang['viirld-gui.ANY_ITEM_BY_SIGNALS'] = {
    ru: `Груз на основе сигналов:`,
    en: `Cargo by signals:`,
}
lang['viirld-gui.EL_ALLOW_ANY_ITEM_PROVIDE'] = {
    ru: `[item=passive-provider-chest] Снабжение`,
    en: `[item=passive-provider-chest] Supply`,
}
lang['viirld-gui.EL_ALLOW_ANY_ITEM_PROVIDE-tt'] = {
    ru: `
        Станция будет снабжать грузом на основе сигнала на входном порту диспетчера.
        Он должен быть больше нуля (>0).
        
        Входной порт должен быть подключен к сундукам станции.
        `,
    en: `
        The station will supply cargo based on the signal on the dispatcher's input port.
        It must be greater than zero (>0).
        
        The input port must be connected to the station's chests.
        `,
}
lang['viirld-gui.EL_ALLOW_ANY_ITEM_REQUEST'] = {
    ru: `[item=requester-chest] Запрос`,
    en: `[item=requester-chest] Request`,
}
lang['viirld-gui.EL_ALLOW_ANY_ITEM_REQUEST-tt'] = {
    ru: `
        Станция будет запрашивать груз на основе сигнала на входном порту диспетчера.
        Для запроса он должен быть меньше нуля (<0).
        
        Входной порт должен быть подключен к сундукам станции.
        
        Настройка минимума (общая для всех грузов) позволит возить не менее указанного значения за одну доставку.
        `,
    en: `
        The station will request cargo based on the signal on the dispatcher's input port.
        It must be less than zero (<0) to request.
        
        The input port must be connected to the station's chests.
        
        The minimum setting (common to all cargo) will allow you to carry at least the specified value per delivery.
        `,
}
lang['viirld-gui.EL_MIN_ANY_ITEM'] = {
    ru: `Мин:`,
    en: `Min:`,
}
lang['viirld-gui.EL_MIN_ANY_ITEM-tt'] = {
    ru: () => lang['viirld-gui.EL_ALLOW_ANY_ITEM_REQUEST-tt'].ru,
    en: () => lang['viirld-gui.EL_ALLOW_ANY_ITEM_REQUEST-tt'].en,
}
lang['viirld-gui.ANY_FLUID_BY_SIGNALS'] = {
    ru: `Жидкость на основе сигналов:`,
    en: `Fluid by signals:`,
}
lang['viirld-gui.EL_ALLOW_ANY_FLUID_PROVIDE'] = {
    ru: `[item=passive-provider-chest] Снабжение`,
    en: `[item=passive-provider-chest] Supply`,
}
lang['viirld-gui.EL_ALLOW_ANY_FLUID_PROVIDE-tt'] = {
    ru: `
        Станция будет снабжать жидкостями на основе сигнала на входном порту диспетчера.
        Он должен быть больше нуля (>0).
        
        Входной порт должен быть подключен к резервуарам станции.
        `,
    en: `
        The station will supply fluids based on the signal on the dispatcher input port.
        It must be greater than zero (>0).
        
        The input port must be connected to the station's tanks.
        `,
}
lang['viirld-gui.EL_ALLOW_ANY_FLUID_REQUEST'] = {
    ru: `[item=requester-chest] Запрос`,
    en: `[item=requester-chest] Request`,
}
lang['viirld-gui.EL_ALLOW_ANY_FLUID_REQUEST-tt'] = {
    ru: `
        Станция будет запрашивать жидкости на основе сигнала на входном порту диспетчера.
        Для запроса он должен быть меньше нуля (<0).
        
        Входной порт должен быть подключен к резервуарам станции.
        
        Настройка минимума (общая для всех жидкостей) позволит возить не менее указанного значения за одну доставку.
        `,
    en: `
        The station will request fluids based on the signal on the dispatcher's input port.
        It must be less than zero (<0) to request.
        
        The input port must be connected to the station's tanks.
        
        The minimum setting (common to all fluids) will allow you to carry at least the specified value per delivery.
        `,
}
lang['viirld-gui.EL_MIN_ANY_FLUID'] = {
    ru: `Мин:`,
    en: `Min:`,
}
lang['viirld-gui.EL_MIN_ANY_FLUID-tt'] = {
    ru: () => lang['viirld-gui.EL_ALLOW_ANY_FLUID_REQUEST-tt'].ru,
    en: () => lang['viirld-gui.EL_ALLOW_ANY_FLUID_REQUEST-tt'].en,
}
lang['viirld-gui.EL_ERR_TABLE-H-ERROR'] = {
    ru: `Ошибка`,
    en: `Error`,
}
lang['viirld-gui.EL_ERR_TABLE-H-TIME'] = {
    ru: `Время`,
    en: `Time`,
}
lang['viirld-gui.EL_IO_TABLE-TITLE'] = {
    ru: `[color=__1__]Запросы−[/color] и [color=__2__]предложения+[/color]`,
    en: `[color=__1__]Requests−[/color] and [color=__2__]supplies+[/color]`,
}
lang['viirld-gui.EL_IO_TABLE-H-ON_STATION'] = {
    ru: `На станции`,
    en: `On station`,
}
lang['viirld-gui.EL_IO_TABLE-H-BALANCE'] = {
    ru: `Баланс`,
    en: `Balance`,
}
lang['viirld-gui.EL_IO_TABLE-H-ON_WAY'] = {
    ru: `В пути`,
    en: `On way`,
}
lang['viirld-gui.EL_DELIVERIES_TABLE-TITLE'] = {
    ru: `Доставки`,
    en: `Deliveries`,
}
lang['viirld-gui.EL_DELIVERIES_TABLE-H-FROM'] = {
    ru: `Точка А`,
    en: `From`,
}
lang['viirld-gui.EL_DELIVERIES_TABLE-H-TO'] = {
    ru: `Точка Б`,
    en: `To`,
}
lang['viirld-gui.EL_DELIVERIES_TABLE-H-TIME'] = {
    ru: `Время`,
    en: `Time`,
}
lang['viirld-gui.EL_DELETE_DELIVERY-tt'] = {
    ru: `
        Удалить доставку.
        
        Делает так, что диспетчер забывает про эту доставку. На поезд не влияет — он, если есть, продолжает следовать по маршруту.
        `,
    en: `
        Delete delivery.
        
        Makes the dispatcher forget about this delivery. Does not affect the train — it, if there is one, continues to follow the route.        
        `,
}
lang['viirld-gui.EL_CARGO_STAT_TABLE-TITLE'] = {
    ru: `Статистика`,
    en: `Statistics`,
}
lang['viirld-gui.EL_STAT_TRAINS'] = {
    ru: `Поездов здесь было: __1__`,
    en: `Trains were here: __1__`,
}
lang['viirld-gui.EL_CARGO_STAT_TABLE-H-COUNT'] = {
    ru: `Доставок`,
    en: `Deliveries`,
}
lang['viirld-gui.EL_CARGO_STAT_TABLE-H-SENT'] = {
    ru: `Отправлено`,
    en: `Sent`,
}
lang['viirld-gui.EL_CARGO_STAT_TABLE-H-RECV'] = {
    ru: `Получено`,
    en: `Recv`,
}
lang['viirld-gui.EL_CARGO_STAT_TABLE-H-LASTTIME'] = {
    ru: `Последняя`,
    en: `Last time`,
}
// lang['viirld-gui.EL_DEPOT_STAT_TABLE-H-trains'] = {
//     ru: `Поездов`,
//     en: `Trains`,
// }
// lang['viirld-gui.EL_DEPOT_STAT_TABLE-H-freeTrains'] = {
//     ru: `Свободно`,
//     en: `Free`,
// }
lang['viirld-gui.WINDOW_TITLE'] = {
    ru: `Диспетчер станции __1__`,
    en: `__1__ station dispatcher`,
}
lang['viirld-gui.WINDOW_TITLE-ghost'] = {
    ru: `Призрак диспетчера станции`,
    en: `Ghost of station dispatcher`,
}
lang['viirld-gui.EL_ITEM_MEM_BUTTON'] = {
    ru: `Память:`,
    en: `Memory:`,
}
lang['viirld-gui.EL_ITEM_MEM_BUTTON-tt'] = {
    ru: () => lang['viirld-gui.mem-item-tt'].ru,
    en: () => lang['viirld-gui.mem-item-tt'].en,
}
lang['viirld-gui.mem-item-tt'] = {
    ru: `
        Слот памяти настроек.
        
        Нажмите левой кнопкой, удерживая Ctrl, Alt или Shift, чтобы сохранить настройки элемента в ячейку.
        Нажмите просто левой кнопкой, чтобы применить сохраненные настройки.
        Нажмите правой кнопкой, чтобы очистить ячейку.
        `,
    en: `
        Left-click while holding Ctrl, Alt or Shift to save the item's settings to a cell.
        Just left-click to apply the saved settings.
        Right-click to clear the cell.
        `,
}
lang['viirld-gui.mem-item-nothing'] = {
    ru: `Отключено и снабжение и запрос`,
    en: `Disabled and supply and request`,
}
lang['viirld-gui.mem-item-provide'] = {
    ru: `[item=passive-provider-chest] Снабжение включено`,
    en: `[item=passive-provider-chest] Supply enabled`,
}
lang['viirld-gui.mem-item-request'] = {
    ru: `[item=requester-chest] Запрос включен: __1__, минимум __2__`,
    en: `[item=requester-chest] Request enabled: __1__, minimum __2__`,
}
lang['viirld-gui.mem-any-item-item'] = {
    ru: `Груз на основе сигналов:`,
    en: `Cargo based on signals:`,
}
lang['viirld-gui.mem-any-item-nothing'] = {
    ru: `    Отключено и снабжение и запрос`,
    en: `    Disabled and supply and request`,
}
lang['viirld-gui.mem-any-item-provide'] = {
    ru: `    [item=passive-provider-chest] Снабжение включено`,
    en: `    [item=passive-provider-chest] Supply enabled`,
}
lang['viirld-gui.mem-any-item-request'] = {
    ru: `    [item=requester-chest] Запрос включен, минимум __1__`,
    en: `    [item=requester-chest] Request enabled, minimum __1__`,
}
lang['viirld-gui.mem-any-item-fluid'] = {
    ru: `Жидкость на основе сигналов:`,
    en: `Fluid based on signals:`,
}
lang['viirld-gui.FLY-SELECT_ITEM_OR_FLUID'] = {
    ru: `Выберите предмет или жидкость.`,
    en: `Select item or fluid.`,
}

// Errors

lang['viirld.ERR-WRONG_SETTINGS'] = {
    ru: `Неправильная настройка диспетчера: __1__`,
    en: `Wrong settings for dispatcher: __1__`,
}

lang['viirld.ERR-DELETED_DELIVERY'] = {
    ru: `Доставка __1__ удалена, поезд может застрять: [train-stop=__2__] → [train-stop=__3__]`,
    en: `Delivery __1__ removed, train may get stuck: [train-stop=__2__] → [train-stop=__3__]`,
}

lang['viirld.ERR--DIRTY'] = {
    ru: `Поезд не пустой`,
    en: `Train is not empty`,
}
lang['viirld.ERR--DIRTY-tt'] = {
    ru: `
        В поезде остался груз или жидкость.
        Поезд не будет использоваться для доставок пока не будет очищен.
        `,
    en: `
        There is still cargo or fluid in the train.
        Train will not be used for deliveries until it will be cleared.
        `,
}

lang['viirld.ERR--NO_FUEL'] = {
    ru: `Поезд не заправлен`,
    en: `Train is not fueled`,
}
lang['viirld.ERR--NO_FUEL-tt'] = {
    ru: `
        В поезде мало топлива (< __1__ МДж, задается в настройках карты).
        Поезд не будет использоваться для доставок пока не будет заправлен.
        `,
    en: `
        The train is low on fuel (< __1__ MJ, set in the map settings).
        The train will not be used for deliveries until it is refueled.
        `,
}

lang['viirld.ERR--NO_CONNECTION'] = {
    ru: `Не присоединен [item=green-wire][item=red-wire]`,
    en: `Not connected [item=green-wire][item=red-wire]`,
}
lang['viirld.ERR--NO_CONNECTION-tt'] = {
    ru: `
        Вход диспетчера не присоединен ([item=green-wire][item=red-wire]) к сундукам или резервуарам станции.
        Диспетчер не будет создавать доставки, пока не будет присоединен.
        `,
    en: `
        The dispatcher input is not connected ([item=green-wire][item=red-wire]) to the station's chests or tanks.
        The dispatcher will not create deliveries until it is connected.
        `,
}

lang['viirld.ERR-TNQ-LIMIT'] = {
    ru: `Лимит станции`,
    en: `Station limit`,
}
lang['viirld.ERR-TNQ-LIMIT-tt'] = {
    ru: `Заполнен или превышен лимит поездов на станции (задается в параметрах станции).`,
    en: `Train limit at the station is full or exceeded (set in the station parameters)`,
}

lang['viirld.ERR-TNQ-QUEUED'] = {
    ru: `В очереди`,
    en: `In queue`,
}
lang['viirld.ERR-TNQ-QUEUED-tt'] = {
    ru: `
        Из-за ограниченного предложения [__1__] станции запроса создают очередь.
        
        Очередь позволяет более справедливо распределять ограниченное предложение.
        
        Текущая очередь: __2__
        `,
    en: `
        Due to limited supply, [__1__] request stations are forming a queue.
        
        The queue allows for a more fair distribution of the limited supply.
        
        Current queue: __2__`,
}
lang['viirld.RQ-no'] = {
    ru: `Нет очереди`,
    en: `No queue`,
}
lang['viirld.RQ-line'] = {
    ru: `^\n__1__. __2__`,
    en: `^\n__1__. __2__`,
}
lang['viirld.RQ-line_me'] = {
    ru: `^\n__1__. __2__ — эта станция`,
    en: `^\n__1__. __2__ — this station`
}

lang['viirld.ERR-NO_PROVIDE'] = {
    ru: `Нет предложения`,
    en: `No supply`,
}
lang['viirld.ERR-NO_PROVIDE-tt'] = {
    ru: `Не удалось найти станцию, предлагающую [__1__].`,
    en: `Could not find station, offering [__1__].`,
}

lang['viirld.ERR-NO_REQUEST'] = {
    ru: `Нет запроса`,
    en: `No request`,
}

lang['viirld.ERR-NEED_CHECK'] = {
    ru: `Проверка`,
    en: `Check`,
}
lang['viirld.ERR-NEED_CHECK-tt'] = {
    ru: `
        Ранее на станции были проблемы с запросом [__1__], но удалось создать доставку.
        
        Необходимо проверить, полностью ли устранены проблемы с запросом с запросом [__1__]. На это уходит немного времени. 
        `,
    en: `
        Previously, the station had problems with the [__1__] request, but was able to create a delivery.
        
        It is necessary to check whether the problems with the [__1__] request have been completely resolved. This takes a little time.
        `,
}


lang['viirld.ERR-NO_TRAIN'] = {
    ru: `Нет поезда`,
    en: `No train`,
}
lang['viirld.ERR-NO_TRAIN-tt'] = {
    ru: `
        Не удалось найти свободный подходящий поезд для доставки [__1__].
        
        Поезд должен иметь длину, удовлетворяющую настройкам станций предложения и запроса. А также иметь соответствующие вагоны, в количестве, удовлетворяющим минимум запроса. 
        `,
    en: `
        Unable to find a free suitable train to deliver [__1__].
        
        The train must have a length that satisfies the settings of the offer and request stations. And also have the appropriate cars, in a quantity that satisfies the minimum request.
        `,
}

lang['viirld.ERR_MSG-TRAIN_ARRIVED_PROVIDER_TWICE'] = {
    ru: `Поезд раннее уже был на станции снабжения: [train-stop=__1__]`,
    en: `Train had already been at the supply station earlier: [train-stop=__1__]`,
}
lang['viirld.ERR_MSG-TRAIN_ARRIVED_REQUESTER_TWICE'] = {
    ru: `Поезд раннее уже был на станции запроса: [train-stop=__1__]`,
    en: `Train had already been at the request station earlier: [train-stop=__1__]`,
}
lang['viirld.ERR_MSG-TRAIN_ARRIVED_REQUESTER_WO_PROVIDER'] = {
    ru: `Поезд прибыл на станцию запроса [train-stop=__1__], но не был на станции снабжения.`,
    en: `Train arrived at the request station [train-stop=__1__], but was not at supply station.`,
}
lang['viirld.ERR_MSG-UNKNOWN_DELIVERY'] = {
    ru: `Неизвестная доставка __1__ на станции [train-stop=__2__].`,
    en: `Unknown delivery __1__ at the station [train-stop=__2__].`,
}
lang['viirld.ERR_MSG-UNEXPECTED_DEPOT'] = {
    ru: `Доставка неожиданно прибыла в депо: [train-stop=__1__].`,
    en: `Unexpected delivery at depot: [train-stop=__1__].`,
}

lang['viirld-units.x1'] = {
    ru: `×1`,
    en: `×1`,
}
lang['viirld-units.x1-tt'] = {
    ru: `Точное количество`,
    en: `Exact amount`,
}
lang['viirld-units.x-stack'] = {
    ru: `×[img=viirld_stack]`,
    en: `×[img=viirld_stack]`,
}
lang['viirld-units.x-stack-tt'] = {
    ru: `Стопок (стеков)`,
    en: `Stacks`,
}
lang['viirld-units.x-stack-str'] = {
    ru: `__1__с`,
    en: `__1__s`,
}
lang['viirld-units.x-cargo-wagon'] = {
    ru: `×[entity=__1__]`,
    en: `×[entity=__1__]`,
}
lang['viirld-units.x-cargo-wagon-tt'] = {
    ru: `Вагон`,
    en: `Wagon`,
}
lang['viirld-units.x-cargo-wagon-str'] = {
    ru: `__1__в`,
    en: `__1__s`,
}
lang['viirld-units.x-fluid-wagon'] = {
    ru: `×[entity=__1__]`,
    en: `×[entity=__1__]`,
}
lang['viirld-units.x-fluid-wagon-tt'] = {
    ru: `Вагон`,
    en: `Wagon`,
}
lang['viirld-units.x-fluid-wagon-str'] = {
    ru: `__1__в`,
    en: `__1__w`,
}
