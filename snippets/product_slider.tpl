{block name='snippets-product-slider-other-products'}
    {capture productSliderClass}
        {block name='product-slider-class'}{if $tplscope === 'half'}slider-half{elseif $tplscope === 'push'}slick-type-push{else}product-slider{if $isTablet}-tablet{/if}{/if}{/block}
    {/capture}
    {$style = ''}
    {if !empty($displayCounts)}
        {$style = "--display-count-sm:`$displayCounts[0]`;--display-count-md:`$displayCounts[1]`;
                --display-count-lg:`$displayCounts[2]`;--display-count-xl:`$displayCounts[3]`"}
    {/if}
    {if $tplscope === 'three'}

        {row class="slick-lazy slick-smooth-loading carousel carousel-arrows-inside
                {if $tplscope === 'half'}slick-type-half{else}slick-type-product{if $isTablet}-tablet{/if}{/if}
                {if $productlist|count < 3}slider-no-preview{/if}"
            data=[
                "slick-type" => "slider-type-three{if $isTablet}-tablet{/if}",
                "display-counts" => implode(',', $displayCounts|default:[])
            ]
            style=$style
        }
            {include file='snippets/slider_items.tpl' items=$productlist type='product'}
        {/row}
        {elseif $tplscope === 'push'}

            {row class="slick-lazy slick-smooth-loading carousel carousel-arrows-inside
                    {if $tplscope === 'half'}slick-type-push{else}slick-type-push{/if}
                    {if $productlist|count < 3}slider-no-preview{/if}"
                data=[
                    "slick-type" => "slider-type-push",
                    "display-counts" => implode(',', $displayCounts|default:[])
                ]
                style=$style
            }
                {include file='snippets/slider_items.tpl' items=$productlist type='product'}
        {/row}
        {elseif $tplscope === 'xselltop'}

        {row class="slick-lazy slick-smooth-loading carousel carousel-arrows-inside
                {if $tplscope === 'half'}product-slider-xsell{else}product-slider-xsell{/if}
                {if $productlist|count < 3}slider-no-preview{/if}"
            data=[
                "slick-type" => "product-slider-xsell",
                "display-counts" => implode(',', $displayCounts|default:[])
            ]
            style=$style
        }
            {include file='snippets/slider_items.tpl' items=$productlist type='product'}
        {/row}
    {else}

        {row class="slick-lazy slick-smooth-loading carousel carousel-arrows-inside
            {if $tplscope === 'half'}slick-type-half{else}slick-type-product{if $isTablet}-tablet{/if}{/if}
            {if $productlist|count < 3}slider-no-preview{/if}"
            data=[
            "slick-type" => "product-slider{if $isTablet}-tablet{/if}",
            "display-counts" => implode(',', $displayCounts|default:[])
            ]
            style=$style
            }
            {include file='snippets/slider_items.tpl' items=$productlist type='product'}
        {/row}
    {/if}
{/block}