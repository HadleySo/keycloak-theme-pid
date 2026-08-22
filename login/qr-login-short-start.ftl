<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("doShortCodeLogin")}
    <#elseif section = "header">
        ${msg("doShortCodeLogin")}
    <#elseif section = "form">

        <form id="com-hadleyso-qrcode-short" class="${properties.kcFormClass!}" method="post">
            <p>
                ${msg("doShortCodeInfo")}
            </p>
            <div class="${properties.kcFormGroupClass!}">
                <label for="otp" class="${properties.kcLabelClass!}">
                    ${msg("doShortCode")}
                </label>

                <input
                    id="shortCode"
                    name="shortCode"
                    type="number"
                    class="${properties.kcInputClass!}"
                    inputmode="numeric"
                    pattern="\\d{6}"
                    min="100000"
                    max="999999"
                    autofocus
                    required
                />
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <input
                    class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!}"
                    type="submit"
                    value="${msg('doSubmit')}"
                />
            </div>
        </form>

    </#if>
</@layout.registrationLayout>
