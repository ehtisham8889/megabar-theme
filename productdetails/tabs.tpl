{block name='productdetails-tabs-settings' prepend}
    <div class="tab-wrapper">
{/block}
{block name='productdetails-tabs-content' append}
    </div> <!-- <div class="tab-wrapper"> closing --> 
{/block}


{block name='productdetails-tabs-tab-description'}
    {tab title="{lang key='description' section='productDetails'}" active=$setActiveClass.description id="description"|cat:$quickViewIdPostfix}
        {row}
            {block name='productdetails-tabs-tab-content'}
                {block name='tab-description-media-types'}
                    {col cols=12 md=12 lg=7}
                        {opcMountPoint id='opc_before_desc'}

                        <div class="desc">
                            <p>{$Artikel->cBeschreibung}</p>
                            {if $useDescriptionWithMediaGroup}
                                {foreach $Artikel->getMediaTypes() as $mediaType}
                                    <div class="h3">{$mediaType->name}</div>
                                    <div class="media">
                                        {include file='productdetails/mediafile.tpl'}
                                    </div>
                                {/foreach}
                            {/if}
                        </div>
                        {opcMountPoint id='opc_after_desc'}
                    {/col}
                {/block}
                {block name='productdetails-tabs-tab-description-include-attributes'}
                    {col cols=12 md=12 lg=5}
                        {include file='productdetails/attributes.tpl' tplscope='details'
                        showProductWeight=$showProductWeight showShippingWeight=$showShippingWeight
                        dimension=$dimension showAttributesTable=$showAttributesTable}
                    {/col}
                {/block}
            {/block}
        {/row}
    {/tab}
{/block}

{block name='productdetails-tabs-description'}
    {card no-body=true}
        {cardheader id="tab-description-head"|cat:$quickViewIdPostfix
            data=["toggle" => "collapse",
                "target"=>"#tab-description"|cat:$quickViewIdPostfix
            ]
            aria=["expanded" => "{if $setActiveClass.description}true{else}false{/if}",
                "controls" => "tab-description"|cat:$quickViewIdPostfix
            ]
        }
            {lang key='description' section='productDetails'}
        {/cardheader}
        {collapse id="tab-description"|cat:$quickViewIdPostfix
                visible=$setActiveClass.description
            data=["parent"=>"#tabAccordion"|cat:$quickViewIdPostfix]
            aria=["labelledby"=>"tab-description-head"|cat:$quickViewIdPostfix]
        }
            {cardbody}
                {block name='productdetails-tabs-card-description'}
                    {row}
                        {block name='productdetails-tabs-card-description-content'}
                            {col cols=12 md=12 lg=7}
                                {opcMountPoint id='opc_before_desc'}
                                <div class="desc">
                                    {$Artikel->cBeschreibung}
                                    {if $useDescriptionWithMediaGroup}
                                        {if $Artikel->cBeschreibung|strlen > 0}
                                            <hr>
                                        {/if}
                                        {foreach $Artikel->getMediaTypes() as $mediaType}
                                            <div class="media">
                                                {block name='productdetails-tabs-description-include-mediafile'}
                                                    {include file='productdetails/mediafile.tpl'}
                                                {/block}
                                            </div>
                                        {/foreach}
                                    {/if}
                                </div>
                                {opcMountPoint id='opc_after_desc'}
                            {/col}
                        {/block}
                        {block name='productdetails-tabs-card-description-attributes'}
                            {block name='productdetails-tabs-include-attributes'}
                                {col cols=12 md=12 lg=5}
                                    {include file='productdetails/attributes.tpl' tplscope='details'
                                    showProductWeight=$showProductWeight showShippingWeight=$showShippingWeight
                                    dimension=$dimension showAttributesTable=$showAttributesTable}
                                {/col}
                            {/block}
                        {/block}
                    {/row}
                {/block}
            {/cardbody}
        {/collapse}
    {/card}
{/block}