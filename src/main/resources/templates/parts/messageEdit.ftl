
<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Подать объявление
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" value="<#if message??>${message.text}</#if>" name="text"
                       class="form-control ${(textError??)?string('is-invalid', '')}"
                       placeholder="Введите сообщение" />
                <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="tel" class="form-control"
                       value="<#if message??>${message.phone}</#if>" name="phone" placeholder="Телефон в формате - 89876543221" pattern="[8]{1}[0-9]{3}[0-9]{3}[0-9]{2}[0-9]{2}">
                <#if phoneError??>
                    <div class="invalid-feedback">
                        ${phoneError}
                    </div>
                </#if>
            </div>

            <div class="form-group">
                <select type="text" class="form-control"  name="tag" placeholder="Тэг">
                        <option disabled>Выберите категорию</option>
                        <option value="Работа по дому">Работа по дому</option>
                        <option value="Ремонт автомобилей">Ремонт автомобилей</option>
                        <option value="Сложные технические работы">Сложные технические работы</option>
                        <option value="Услуги токаря">Услуги токаря</option>
                        <option value="Другое">Другое</option>

                    </select>

            </div>

            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile">
                    <label class="custom-file-label" for="customFile">Выберете картинку</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Сохранить объявление </button>
            </div>
        </form>
    </div>
</div>


<#-- <div class="form-group">
                <input type="text" class="form-control"
                       value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг">
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>-->