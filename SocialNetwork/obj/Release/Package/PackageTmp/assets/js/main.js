var ajaxPage = "ajax.php?rp1=";
var clSet = 0;
var DeviceWT = window.innerWidth;
var DeviceHT = window.innerHeight;
var ScreenWT = screen.width;
var ScreenHT = screen.height;
var isMini = (navigator.userAgent.indexOf("Opera Mini") == -1) ? false : true;
var currOrientation = (window.orientation == 90 || window.orientation == -90) ? "l" : "p";
var v = document.createElement("video");
var component = "";
var slide = false;
var opacity = $("#opacity");
var bodywraper = $("#bodywrapper");
var containtwrapper = $("#containtwrapper");
var sldc = $(".sldc");
var header = $("#header");
var slidenavigation = $("#slidenavigation");
var searchandexplore = $(".searchandexplore");
var logoholder = $(".logoholder");
var searchholder = $(".searchholder");
var searchfield = $(".searchfield");
var ss_lightbox = $("#ss_lightbox");
var searchCloseBtn = ".searchClose,.searchCloseBtn";
var vobj = document.getElementById("md_v_h");
jQuery.support.placeholder = (function() {
    var i = document.createElement("input");
    return "placeholder" in i;
})();
$(document).ready(function() {
    var ckie = readCookie("PHPSESSID");
    $(".popsrch").click(function() {
        var label = $(this).text();
        _gaq.push(["_trackEvent", "PopularSearch", "clicked", label]);
    });
    createCookie("currOrientation", currOrientation, 7);
    $("#menu").on("click", function() {
        if ((slidenavigation.height()) < DeviceHT) {
            slideheight = DeviceHT;
            slidenavigation.height(DeviceHT);
        } else {
            slideheight = (slidenavigation.height());
        }
        if (slide == false) {
            component = "slidemenu";
            opacity.removeClass("_opacs");
            opacity.addClass("_opacm");
            bodywraper.height(slideheight + "px");
            opacity.show();
            sldc.toggleClass("_slide");
            slidenavigation.addClass("display-block");
            slide = true;
            window.scrollTo(0, 0);
        }
    });
    opacity.on("click", function() {
        switch (component) {
            case "slidemenu":
                bodywraper.height("");
                opacity.removeClass("_opacm").hide();
                sldc.toggleClass("_slide");
                slidenavigation.removeClass("display-block");
                slide = false;
                break;
            case "search":
                searchholder.hide();
                searchandexplore.show();
                logoholder.show();
                opacity.removeClass("_opacs").hide();
                break;
            case "screenshotpopup":
                bodywraper.height("");
                ss_lightbox.hide();
                opacity.removeClass("_opacss").hide();
                break;
        }
        component = "";
        opacity.hide();
    });
    $("#searchBtn").on("click", function() {
        component = "search";
        searchandexplore.hide();
        logoholder.hide();
        opacity.addClass("_opacs").show();
        searchholder.show();
        searchfield.focus();
    });
    searchfield.on("keyup", function() {
        searchfield.val($(this).val());
    });
    if (!isMini && ScreenHT >= 480) {
        showTopSearches("close");
        searchfield.on("focus", function() {
            showTopSearches("", this);
        });
        searchfield.bind("input", function() {
            showTopSearches("", this);
        });
        $(searchCloseBtn).on("click", function() {
            $("#tpsch, #displayPS").addClass("display-none");
            $(".searchfield").val("");
            $(searchCloseBtn).hide();
            showTopSearches("close", this);
        });
        $("#psClose").on("click", function() {
            $("#tpsch, #displayPS").addClass("display-none");
        });
    } else {
        $("#tpschnone, #tpsch").removeClass("display-none");
        $("#displayPS").addClass("gt480");
        $("#tpsch").on("click", function() {
            $("#displayPS").toggleClass("display-none");
        });
    }
    $("img.lazy").lazyload({
        skip_invisible: false,
        failure_limit: 10
    });
    if ($("#snf")) {
        var activefilter = "";
        var _snf_list = $("._snf_list");
        var _snfli = $("._snfli");
        _snfli.on("click", "._snflilink", function(event) {
            if (!isMini) {
                event.preventDefault();
            }
            var current = $(this).attr("href");
            if (activefilter == current) {
                $(activefilter).toggle();
                $(this).closest("._snfli").toggleClass("_snfliacive");
            } else {
                _snf_list.hide();
                _snfli.removeClass("_snfliacive");
                $(current).css("display", "block");
                $(this).closest("._snfli").addClass("_snfliacive");
            }
            $("i", this).toggleClass("xicon-fshowmore").toggleClass("xicon-fhidemore");
            var oObj = $("i", this).attr("id") == "snf_sort" ? $("#snf_cat") : $("#snf_sort");
            oObj.addClass("xicon-fshowmore").removeClass("xicon-fhidemore");
            activefilter = current;
        });
    }
    expw = $(".t-exp");
    $(".expeul li").on("click", ".explink", function(e) {
        exploreCategories(this, e);
    });
    exploreSubCategories();
    var crrsl = "";

    function exploreSubCategories() {
        $(".expsublink").on("click", function(e) {
            hasSub = $(this).next(".exp_sscat");
            if (hasSub.length != 0) {
                e.preventDefault();
                $("i", this).toggleClass("bic-up").toggleClass("bic-down");
                if (crrsl && crrsl != this) {
                    $(crrsl).next(".exp_sscat").slideToggle();
                    $("i", crrsl).toggleClass("bic-up").toggleClass("bic-down");
                }
                hasSub.slideToggle();
            }
            crrsl = this;
        });
    }

    function exploreCategories(t, e) {
        if (DeviceWT >= 600 && expw.length) {
            epul = $(t).next().html();
            $("#tabexpv").html(epul);
            var tbli = $("#tabexpv li");
            tbli.show();
            exploreSubCategories();
            $(".exp_subcat").addClass("hide");
            $(".expeul li").removeClass("active");
            $("#tabexpv li.seeallcat").hide();
            $(t).parent().addClass("active");
        } else {
            $(".exp_subcat").removeClass("hide");
            if (isMini) {
                $(t).next().show();
                $("i", t).removeClass("bic-down");
            } else {
                $(t).next().slideToggle();
                $("i", t).toggleClass("bic-up").toggleClass("bic-down");
                e.preventDefault();
            }
            $(t).parent().toggleClass("active");
        }
    }
    $(".seeallcat").on("click", function(e) {
        isMini ? $(this).hide().siblings().show() : $(this).hide().siblings().slideDown("slow");
        if (!isMini) {
            e.preventDefault();
        }
    });
    $("#" + $("#exp").attr("data_val")).click();
    if ($("#more_data_md")) {
        $("#more_data_md").html("<div class='gifloader'><img src='images/nloader.gif' /></div>").load($("#more_data_md").attr("data_url"), function(response, status, xhr) {
            if (status == "success") {
                $(".fblike").off("click").on("click", function(e) {
                    fblike(e, this);
                });
                $("img.lazy").lazyload();
                logImpr();
            }
        });
    }
    var rateVal = 0;
    if ($("#rar_tc")) {
        var loginHref = $("#rar_tc").attr("data_href");
        $("#rar_tc").click(function() {
            if (loginHref) {
                window.location = loginHref;
                return false;
            }
            $("#rar_tc_box").removeClass("display-none").slideDown();
        });
        if (!loginHref) {
            rateVal = $("#rar_tc").attr("data_val");
            if (rateVal == 0) {
                $(".rar_r_hd").click(function() {
                    rateVal = $(this).attr("data_val");
                    $(".rar_r_hd").each(function(index) {
                        $("i", this).removeClass("bic-activestar bic-inactivestar");
                        $(this).attr("data_val") <= rateVal ? $("i", this).addClass("bic-activestar") : $("i", this).addClass("bic-inactivestar");
                    });
                });
            }
        }
        $("#comment_cancel").click(function() {
            if ($("#rar_tc").attr("data_val") == 0) {
                $(".rar_r_hd > i").removeClass("bic-activestar bic-inactivestar").addClass("bic-inactivestar");
            }
            $("#rar_tc_box").slideUp();
        });
        $("#comment_ok").click(function() {
            var com = $.trim($("#comment_txt").val());
            if (com == "") {
                alert("Please enter comment.");
            } else {
                if (rateVal > 0) {
                    var commentUrl = ajaxPage + "&action=updateCommentHtml&rating=" + rateVal + "&fileId=" + $("#comment_data").attr("data_fileid") + "&specialId=" + $("#comment_data").attr("data_specialid") + "&catId=" + $("#comment_data").attr("data_catid") + "&userId=" + $("#comment_data").attr("data_userid") + "&commentTitle=" + $("#comment_data").attr("data_fbtitle");
                    if ($("#comment_data").attr("data_featuredpage") != "") {
                        commentUrl = commentUrl + "&featuredpage=" + $("#comment_data").attr("data_featuredpage");
                    }
                    $.post(commentUrl, {
                        comment: com
                    }, function(data) {
                        $("#comment_txt").val("");
                        $("#rar_tc").attr("data_val", rateVal);
                        $(".rar_r_hd").off("click");
                        var m = /id=\"comment_(.*)\"/;
                        var d = m.exec(data);
                        var userid = d ? d[1] : 0;
                        if (userid > 0) {
                            $("#comment_" + userid).remove();
                            $("#noComment").remove("");
                            if (isMini) {
                                $("#rar_tc_box").hide();
                                $(data).prependTo("#comment_box");
                            } else {
                                $("#rar_tc_box").slideUp("slow", function() {
                                    $(data).hide().prependTo("#comment_box").slideDown("slow");
                                });
                            }
                        }
                    });
                }
            }
        });
    }
    if (!$.support.placeholder) {
        var placeSel = $("input[placeholder], textarea[placeholder]");
        placeSel.each(function() {
            if ($(this).val() == "") {
                $(this).val($(this).attr("placeholder"));
            }
        });
        placeSel.focus(function() {
            if ($(this).val() == $(this).attr("placeholder")) {
                $(this).val("");
            }
        }).blur(function() {
            if ($(this).val() == "") {
                $(this).val($(this).attr("placeholder"));
            }
        });
    }
    $(".fblike").off("click").on("click", function(e) {
        fblike(e, this);
    });
	/*
    if (!clSet) {
        var vf = "";
        if (v.canPlayType) {
            if (!!(v.canPlayType('video/mp4; codecs="mp4v.20.8"').replace(/no/, ""))) {
                vf += "mp4,";
            }
            if (!!(v.canPlayType('video/mp4; codecs="avc1.42E01E, mp4a.40.2"').replace(/no/, ""))) {
                vf += "h264,";
            }
            if (!!(v.canPlayType('video/ogg; codecs="theora"').replace(/no/, ""))) {
                vf += "ogg,";
            }
            if (!!(v.canPlayType('video/webm; codecs="vp8, vorbis"').replace(/no/, ""))) {
                vf += "webm,";
            }
        }
        var b = ajaxPage + "&action=cinfo&wth=" + DeviceWT + "&hth=" + DeviceHT + "&swth=" + ScreenWT + "&shth=" + ScreenHT + "&vf=" + vf;
        $.get(b);
    }
    if (cpi != 4) {
        logImpr();
    }
	*/
    var dacc = 1,
        vpt;
    $(".md_v_ss").click(function(e) {
        if ($("#md_y_p").length) {
            $(".md_v_ss").hide();
            $("#loadericon").hide();
            $(".md_v_cont").css({
                "margin-top": 0
            }).show();
            $("#md_y_p").show();
            var imgObj = new Image();
            imgObj.src = $("#md_y_p").attr("data_val");
            return true;
        }
        if (!!(v.canPlayType("video/mp4").replace(/no/, ""))) {
            if (dacc) {
                vobj.play();
                vpt = setTimeout(function() {
                    playVideo(vobj, "slow");
                }, 30000);
                $("#playicon").hide();
                $(".md_v_ss").css("background-color", "#000");
                $("#loadericon").show();
                $("#md_v_h").on("timeupdate", function(e) {
                    playVideo(vobj, "");
                    clearTimeout(vpt);
                });
                dacc = 0;
                var imgObj = new Image();
                imgObj.src = $("#md_v_h").attr("data_val");
                $("#md_v_h").off("click");
            }
        } else {
            window.location = $("#md_v_h").attr("data_val");
        }
    });
    $("#md_v_h").on("play playing", function(e) {
        if (dacc) {
            dacc = 0;
            var imgObj = new Image();
            imgObj.src = $("#md_v_h").attr("data_val");
        }
    });
    setWidthForSlider();
    screenshot(1);
    element = $("#para")[0];
    if (element) {
        if (element.offsetHeight + 5 < element.scrollHeight) {
            $("#expander").css("display", "block");
        } else {
            $("#expander").css("display", "none");
            $(".expnds").css("height", "auto");
        }
    }
    $(".expander").click(function() {
        $("#para").toggleClass("expnds").toggleClass("expdl");
        $(this).toggleClass("bic-showmore").toggleClass("bic-hidemore");
    });
    $(".comm_expander").click(function() {
        $("ul.md_cmt li:gt(1)").slideToggle();
        $(this).find(".bic").toggleClass("bic-showmore").toggleClass("bic-hidemore");
    });
    $(".form_search").submit(function() {
        if ($.trim($(this).find(".searchfield").val()) == "") {
            alert("Please enter search field.");
            return false;
        }
    });
    $("#fdback_cancel").click(function() {
        var link = $("#fdback_cancel").attr("data_href");
        window.location = link;
        return false;
    });
    $("#fdback_send").click(function() {
        $("#feedbackfrm").submit();
    });
    if ($(".ss_lst").length) {
        var prevClkObj = "";
        $(".vd").on("click", function(e) {
            if (!isMini) {
                var clkObj = $(this).closest(".lst-cnt-h").find(".vd").attr("href");
                if (prevClkObj != clkObj) {
                    e.preventDefault();
                    $(".vd").each(function(i) {
                        if (clkObj != $(this)[0]) {
                            $(this).closest(".lst-cnt-h").find(".ss_lst").slideUp();
                        }
                    });
                    prevClkObj = clkObj;
                    $(".ss_lst").width($(this).closest(".lst-cnt-h").width());
                    $(this).closest(".lst-cnt-h").find(".ss_lst").slideDown();
                }
            }
        });
    }
    var svsr = 1;
    $("#saveSearchFrm").on("submit", function(e) {
        e.preventDefault();
        var email = $("#save_search_val").length ? $("#save_search_val").attr("data_email") : $("#save_search_email").val();
        var search_val = $("#save_search_val").length ? $("#save_search_val").val() : $("#save_search").attr("data_srch");
        $("#saveSearch_msg").html("");
        $("#saveSearch_box").removeClass("display-block").addClass("display-none").slideUp("slow");
        var emailRegExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        if ($.trim(email) == "" || !emailRegExp.test(email) || $.trim(email) == "example@gmail.com") {
            alert("Please enter valid email.");
        } else {
            if ($.trim(search_val) == "") {
                alert("Please enter save search keyword.");
            } else {
                if (svsr) {
                    svsr = 0;
                    $("#save_search").html("Saving...");
                    var catid = $("#save_search").attr("data_catid");
                    var searchSubUrl = ajaxPage + "&action=searchSubscribe&email=" + email + "&search_val=" + search_val + "&catid=" + catid;
                    $.get(searchSubUrl, function(data) {
                        data = JSON.parse(data);
                        $("#saveSearch_box").removeClass("display-none").slideDown("slow");
                        if (data.error) {
                            $("#saveSearch_icon").removeClass("bic-correct").addClass("bic-cross");
                        } else {
                            $("#saveSearch_icon").removeClass("bic-cross").addClass("bic-correct");
                            if ($("#save_search_val").length) {
                                $("#save_search_val").val("");
                                if (data.subscribeid > 0) {
                                    $("#delAll_ss").html("DELETE ALL").removeClass("display-none");
                                    $("#msg").length ? $("#searchsubscribebox ul").addClass("subscul") : "";
                                    $("#msg").remove();
                                    $("#searchsubscribebox ul").append('<li id="searchsubli_' + data.subscribeid + '" class="subscli"><div class="subscwpr"><div class="table"><div class="td">' + search_val + '</div><div class="td align-right"><button class="delsearchsub btn btn-transparent" data_id="' + data.subscribeid + '" data_searchval="' + search_val + '"><i class="bic sic bic-close dlssic"></i></button></div></div></div></li>');
                                }
                            }
                        }
                        $("#saveSearch_msg").html(data.msg);
                        $("#save_search").html("Save");
                        svsr = 1;
                    });
                }
            }
        }
    });
    $("#searchsubscribebox").on("click", ".delsearchsub", function() {
        if (confirm("Are you sure, you want to delete this saved search?")) {
            updateSearchSubscribe("", $(this).attr("data_id"));
        }
    });
    $("#delAll_ss").click(function() {
        if (confirm("Are you sure, you want to delete all saved searches?")) {
            var subscribeids = $("#searchsubscribebox .delsearchsub").map(function() {
                return $(this).attr("data_id");
            }).get().join("~");
            updateSearchSubscribe("all", subscribeids);
            $(this).html("Deleting...");
        }
    });
});

