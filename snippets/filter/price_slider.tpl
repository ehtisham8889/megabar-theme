{* Megabar: overrides only the script block of NOVA snippets/filter/price_slider.tpl.
   Megabar renders the price filter twice on category pages (red filter bar = productlist/filter_dropdowns.tpl,
   and the "Preisspanne" sidebar box). NOVA initialises $('.js-price-range-box'), i.e. ALL boxes, and
   initPriceSlider reads the slider id from the first match, so the filter-bar slider was created twice
   (JS error "noUiSlider: Slider was already initialized") and the sidebar slider never appeared.
   Each include now initialises only its own box. *}
{block name='snippets-filter-price-slider-script'}
    {inline_script}<script>
        $(window).on('load', function() {
            $.evo.initPriceSlider($('#{$id}').closest('.js-price-range-box'), $('#js-price-redirect').val() != 1);
        });
    </script>{/inline_script}
{/block}
