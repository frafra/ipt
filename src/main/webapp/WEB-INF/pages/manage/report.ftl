<#setting url_escaping_charset="UTF-8">

<h5 class="text-gbif-header fw-400">
    <@s.text name='manage.report.title'/>
</h5>

<p>
    <span class="small">${now?datetime?string.full}</span>
</p>

<#if report??>

    <div<#if report.completed> class="completed"</#if>>

        <#if report.completed>
            <#if !report.hasException() >
                <div class="alert alert-success" role="alert">
                    ${report.state}
                </div>
            <#else>
                <div class="alert alert-danger" role="alert">
                    ${report.state}
                </div>
            </#if>

            <p>
                <@s.text name='manage.report.continueTo'><@s.param>${resource.shortname}</@s.param></@s.text>
            </p>
            <p>
                <@s.text name='portal.publication.download.log'/> <a target="_blank" href="${baseURL}/publicationlog.do?r=${resource.shortname}"><@s.text name='portal.publication.log'/></a>
            </p>
        <#else>
            <p>
                <@s.text name="manage.locked"><@s.param>${baseURL}/manage/cancel.do?id=${resource.shortname}</@s.param></@s.text>
            </p>
            <div class="alert alert-warning" role="alert">
                ${report.state}
            </div>
            <p>
                <a href="cancel.do?r=${resource.shortname}"><@s.text name="button.cancel"/></a> <@s.text name="manage.overview.publishing"/>.
            </p>
        </#if>

        <h6 class="text-gbif-header">
            <@s.text name='manage.report.logMessage'/>
        </h6>
        <ul class="simple">
            <#list report.messages as msg>
                <li class="${msg.level}">${msg.message} <span class="small">${msg.date?time?string}</span></li>
            </#list>
        </ul>

        <#if cfg.debug() && report.hasException()>
            <br/>
            <h6 class="text-gbif-header">
                <@s.text name='manage.report.exception'/>
            </h6>
            <ul class="simple">
                <#list report.exceptionStacktrace as msg>
                    <li>${msg}</li>
                </#list>
            </ul>
        </#if>

    </div>

<#else>
    <h5 class="text-gbif-header fw-400">
        <@s.text name='manage.report.finished'/>
    </h5>
    <p>
        <@s.text name='manage.report.continueTo'><@s.param>${resource.shortname}</@s.param></@s.text>
    </p>
</#if>
