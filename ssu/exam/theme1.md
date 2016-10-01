Тема 1. Основные понятия БД. Архитектура СБД.
=============================================
* База данных (БД) - набор постоянных данных, которые используются прикладными
системами для какого-либо предприятия.
* Система БД(СБД) - программно-аппаратный комплекс, обеспечивает сохранность,
целостность данных и доступ пользователей к ним.
* Основные составляющие СБД - 
* Три уровня архитектуры (внутренний, внешний, концептуальный) - **внутренний уровень** - наиболее близкий к хранению информации на физических устройствах. Внутренний уровень - собственно данные, расположенные в файлах или в страничных структурах, расположенных на внешних носителях информации.
**Коцептуальнй уровень** - уровень на котором база данных представлена в наиболее общем виде, который объдиняет данные, используемые всеми приложениями, работающими с данной базой данных. Фактически концептуальный уровень отражает обобщённую модель прдметой области (объектов реальногомира), для которой создавалась база данных. Как любая модель, концептуальная модель отражает только существенные, сточки зрения обработки, особенности объектов реального мира.
**Внешний уровень** - самый верхний уровень, где каждое представление имеет своё "видение" данных. Этот уровень определяет точку зрения на БД отдельных приложений. Каждое приложение видит и брабатывает только те данные, которые необходимы именно ему. Например, система распределения работ использует сведения о квалификации сотрудника, но её не интересуют ведения об окладе, домашнем адресе и телефоне сотрудника, и наоборот, именно эти сведения используются в подсистеме отдела
кадров. Трёхуровневая архитектура позволяет обеспечить логическую (между 1 и 2) и физическую (между 2 и 3) независимость при работе с данными. Логическая независимость предполагает возможность изменеения одного приложения без корректировки других приложений, работающих с этой же БД. Физическая независимость предполагает возможность переноса хранимой информации на другой носитель с сохранением работоспособности всех приложений, работающих с этой БД.
* Схемы представления данных - 
* Отображения схем - 
* Язык определения данных (DDL) - 
* Язык манипулирования данными (DML) - 
* Физическое и логическое проектироание БД - 
* Архитектура клиент/сервер - такая архитектура характеризуется наличием двух взаимодействущих самостоятельных процессов - клиента и сервера, которые, в общем случае, могут выполняться на разных компьютерах, обмениваясь данными по сети. Достоинства такой архитектуры очевидны. Сервер баз данных осуществляет свою работу на основе механизма транзакци, который придёт любой совокупности операций, объявленных как транзакция следующие свойства:
- Атомарность
- Независимость
- Устойчивость к сбоям

* Распределённые СБД - 