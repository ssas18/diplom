<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <div class="dropdown show">
                    <a class="btn btn-info dropdown-primary" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Фильтр категорий
                    </a>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <a class="dropdown-item" href="main?filter=">очистить фильтрацию</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="main?filter=Работа+по+дому">Работа по дому</a>
                        <a class="dropdown-item" href="main?filter=Ремонт+автомобилей">Ремонт автомобилей</a>
                        <a class="dropdown-item" href="main?filter=Сложные+технические+работы">Сложные технические работы</a>
                        <a class="dropdown-item" href="main?filter=Услуги+токаря">Услуги токаря</a>
                        <a class="dropdown-item" href="main?filter=Другое">Другое</a>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary ml-2">Очистка фильтров </button>
                <div class="card ml-3">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по сообщению">
                </div>
            </form>
        </div>
    </div>


    <#include "parts/messageEdit.ftl" />

    <#include "parts/messageList.ftl" />

</@c.page>
