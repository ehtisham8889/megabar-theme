<div id="smoke2u-header-adds">
    <ul class="list-style-none d-flex w-100">
        <li>
            <a href="/Versandinformationen">
                <strong>Versandkostenfrei</strong>&nbsp;in Deutschland ab 49&nbsp;€
            </a>
        </li>
        <li>
            <a href="https://wa.me/4924029791380" target="_blank" rel="noopener">
                <strong>WhatsApp</strong>&nbsp;Support&nbsp;<i class="whatsapp">{include file='snippets/mb_icon.tpl' mbIcon='whatsapp'}</i>
            </a>
        </li>
        <li>
            <strong>Hilfe?</strong>&nbsp;<a href="mailto:support@megabar.de">support@megabar.de</a>
        </li>
    </ul>
</div>
<style>
    #smoke2u-header-adds ul.list-style-none { display: flex !important; }
    #smoke2u-header-adds ul.list-style-none li:not(:first-child) { padding-left: 1.25rem !important; border-left: 1px solid #eaeaea !important; }
    #smoke2u-header-adds li i { margin-left: 6px; }
    #smoke2u-header-adds a { color: inherit; text-decoration: none; }
    #smoke2u-header-adds a:hover { color: #e0231d; }
    /* Megabar: like smoke2u.de, no extra gap and no nowrap, so the items can wrap onto two lines.
       Below 1280px the row was wider than the screen (logo and cart cut off), so use compact spacing there. */
    @media (min-width: 992px) and (max-width: 1279.98px) {
        #smoke2u-header-adds ul.list-style-none li { padding-left: .5rem !important; padding-right: .5rem !important; font-size: .75rem; }
    }
    @media (min-width: 992px) and (max-width: 1099.98px) {
        #smoke2u-header-adds ul.list-style-none li { padding-left: .375rem !important; padding-right: .375rem !important; font-size: .6875rem; }
    }
</style>