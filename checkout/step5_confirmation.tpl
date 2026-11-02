{block name='checkout-step5-confirmation-order-items'}
    {card no-body=true class='card-gray text-left'}
        {cardheader class="justify-content-between d-flex p-3"}
        <span class="h2">{lang key="basket"}</span>
            {block name='checkout-step5-confirmation-order-items-header'}
                
                {button variant="link"
                    size="sm"
                    href="{get_static_route id='warenkorb.php'}"
                }
                    <span class="checkout-confirmation-change">{lang key='change'}</span>
                    <span class="fa fa-pencil-alt"></span>
                {/button}
            {/block}
        {/cardheader}
        {cardbody}
            {block name='checkout-step5-confirmation-include-inc-order-items'}
                {include file='checkout/inc_order_items.tpl' tplscope='confirmation'}
            {/block}
        {/cardbody}
    {/card}
{/block}