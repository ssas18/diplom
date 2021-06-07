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
                        <a class="dropdown-item" href="main?filter=ds">ds</a>
                    </div>
                </div>
             <#-- или поиск по категориям вручную <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по категории">-->
                <button type="submit" class="btn btn-primary ml-2">очистка фильтров </button>
            </form>
        </div>
    </div>


    <#include "parts/messageEdit.ftl" />

    <#include "parts/messageList.ftl" />

</@c.page>