function playVideo(vobj, flg) {
    if (flg == "slow") {
        $("#loadericon").hide();
        $("#slmsg").show();
    } else {
        $(".md_v_ss").hide();
        $(".md_v_cont").css({
            "margin-top": 0
        }).show();
        vobj.controls = true;
        $("#md_v_h").css("height", "auto");
    }
}

function createCookie(name, value, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    } else {
        var expires = "";
    }
    document.cookie = name + "=" + value + expires + "; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(";");
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == " ") {
            c = c.substring(1, c.length);
        }
        if (c.indexOf(nameEQ) == 0) {
            return c.substring(nameEQ.length, c.length);
        }
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name, "", -1);
}

function fblike(e, oThis) {
    var likeUrl = ajaxPage + "&action=likecontent&fileId=" + $(oThis).attr("data_fileid") + "&path=" + $(oThis).attr("data_path") + "&title=" + $(oThis).attr("data_title");
    if ($(oThis).attr("data_featuredpage") != "") {
        likeUrl = likeUrl + "&featuredpage=" + $(oThis).attr("data_featuredpage");
    }
    var pType = $(oThis).attr("data_ptype");
    var st = $(oThis).attr("data_socialtype");
    if (pType) {
        $("i", oThis).removeClass("xicon-likemdv").addClass("xicon-likemdvdisabled");
        var cntObj = $("#mlikes");
    } else {
        if (st) {
            if (st == "gplus") {
                var cntObj = $("span.likes");
            } else {
                $("i", oThis).removeClass("scfb").addClass("scfbd");
                var cntObj = $("span.likes");
            }
        } else {
            $("i", oThis).removeClass("aic-like").addClass("aic-likedisabled");
            var cntObj = $("span.likes", oThis);
        }
    }
    $(".scbblh").removeClass("display-none").addClass("dinl");
    var lVal = parseInt(cntObj.attr("data_val")) + 1;
    if (lVal < 1000) {
        cntObj.html(lVal);
    }
    cntObj.attr("data_val", lVal);
    if (st == "gplus") {
        return true;
    } else {
        $(oThis).off("click").removeAttr("href");
        $.get(likeUrl);
    }
    if (!isMini) {
        e.preventDefault();
    }
}

