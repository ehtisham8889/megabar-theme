/*
 * Platz für eigenes Javascript
 * Die hier gemachten Änderungen überschreiben ggfs. andere Funktionen, da diese Datei als letzte geladen wird.
 */

function filialTracker(){
    if ($("#main-wrapper > .kk-wide-layout > .kk-hotspot-banner").length) {
        var trackAdd = "?tfb=y"
        $("#main-wrapper > .kk-wide-layout > .kk-hotspot-banner a").each(function(){
            var originalHref = $(this).attr("href");
            var newHref = originalHref+trackAdd;
            $(this).attr("href",newHref);
        })
    }
}

function matchHeightForDrops() {
    if ($(".sale-area").length) {
        $(".sale-banner-right .text-left h5").matchHeight();
    }
}

function filialFrameSetter(){
    var initHeight = $(window).height();
    var initWidth = $(window).width();
    var headerHeight = $("header").height();
    var viewHeight = initHeight-headerHeight;

    if ($("#main-wrapper > .kk-wide-layout > .kk-hotspot-banner").length) {
        $("#main-wrapper > .kk-wide-layout > .kk-hotspot-banner").each(function () {
            console.log("start, initHeight "+initHeight+" initWidth "+initWidth);
            if (initWidth <= 768) {
                console.log("firing it up");

                $(this).css({
                    "height" : viewHeight+"px",
                    "max-height" : viewHeight+"px"
                })
                $(this).find(".kk-hotspot-banner-inner").css({
                    "height" : viewHeight+"px",
                    "max-height" : viewHeight+"px"
                })
            }        
        });
    }
}

function filialScroller() {
    if ($("#main-wrapper > .kk-wide-layout > .kk-hotspot-banner").length) {
        $("#main-wrapper > .kk-wide-layout > .kk-hotspot-banner").each(function () {
            var $banner = $(this);
            var $bannerInner = $banner.find(".kk-hotspot-banner-inner");
            var bannerVP = $banner.width();
            var stageWidth = $bannerInner.width();
            var maxScroll = stageWidth - bannerVP;
            var scrollPaused = false;
            var scrollTimer;

            function scrollBanner(direction) {
                if (scrollPaused) return;

                var targetScroll = direction === "right" ? maxScroll : 0;
                var scrollDuration = Math.abs($banner.scrollLeft() - targetScroll) * 10; // Adjust speed here
                $banner.animate({ scrollLeft: targetScroll }, scrollDuration, "linear", function () {
                    if (!scrollPaused) {
                        setTimeout(function () {
                            scrollBanner(direction === "right" ? "left" : "right");
                        }, 1000); // Pause for 1 second
                    }
                });
            }

            function pauseScrolling() {
                scrollPaused = true;
                $banner.stop(); // Stops the current animation
                clearTimeout(scrollTimer);
                scrollTimer = setTimeout(function () {
                    scrollPaused = false;
                    var currentScroll = $banner.scrollLeft();
                    if (currentScroll >= maxScroll) {
                        scrollBanner("left");
                    } else if (currentScroll <= 0) {
                        scrollBanner("right");
                    } else {
                        scrollBanner(currentScroll > maxScroll / 2 ? "left" : "right");
                    }
                }, 5000); // Pause for 5 seconds on user interaction
            }

            // Start the scrolling
            scrollBanner("right");

            // Add event listeners for interaction
            $banner.on("mousedown touchstart wheel DOMMouseScroll", pauseScrolling);
        });
    }
}

$(document).ready(function(){
    filialScroller();
    filialFrameSetter();
    filialTracker();
    matchHeightForDrops();
	
})

// Megabar: the product description tabs on mobile are <div class="card-header"> toggles with aria-expanded.
// aria-expanded is only valid on an element with a role, so give them role="button" and make them usable
// with the keyboard (Tab to focus, Enter/Space to open), like a real button.
// The leading ; keeps this block separate from the $(document).ready(...) above, which has no semicolon.
;(function (run) {
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', run);
    } else {
        run();
    }
})(function () {
    document.querySelectorAll('.card-header[data-toggle="collapse"][aria-expanded]:not([role])').forEach(function (el) {
        el.setAttribute('role', 'button');
        if (!el.hasAttribute('tabindex')) {
            el.setAttribute('tabindex', '0');
        }
        el.addEventListener('keydown', function (e) {
            if (e.key === 'Enter' || e.key === ' ') {
                e.preventDefault();
                el.click();
            }
        });
    });
});
