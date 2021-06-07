
<a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    Подать объявление
</a>
<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.text}</#if>" name="text" placeholder="Введите сообщение" />
                <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                </#if>
            </div>
            <div class="form-group">
                <input type="text" class="form-control"
                       value="<#if message??>${message.phone}</#if>" name="phone" placeholder="Телефон">
                <#if phoneError??>
                    <div class="invalid-feedback">
                        ${phoneError}
                    </div>
                </#if>
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
            <div class="form-group">
                <select type="text" class="form-control"  name="tag" placeholder="Тэг">
                        <option disabled>Выберите категорию</option>
                        <option value="Чебурашка">Чебурашка</option>
                        <option value="Шапокляк">Шапокляк</option>
                        <option value="Крыса Лариса">Крыса Лариса</option>
                    </select>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <img src="/images/1576743171_1.jpg" />
                </div>
            </div>

            <select class="image-picker show-html">
                <option data-img-src="https://klike.net/uploads/posts/2019-12/1576743171_1.jpg" data-img-class="first" data-img-alt="Page 1" value="1">  Page 1  </option>
                <option data-img-src="https://klike.net/uploads/posts/2019-12/1576743171_1.jpg" data-img-alt="Page 2" value="2">  Page 2  </option>
                <option data-img-src="https://klike.net/uploads/posts/2019-12/1576743171_1.jpg" data-img-alt="Page 3" value="3">  Page 3  </option>
                <option data-img-src="img/04.png" data-img-alt="Page 4" value="4">  Page 4  </option>
                <option data-img-src="img/05.png" data-img-alt="Page 5" value="5">  Page 5  </option>
                <option data-img-src="img/06.png" data-img-alt="Page 6" value="6">  Page 6  </option>
                <option data-img-src="img/07.png" data-img-alt="Page 7" value="7">  Page 7  </option>
                <option data-img-src="img/08.png" data-img-alt="Page 8" value="8">  Page 8  </option>
                <option data-img-src="img/09.png" data-img-alt="Page 9" value="9">  Page 9  </option>
                <option data-img-src="img/10.png" data-img-alt="Page 10" value="10"> Page 10 </option>
                <option data-img-src="img/11.png" data-img-alt="Page 11" value="11"> Page 11 </option>
                <option data-img-src="img/12.png" data-img-alt="Page 12" data-img-class="last" value="12"> Page 12 </option>
            </select>
        </form>

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

