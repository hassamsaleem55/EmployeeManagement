(function($) {
    "use strict";
        /*-------------------------------
        SLIDER CAROUSEL
        ---------------------------------*/
        $('.home-fade-wrap').owlCarousel({
            items: 1,
            dots: false,
            loop: true,
            nav: true,
            autoplay: true,
            animateOut: 'fadeOut',
            animateIn: 'fadeIn',
            navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]
        });
        /*-------------------------------
        SLIDER EFFECT
        ---------------------------------*/
        $('.home-fade-wrap').on("translate.owl.carousel", function(e) {
            $(".fade-text h1, .fade-text p").removeClass("animated fadeInUp").css("opacity", "0");
            $(".fade-text .btn-filled").removeClass("animated fadeInDown").css("opacity", "0");
        });

        $('.home-fade-wrap').on("translated.owl.carousel", function(e) {
            $(".fade-text h1, .fade-text p").addClass("animated fadeInUp").css("opacity", "1");
            $(".fade-text .btn-filled").addClass("animated fadeInDown").css("opacity", "1");
        });

        /*-------------------------------
        BOOTSTARP SCROLLLSPY
        ---------------------------------*/
        $('body').scrollspy({
                target: '.navbar-collapse',
                offset: 95
            })
            /*-------------------------------
            STICKY NAVIGATION
            ---------------------------------*/
        $(".main-menu-area").sticky({
            topSpacing: 0
        });
        /*-------------------------------
        SMOTH SCROLLING
        ---------------------------------*/
        $('li.smooth-menu a').bind('click', function(event) {
            var $anchor = $(this);
            var headerH = '50';
            $('html,body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top - headerH + "px"
            }, 1200, 'easeInOutExpo');
            event.preventDefault();
        });
        /*-------------------------------
        SCROLL TO TOP
        ---------------------------------*/
        $.scrollUp({
            scrollText: "<i class='fa fa-angle-double-up'></i>",
            animation: 'fade'
        });

        /*-------------------------------
        WOW INIT
        ---------------------------------*/
        new WOW().init();
        /*-------------------------------
        HISTORY CAROUSEL
        ---------------------------------*/
        $('.history-carousel').owlCarousel({
            nav: false,
            items: 1,
            autoplay: true,
            loop: true,
        });
        /*-------------------------------
        CONTACT FORM
        ---------------------------------*/
        $('.field-input').on('focus', function() {
            $(this).parent().addClass('is-focused has-label');
        });
        $('.field-input').on('blur', function() {
            if ($(this).val() == '') {
                $(this).parent().removeClass('has-label');
            }
            $(this).parent().removeClass('is-focused');
        });
        /*-------------------------------
        HOME-5 CAROUSEL
        ---------------------------------*/
        $('.home-5-wrap').owlCarousel({
            loop: true,
            center: true,
            margin: 10,
            nav: true,
            navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
            autoplay: true,
            afterAction: function(el) {
                //remove class active
                this.$owlItems.removeClass('active')
                    //add class active
                this.$owlItems //owl internal $ object containing items
                    .eq(this.currentItem + 1).addClass('active')
            },
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 3,
                }
            },
        });
        
        /*-------------------------------
        HOME-3 CAROUSEL
        ---------------------------------*/
        $('.home-3-wrap').owlCarousel({
            items: 1,
            loop: true,
            autoplay: true,
            animateIn: 'fadeIn',
        });

        /*-------------------------------
        SLIDER EFFECT
        ---------------------------------*/
        $('.home-3-wrap').on("translate.owl.carousel", function(e) {
            $(".home3-item h1").removeClass("animated fadeInLeft").css("opacity", "0");
            $(".home3-item p").removeClass("animated fadeInRight").css("opacity", "0");
            $(".home3-item .btn-filled").removeClass("animated fadeInUpBig").css("opacity", "0");
        });

        $('.home-3-wrap').on("translated.owl.carousel", function(e) {
            $(".home3-item h1").addClass("animated fadeInLeft").css("opacity", "1");
            $(".home3-item p").addClass("animated fadeInRight").css("opacity", "1");
            $(".home3-item .btn-filled").addClass("animated fadeInUpBig").css("opacity", "1");
        });

        /*-------------------------------
        POST THUMB CAROUSEL
        ---------------------------------*/
        $('.post-thumb-carousel').owlCarousel({
            dots: false,
            nav: true,
            items: 1,
            loop: true,
            autoplay: true,
            navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        });
        /*-------------------------------
        REVIEW CAROUSEL
        ---------------------------------*/
        $('.review-content').owlCarousel({
            nav: false,
            items: 1,
            autoplay: true,
            loop: true,
        });
        /*-------------------------------
        BRAND CAROUSEL
        ---------------------------------*/
        $('.brand').owlCarousel({
            loop: true,
            margin: 10,
            autoplay:true,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 3
                },
                1000: {
                    items: 5,
                }
            }
        });
        /*-------------------------------
        MORE POST SINGLE PAGE
        ---------------------------------*/
        $('.m-post-wrap').owlCarousel({
            margin: 5,
            loop: true,
            autoplay: true,
            responsiveClass: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 3,
                    loop: true,
                }
            },
        });
        /*-------------------------------
        MOBILE MENU
        ---------------------------------*/
        $('.mobile-menu nav').meanmenu({
            meanScreenWidth: "981",
            meanMenuContainer: ".mobile-menu"
        });
        /*-------------------------------
        FUN COUNTER
        ---------------------------------*/
        $('.funcounter').counterUp({
            delay: 50,
            time: 3000
        });
        /*-------------------------------
        PARALLAX EFFECT
        ---------------------------------*/
        $('.home-3-area').parallax("40%", 0.3);
        $('.parallux-bg').parallax("40%", -1);
        $('.review-parallax').parallax("50%", .1);
        $('.fun-area').parallax("50%", .1);
        /*-------------------------------
        LIGHTBOX
        ---------------------------------*/
        $("a.mypop").prettyPhoto();

    /*-------------------------------
    FOR MAP
    ---------------------------------*/
    var wWidth = $(window).width();

    var googleMapSelector = $('#google-map'),
        myCenter = new google.maps.LatLng(34.4702107, -97.7547192);

    function initialize() {
        var mapProp = {
            center: myCenter,
            zoom: 10,
            scrollwheel: false,
            mapTypeId: google.maps.MapTypeId.ROADMAP,
            styles: [{
                "featureType": "water",
                "elementType": "geometry",
                "stylers": [{
                    "color": "#e9e9e9"
                }, {
                    "lightness": 17
                }]
            }, {
                "featureType": "landscape",
                "elementType": "geometry",
                "stylers": [{
                    "color": "#f5f5f5"
                }, {
                    "lightness": 20
                }]
            }, {
                "featureType": "road.highway",
                "elementType": "geometry.fill",
                "stylers": [{
                    "color": "#ffffff"
                }, {
                    "lightness": 17
                }]
            }, {
                "featureType": "road.highway",
                "elementType": "geometry.stroke",
                "stylers": [{
                    "color": "#ffffff"
                }, {
                    "lightness": 29
                }, {
                    "weight": 0.2
                }]
            }, {
                "featureType": "road.arterial",
                "elementType": "geometry",
                "stylers": [{
                    "color": "#ffffff"
                }, {
                    "lightness": 18
                }]
            }, {
                "featureType": "road.local",
                "elementType": "geometry",
                "stylers": [{
                    "color": "#ffffff"
                }, {
                    "lightness": 16
                }]
            }, {
                "featureType": "poi",
                "elementType": "geometry",
                "stylers": [{
                    "color": "#f5f5f5"
                }, {
                    "lightness": 21
                }]
            }, {
                "featureType": "poi.park",
                "elementType": "geometry",
                "stylers": [{
                    "color": "#dedede"
                }, {
                    "lightness": 21
                }]
            }, {
                "elementType": "labels.text.stroke",
                "stylers": [{
                    "visibility": "on"
                }, {
                    "color": "#ffffff"
                }, {
                    "lightness": 16
                }]
            }, {
                "elementType": "labels.text.fill",
                "stylers": [{
                    "saturation": 36
                }, {
                    "color": "#333333"
                }, {
                    "lightness": 40
                }]
            }, {
                "elementType": "labels.icon",
                "stylers": [{
                    "visibility": "off"
                }]
            }, {
                "featureType": "transit",
                "elementType": "geometry",
                "stylers": [{
                    "color": "#f2f2f2"
                }, {
                    "lightness": 19
                }]
            }, {
                "featureType": "administrative",
                "elementType": "geometry.fill",
                "stylers": [{
                    "color": "#fefefe"
                }, {
                    "lightness": 20
                }]
            }, {
                "featureType": "administrative",
                "elementType": "geometry.stroke",
                "stylers": [{
                    "color": "#fefefe"
                }, {
                    "lightness": 17
                }, {
                    "weight": 1.2
                }]
            }]
        };
        var map = new google.maps.Map(document.getElementById("google-map"), mapProp);

        var marker = new google.maps.Marker({
            position: myCenter,
        });

        var infowindow = new google.maps.InfoWindow({
            content: "We are here"
        });
        infowindow.open(map, marker);

        marker.setMap(map);
        setTimeout(function() {
            $('.gm-style-iw').parent().addClass('hello');
        }, 1000);
    }
    if (googleMapSelector.length) {
        google.maps.event.addDomListener(window, 'load', initialize);
    }
    jQuery(window).load(function() {
        /*-------------------------------
        NIVO SLIDER
        ---------------------------------*/
        $('#slider').nivoSlider({
            prevText: '<i class="fa fa-angle-left"></i>',
            nextText: '<i class="fa fa-angle-right"></i>',
            controlNav: false,
            pauseTime: 4000,
        });
        $('#preloader-container').fadeOut('slow');
    });
})(window.jQuery);