function showTopSearches(action, t) {
    var v = $(t).val() || $(t).prev(".sch_inp_wp").find(".searchfield").val();
    if ($.trim(v) == "") {
        $(".searchClose").hide();
    } else {
        $(".searchClose").show();
    }
    if (action != "close") {
        $("#tpsch, #displayPS").removeClass("display-none");
    } else {
        $("#tpsch, #displayPS").addClass("display-none");
        if (action != "close") {
            $(".searchClose").show();
        }
    }
}
$(window).on("orientationchange", function(e) {
    setTimeout(oc, 500);
    logImpr();
});

function oc() {
    ScreenWT = screen.width;
    ScreenHT = screen.height;
    DeviceWT = window.innerWidth;
    DeviceHT = window.innerHeight;
    if ((ScreenWT > 1023 || DeviceWT > 1023) && component == "slidemenu") {
        $("#opacity").trigger("click");
    }
    if ($("#ss_lightbox").css("display") == "block") {
        $("#ss_lightbox").height(ScreenHT - 48);
        $(".imagecontainer").height(ScreenHT - 100);
        $("#bodywrapper").height(ScreenHT);
    }
    $("#tabexpv").html("");
    $("#" + $("#exp").attr("data_val")).click();
    setWidthForSlider();
    slideSS(0);
    c = 1;
    screenshot(0);
    getImage($("#img_" + (ss_b)));
    $(".ss_lst").hide();
}
var nfArr = new Array();

