<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>


<@c.page>
<h5>Привет,  <div class="navbar-text mr-3"><#if user??>${name}<#else>дорогой гость</#if> !</div> </h5>
<div>Это новейший сервис для поиска услуг и специалистов и социальная сеть в одном приложении !</div>
</@c.page>
