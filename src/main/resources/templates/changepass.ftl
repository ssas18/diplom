<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <form method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">логин:</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="Ваш логин"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder=" новый пароль"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Email:</label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Сохранить</button>
    </form>
</@c.page>