function logImpr() {
    if (!isBot) {
        nArr = $(".il_normal").map(function() {
            var fid = $(this).attr("data_val");
            if ($(this).css("display") != "none" && $.inArray(fid, nfArr) == "-1") {
                return $(this).attr("data_val");
            }
        }).get();
        fArr = $(".il_featured").map(function() {
            var fid = $(this).attr("data_val");
            if ($(this).css("display") != "none" && $.inArray(fid, nfArr) == "-1") {
                return $(this).attr("data_val");
            }
        }).get();
        if (nArr.length || fArr.length) {
            $.merge($.merge(nfArr, nArr), fArr);
            $.post(ajaxPage, {
                action: "ilog",
                cpi: cpi,
                ids: nArr.join(","),
                fids: fArr.join(",")
            });
        }
    }
}
var c = 1;
var ss_b = 0;
var s = $("#scroller li");

function screenshot(flg) {
    var ss = $("#screenshotslider");
    if (typeof ss == "object") {
        $(".ssctr").css("line-height", ss.height() + "px");
        var sshotW = s.width();
        var sshotH = $("#scroller li").height();
        sshotW = sshotW == 0 ? 110 : sshotW;
        sshotW = parseInt(sshotW) + 10;
        $("#scroller").width("2000px");
        ss_lightbox.height(DeviceHT - 48);
        $(".imagecontainer").height(DeviceHT - 100);
        $("#ssprev").hide();
        var margin = 0;
        ss_lb_img = $(".md_s_ss li img");
        if (DeviceWT >= 320 && !isMini) {
            ss_lb_img.on("click", function() {
                component = "screenshotpopup";
                ss_b = $(this).data("id");
                getImage(this);
                ss_lightbox.show();
                bodywraper.height(DeviceHT);
                opacity.addClass("_opacss").show();
                getControlls();
            });
        }
        if (flg) {
            $("#ss_close").on("click", function() {
                opacity.trigger("click");
            });
            $("#ss_next").on("click", function() {
                if ((ss_b < (s.length - 1)) && ss_b < s.length) {
                    ss_b++;
                    getImage($("#img_" + (ss_b)));
                    getControlls();
                }
            });
            $("#ss_prev").on("click", function() {
                if (ss_b != 0 && ss_b <= s.length) {
                    ss_b--;
                    getImage($("#img_" + (ss_b)));
                    getControlls();
                }
            });
            $("#ssnext").on("click", function() {
                if (c == s.length) {
                    c = 0;
                    margin = 0;
                }
                if (c < s.length) {
                    $("#ssprev").show();
                    sshotW = parseInt($("#img_" + c).width()) + 8;
                    margin = (sshotW * c);
                    c++;
                    slideSS(margin);
                }
                if (c == 1) {
                    $("#ssprev").hide();
                }
            });
            $("#ssprev").on("click", function() {
                if (c != 1 && c <= s.length) {
                    $(this).show();
                    margin = (margin - sshotW);
                    c--;
                    slideSS(margin);
                }
                if (c == 1) {
                    $("#ssprev").hide();
                }
            });
        }
    }
}

