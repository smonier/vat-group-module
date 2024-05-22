window.jahia.i18n.loadNamespaces('vat-group-module');

window.jahia.uiExtender.registry.add('callback', 'vat-group-moduleExample', {
    targets: ['jahiaApp-init:60'],
    callback: function () {
        window.jahia.uiExtender.registry.add('adminRoute', 'vat-group-moduleExample', {
            targets: ['administration-sites:999', 'vat-group-moduleaccordion'],
            label: 'vat-group-module:label.settings.title',
            icon: window.jahia.moonstone.toIconComponent('<svg style="width:24px;height:24px" viewBox="0 0 24 24"><path fill="currentColor" d="M19 6V5A2 2 0 0 0 17 3H15A2 2 0 0 0 13 5V6H11V5A2 2 0 0 0 9 3H7A2 2 0 0 0 5 5V6H3V20H21V6M19 18H5V8H19Z" /></svg>'),
            isSelectable: true,
            requireModuleInstalledOnSite: 'vat-group-module',
            iframeUrl: window.contextJsParameters.contextPath + '/cms/editframe/default/$lang/sites/$site-key.vat-group-module.html.ajax'
        });

        window.jahia.uiExtender.registry.add('action', 'vat-group-moduleExample', {
            buttonIcon: window.jahia.moonstone.toIconComponent('<svg style="width:24px;height:24px" viewBox="0 0 24 24"><path fill="currentColor" d="M19 6V5A2 2 0 0 0 17 3H15A2 2 0 0 0 13 5V6H11V5A2 2 0 0 0 9 3H7A2 2 0 0 0 5 5V6H3V20H21V6M19 18H5V8H19Z" /></svg>'),
            buttonLabel: 'vat-group-module:label.action.title',
            targets: ['contentActions:999'],
            onClick: context => {
                window.open('https://github.com/Jahia/app-shell/blob/master/docs/declare-new-module.md', "_blank");
            }
        });

        window.jahia.uiExtender.registry.add('accordionItem', 'vat-group-moduleApps_Example', window.jahia.uiExtender.registry.get('accordionItem', 'renderDefaultApps'), {
            targets: ['jcontent:998'],
            label: 'vat-group-module:label.appsAccordion.title',
            icon: window.jahia.moonstone.toIconComponent('<svg style="width:24px;height:24px" viewBox="0 0 24 24"><path fill="currentColor" d="M19 6V5A2 2 0 0 0 17 3H15A2 2 0 0 0 13 5V6H11V5A2 2 0 0 0 9 3H7A2 2 0 0 0 5 5V6H3V20H21V6M19 18H5V8H19Z" /></svg>'),
            appsTarget: 'vat-group-moduleaccordion',
            isEnabled: function(siteKey) {
                return siteKey !== 'systemsite'
            },
            requiredSitePermission: 'additionalAccordionAccess'
        });
    }
});
