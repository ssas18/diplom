<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>
<div class="bg-image"
     style="background-image: url('https://hr-tv.ru/local/images/hrtv/ejcharpojmet-vidi-dopustimoj-lzhi-v-rezjume_jpg_1518420178.jpg');
            height: 100vh">


<@c.page>
<h5>Привет,  <div class="navbar-text mr-3"><#if user??>${name}<#else>дорогой гость</#if> !</div> </h5>
<div>Это новейший сервис для поиска услуг и специалистов и социальная сеть в одном приложении !</div>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="d-block w-100" src="https://i.ibb.co/GWp7Phf/1.png" alt="Первый слайд">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src=https://i.ibb.co/v4qTkc6/2.png" alt="Второй слайд">
        </div>
        <div class="carousel-item">
            <img class="d-block w-100" src="https://i.ibb.co/5Y163Sj/3.png" alt="Третий слайд">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

</@c.page>
</div>