function slideSS(margin) {
    if (isMini) {
        $("#scroller").css("marginLeft", ("-" + margin + "px"));
    } else {
        $("#scroller").animate({
            marginLeft: "-" + margin
        });
    }
}

function getImage(s) {
    $("#imageholder").html('<img src="' + $(s).data("orgimg") + '" >');
    $("#imageholder > img").load(function() {
        if ($("#imageholder > img").height() > (DeviceHT - 100)) {
            $("#imageholder > img").height(DeviceHT - 100);
        }
    });
}

function getControlls() {
    (ss_b < s.length && (ss_b != s.length - 1)) ? $("#ss_next").show(): $("#ss_next").hide();
    (ss_b != 0 && ss_b <= s.length) ? $("#ss_prev").show(): $("#ss_prev").hide();
}

function setWidthForSlider() {
    var setwidth = DeviceWT;
    if (isMini) {
        setwidth = DeviceWT - ((DeviceWT > 319) ? 100 : 20);
    }
    $(".md_s_ss_h").width(setwidth);
    var totSsImgWidth = 0;
    for (var i = 0; i < s.length; i++) {
        totSsImgWidth += parseInt($("#img_" + i).width()) + 8;
    }
    var mw = 0;
    if ($(".catmdscreenshot").length) {
        mw = 130;
    } else {
        if ($("#slidenavigation").css("position") == "fixed") {
            mw = $("#slidenavigation").width();
        }
    }
    if (totSsImgWidth < (DeviceWT - mw)) {
        $("#ssnext").hide();
    } else {
        $("#ssnext").show();
    }
}

