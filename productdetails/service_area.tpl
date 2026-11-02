<ul class="product_services_area p-0" itemprop="description">
    <li class="ps_items lieferung">
        <span class="ps-icon">
            <img src="{$ShopURL}/{$currentThemeDir}gfx/uhr.svg" width="20" height="20" class="" alt=""/>
        </span>
        <span class="ps_text">
            {lang key="detailsServices1" section="custom"}
        </span>
    </li>
    <li class="ps_items kostenlose-lieferung">
        <span class="ps-icon">
            <img src="{$ShopURL}/{$currentThemeDir}gfx/versand.svg" width="20" height="11" class="" alt=""/>
        </span>
        <span class="ps_text">
            {lang key="detailsServices2" section="custom"}								
        </span>
    </li>
    {assign var="ab" value="ab 18 jahre"}
    {if true}
    <li class="ps_items ab18">
        <span class="ps-icon">
             <img src="{$ShopURL}/{$currentThemeDir}gfx/18.svg" width="20" height="18" class="" alt="18+"/>
        </span>
        <span class="ps_text"> 
            {lang key="detailsServices3" section="custom"}								
        </span>
    </li>
    {/if}
    <li class="ps_items supportwa">
        <span class="ps-icon">
            <img src="{$ShopURL}/{$currentThemeDir}gfx/whatsapp.svg" width="20" height="19" class="" alt=""/>
        </span>
        <span class="ps_text">
            {lang key="detailsServices4" section="custom"}								
        </span>
    </li>			
</ul>