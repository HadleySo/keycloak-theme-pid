<#macro brokers>
    <form id="kc-select-credential-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post" style="display: inline;">
        
        <#list auth.authenticationSelections as authenticationSelection>
            <#if '${authenticationSelection.displayName}' == "ext-qr-code-login-display-name">
                <button class="${properties.kcButtonClass!} button-alt" type="submit" name="authenticationExecution" value="${authenticationSelection.authExecId}" id="ext-qr-code-login" style="justify-content: center;">
                    ${msg('${authenticationSelection.displayName}')}
                </button>
            <#elseif '${authenticationSelection.displayName}' != "auth-username-password-form-display-name" && '${authenticationSelection.displayName}' != "home-idp-discovery-display-name">

                <#if '${authenticationSelection.displayName}' == "webauthn-passwordless-display-name">
                    <#if '${templateName}' != "login.ftl">
                        <button class="${properties.kcButtonClass!} button-alt" type="submit" name="authenticationExecution" value="${authenticationSelection.authExecId}" style="justify-content: center;">
                            ${msg('${authenticationSelection.displayName}')}
                        </button>
                    </#if>
                <#else>
                    <button class="${properties.kcButtonClass!} button-alt" type="submit" name="authenticationExecution" value="${authenticationSelection.authExecId}" style="justify-content: center;">
                        ${msg('${authenticationSelection.displayName}')}
                    </button>
                </#if>

            </#if>
        </#list>

    
    </form>
</#macro>