function updateSearchSubscribe(flag, subscribeids) {
    if ($("#save_search_val").length) {
        $("#saveSearch_icon").removeClass("bic-cross").addClass("bic-correct");
        $("#saveSearch_msg").html("");
        $("#saveSearch_box").removeClass("display-block").addClass("display-none").slideUp("slow");
    }
    var updateSearchSubUrl = ajaxPage + "&action=delSearchSubscribe";
    var pdata = "subscribeid=" + subscribeids;
    $.post(updateSearchSubUrl, pdata, function(data) {
        data = JSON.parse(data);
        if (data.error == false) {
            flag == "all" ? delass(flag) : $("#searchsubli_" + subscribeids).slideUp("slow", function() {
                $(this).remove();
                delass(flag);
            });
        }
    });
}

function delass(flag) {
    if ($("#searchsubscribebox li").length == 0 || flag == "all") {
        $("#delAll_ss").addClass("display-none");
        $("#searchsubscribebox ul").removeClass("subscul").html("").append('<li id="msg">Subscriptions deleted successfully.</li>');
    }
}

function trackVideoUpload(action, label) {
    label = label || "";
    _gaq.push(["_trackEvent", "Upload Videos", action, label]);
}

function madBanner(flg, hf) {
    $.get(ajaxPage + "&action=madBanner&flg=" + flg, function() {
        $("._mad").fadeOut(1000);
        if (hf) {
            window.location = hf;
        }
    });
}