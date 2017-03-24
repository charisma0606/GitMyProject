<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<meta name="robots" content="index,follow" /> 
<meta content="웹소설" name="author">
<meta content="위디스크, wedisk, 위디, 웹소설 - 성숙한 독자를 위한 어른의 소설 서비스, 다양한 콘텐츠의 프리미엄 채널. 모바일과 웹에서 즐기는 새로운 소설." name="description">
<meta content="위디스크, wedisk, 위디, magnet,download,마그넷,torrnet,토렌토,토렌트,소설,웹툰,만화,코믹,무료,유료,썰소설,Free,novel,Comic,Comix,Manga,야한만화,성인소설,월요소설,화요소설,수요소설,목요소설,금요소설,토요소설,일요소설,공포소설,노출소설,수위소설,섹시한소설,야한만화,야한소설,소설추천,재밌는소설,19금소설" name="keywords">
<meta name="naver-site-verification" content="e3121674cb7b3a13b79fd5ef1120ee138a6292a6"/>
<title>신나는 웹소설</title>
<link rel="stylesheet" type="text/css" href="/test/default.css">
<link rel="stylesheet" type="text/css" href="/test/style.css">
<link rel="stylesheet" type="text/css" href="/test/style2.css">
<link rel="stylesheet" type="text/css" href="/test/style3.css">
<link rel="stylesheet" type="text/css" href="/test/style4.css">
<!--[if lte IE 8]>
<script src="http://www.wenovel.co.kr/js/html5.js"></script>
<![endif]-->
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "http://www.wenovel.co.kr";
var g5_bbs_url   = "http://www.wenovel.co.kr/bbs";
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
</script>
<script src="http://www.wenovel.co.kr/js/jquery-1.8.3.min.js"></script>
<script src="http://www.wenovel.co.kr/js/jquery.menu.js"></script>
<script src="http://www.wenovel.co.kr/js/common.js"></script>
<script src="http://www.wenovel.co.kr/js/wrest.js"></script>

</head>
<body>

<!-- 상단 시작 { -->
<div id="hd">
    <h1 id="hd_h1">신나는 웹소설</h1>

    <div id="skip_to_container"><a href="#container">본문 바로가기</a></div>

    
<!-- 팝업레이어 시작 { -->
<div id="hd_pop">
    <h2>팝업레이어 알림</h2>

<span class="sound_only">팝업레이어 알림이 없습니다.</span></div>

<script>
$(function() {
    $(".hd_pops_reject").click(function() {
        var id = $(this).attr('class').split(' ');
        var ck_name = id[1];
        var exp_time = parseInt(id[2]);
        $("#"+id[1]).css("display", "none");
        set_cookie(ck_name, 1, exp_time, g5_cookie_domain);
    });
    $('.hd_pops_close').click(function() {
        var idb = $(this).attr('class').split(' ');
        $('#'+idb[1]).css('display','none');
    });
    $("#hd").css("z-index", 1000);
});
</script>
<!-- } 팝업레이어 끝 -->
    <div id="hd_wrapper">

        <div id="logo">
            <a href="http://www.wenovel.co.kr"><!--<img src="http://www.wenovel.co.kr/img/logo.jpg" alt="신나는 웹소설">-->신나는 웹소설</a>
        </div>

        <fieldset id="hd_sch">
            <legend>사이트 내 전체검색</legend>
            <form name="fsearchbox" method="get" action="http://www.wenovel.co.kr/bbs/search.php" onsubmit="return fsearchbox_submit(this);">
            <input type="hidden" name="sfl" value="wr_subject||wr_content">
            <input type="hidden" name="sop" value="and">
            <label for="sch_stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
            <input type="text" name="stx" id="sch_stx" maxlength="20">
            <input type="submit" id="sch_submit" value="검색">
            </form>

            <script>
            function fsearchbox_submit(f)
            {
                if (f.stx.value.length < 2) {
                    alert("검색어는 두글자 이상 입력하십시오.");
                    f.stx.select();
                    f.stx.focus();
                    return false;
                }

                // 검색에 많은 부하가 걸리는 경우 이 주석을 제거하세요.
                var cnt = 0;
                for (var i=0; i<f.stx.value.length; i++) {
                    if (f.stx.value.charAt(i) == ' ')
                        cnt++;
                }

                if (cnt > 1) {
                    alert("빠른 검색을 위하여 검색어에 공백은 한개만 입력할 수 있습니다.");
                    f.stx.select();
                    f.stx.focus();
                    return false;
                }

                return true;
            }
            </script>
        </fieldset>

        <div id="text_size">
            <!-- font_resize('엘리먼트id', '제거할 class', '추가할 class'); -->
            <button id="size_down" onclick="font_resize('container', 'ts_up ts_up2', '');"><img src="http://www.wenovel.co.kr/img/ts01.gif" alt="기본"></button>
            <button id="size_def" onclick="font_resize('container', 'ts_up ts_up2', 'ts_up');"><img src="http://www.wenovel.co.kr/img/ts02.gif" alt="크게"></button>
            <button id="size_up" onclick="font_resize('container', 'ts_up ts_up2', 'ts_up2');"><img src="http://www.wenovel.co.kr/img/ts03.gif" alt="더크게"></button>
        </div>

        <ul id="tnb" style="display:none;">
                        <li><a href="http://www.wenovel.co.kr/bbs/register.php">회원가입</a></li>
            <li><a href="http://www.wenovel.co.kr/bbs/login.php"><b>로그인</b></a></li>
                        <li><a href="http://www.wenovel.co.kr/bbs/faq.php">FAQ</a></li>
            <li><a href="http://www.wenovel.co.kr/bbs/qalist.php">1:1문의</a></li>
            <li><a href="http://www.wenovel.co.kr/bbs/current_connect.php">접속자 
1</a></li>
            <li><a href="http://www.wenovel.co.kr/bbs/new.php">새글</a></li>
        </ul>
    </div>

    <hr>

    <nav id="gnb">
        <h2>메인메뉴</h2>
        <ul id="gnb_1dul">
                        <li class="gnb_1dli" style="z-index:999">
                <a href="/bbs/board.php?bo_table=ALL" target="_self" class="gnb_1da">전체</a>
                            </li>
                        <li class="gnb_1dli" style="z-index:998">
                <a href="/bbs/board.php?bo_table=HOT" target="_self" class="gnb_1da">인기</a>
                            </li>
                        <li class="gnb_1dli" style="z-index:997">
                <a href="/bbs/board.php?bo_table=FANTASY" target="_self" class="gnb_1da">판타지</a>
                            </li>
                        <li class="gnb_1dli" style="z-index:996">
                <a href="/bbs/board.php?bo_table=ROMANCE" target="_self" class="gnb_1da">로맨스</a>
                            </li>
                        <li class="gnb_1dli" style="z-index:995">
                <a href="/bbs/board.php?bo_table=SEXSTORY" target="_self" class="gnb_1da">관능</a>
                            </li>
                        <li class="gnb_1dli" style="z-index:994">
                <a href="/bbs/board.php?bo_table=MARTIAL" target="_self" class="gnb_1da">무협</a>
                            </li>
                    </ul>
    </nav>
</div>
<!-- } 상단 끝 -->

<hr>

<!-- 콘텐츠 시작 { -->
<style>
#wrapper {
   
    width: 728px;
}
#hd_wrapper {   
    width: 728px;
}
#gnb_1dul {
   
    width: 728px;
}
#popular div {
    width: 728px;
}
#ft_copy div {
  
    width: 728px;
}
</style>
<div id="wrapper">
    <div id="aside" style="display:none;">
        
<!-- 로그인 전 아웃로그인 시작 { -->
<section id="ol_before" class="ol">
    <h2>회원로그인</h2>
    <form name="foutlogin" action="http://www.wenovel.co.kr/bbs/login_check.php" onsubmit="return fhead_submit(this);" method="post" autocomplete="off">
    <fieldset>
        <input type="hidden" name="url" value="http%3A%2F%2Fwww.wenovel.co.kr%2F">
        <label for="ol_id" id="ol_idlabel">회원아이디<strong class="sound_only">필수</strong></label>
        <input type="text" id="ol_id" name="mb_id" required class="required" maxlength="20">
        <label for="ol_pw" id="ol_pwlabel">비밀번호<strong class="sound_only">필수</strong></label>
        <input type="password" name="mb_password" id="ol_pw" required class="required" maxlength="20">
        <input type="submit" id="ol_submit" value="로그인">
        <div id="ol_svc" style="display:none;">
            <a href="http://www.wenovel.co.kr/bbs/register.php"><b>회원가입</b></a>
            <a href="http://www.wenovel.co.kr/bbs/password_lost.php" id="ol_password_lost">정보찾기</a>
        </div>
        <div id="ol_auto">
            <input type="checkbox" name="auto_login" value="1" id="auto_login">
            <label for="auto_login" id="auto_login_label">자동로그인</label>
        </div>
    </fieldset>
    </form>
</section>

<script>
$omi = $('#ol_id');
$omp = $('#ol_pw');
$omp.css('display','inline-block').css('width',104);
$omi_label = $('#ol_idlabel');
$omi_label.addClass('ol_idlabel');
$omp_label = $('#ol_pwlabel');
$omp_label.addClass('ol_pwlabel');

$(function() {
    $omi.focus(function() {
        $omi_label.css('visibility','hidden');
    });
    $omp.focus(function() {
        $omp_label.css('visibility','hidden');
    });
    $omi.blur(function() {
        $this = $(this);
        if($this.attr('id') == "ol_id" && $this.attr('value') == "") $omi_label.css('visibility','visible');
    });
    $omp.blur(function() {
        $this = $(this);
        if($this.attr('id') == "ol_pw" && $this.attr('value') == "") $omp_label.css('visibility','visible');
    });

    $("#auto_login").click(function(){
        if ($(this).is(":checked")) {
            if(!confirm("자동로그인을 사용하시면 다음부터 회원아이디와 비밀번호를 입력하실 필요가 없습니다.\n\n공공장소에서는 개인정보가 유출될 수 있으니 사용을 자제하여 주십시오.\n\n자동로그인을 사용하시겠습니까?"))
                return false;
        }
    });
});

function fhead_submit(f)
{
    return true;
}
</script>
<!-- } 로그인 전 아웃로그인 끝 -->
            </div>
    <div id="container">
        
<h2 class="sound_only">최신글</h2>
<!-- 최신글 시작 { -->
    <div style="width:350px;float:left;">
        <div class="lat_web2">
    <h2><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=ALL">전체</a></h2>
    <ul>
            <li>
                        <div class="wimg">
                <a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=ALL&amp;wr_id=170"><img src="http://img01.pnstory.kr/files/contents/img/b/2016/01/29/09/1454027912412FE909DD7900.jpg" alt="" width="60" height="80"></a>
            </div>
                        <div class="wcontent" style="margin-left:72px;min-height:80px">
                <p class="s_subject"><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=ALL&amp;wr_id=170">아이러니</a>  </p>
                <p class="s_memo" onclick="location.href='http://www.wenovel.co.kr/bbs/board.php?bo_table=ALL&amp;wr_id=170'">단 한 번의 일탈. 
“당신. 나와 오늘 사고 쳐요.”

그 일탈에 휘말린 남자.
“오늘 당신 상대는 나야. 다른 남자는 안 돼.”

한 번으로 끝날 줄 알았던 인연은
…</p>
                <!--<p class="s_date"><strong><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table="></a></strong></p>-->
            </div>
        </li>
            
   </ul>
</div>
    </div>
    <div style="width:350px;float:left;margin-left:20px">
        <div class="lat_web2">
    <h2><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=FANTASY">판타지</a></h2>
    <ul>
            <li>
                        <div class="wimg">
                <a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=FANTASY&amp;wr_id=43"><img src="http://img01.pnstory.kr/files/contents/img/b/2016/01/29/09/1454027912412FE909DD7900.jpg" alt="" width="60" height="80"></a>
            </div>
                        <div class="wcontent" style="margin-left:72px;min-height:80px">
                <p class="s_subject"><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=FANTASY&amp;wr_id=43">아이러니</a>  </p>
                <p class="s_memo" onclick="location.href='http://www.wenovel.co.kr/bbs/board.php?bo_table=FANTASY&amp;wr_id=43'">단 한 번의 일탈. 
“당신. 나와 오늘 사고 쳐요.”

그 일탈에 휘말린 남자.
“오늘 당신 상대는 나야. 다른 남자는 안 돼.”

한 번으로 끝날 줄 알았던 인연은
…</p>
                <!--<p class="s_date"><strong><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table="></a></strong></p>-->
            </div>
        </li>
            </ul>
            
            
            
            
</div>
    </div>
    <div style="width:350px;float:left;">
        <div class="lat_web2">
    <h2><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=HOT">인기</a></h2>
    <ul>
            <li>
                        <div class="wimg">
                <a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=HOT&amp;wr_id=50"><img src="http://img01.pnstory.kr/files/contents/img/b/2016/01/29/09/1454027912412FE909DD7900.jpg" alt="" width="60" height="80"></a>
            </div>
                        <div class="wcontent" style="margin-left:72px;min-height:80px">
                <p class="s_subject"><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=HOT&amp;wr_id=50">아이러니</a>  </p>
                <p class="s_memo" onclick="location.href='http://www.wenovel.co.kr/bbs/board.php?bo_table=HOT&amp;wr_id=50'">단 한 번의 일탈. 
“당신. 나와 오늘 사고 쳐요.”

그 일탈에 휘말린 남자.
“오늘 당신 상대는 나야. 다른 남자는 안 돼.”

한 번으로 끝날 줄 알았던 인연은
…</p>
                <!--<p class="s_date"><strong><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table="></a></strong></p>-->
            </div>
        </li>
            
            </ul>
</div>
    </div>
    <div style="width:350px;float:left;margin-left:20px">
        <div class="lat_web2">
    <h2><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=MARTIAL">무협</a></h2>
    <ul>
            <li>
                        <div class="wimg">
                <a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=MARTIAL&amp;wr_id=9"><img src="http://img01.pnstory.kr/files/contents/img/b/2016/01/29/09/1454027912412FE909DD7900.jpg" alt="" width="60" height="80"></a>
            </div>
                        <div class="wcontent" style="margin-left:72px;min-height:80px">
                <p class="s_subject"><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=MARTIAL&amp;wr_id=9">아이러니</a>  </p>
                <p class="s_memo" onclick="location.href='http://www.wenovel.co.kr/bbs/board.php?bo_table=MARTIAL&amp;wr_id=9'">단 한 번의 일탈. 
“당신. 나와 오늘 사고 쳐요.”

그 일탈에 휘말린 남자.
“오늘 당신 상대는 나야. 다른 남자는 안 돼.”

한 번으로 끝날 줄 알았던 인연은
…</p>
                <!--<p class="s_date"><strong><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table="></a></strong></p>-->
            </div>
        </li>
            
            </ul>
</div>
    </div>
    <div style="width:350px;float:left;">
        <div class="lat_web2">
    <h2><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=ROMANCE">로맨스</a></h2>
    <ul>
            <li>
                        <div class="wimg">
                <a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=ROMANCE&amp;wr_id=54"><img src="http://img01.pnstory.kr/files/contents/img/b/2016/01/29/09/1454027912412FE909DD7900.jpg" alt="" width="60" height="80"></a>
            </div>
                        <div class="wcontent" style="margin-left:72px;min-height:80px">
                <p class="s_subject"><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=ROMANCE&amp;wr_id=54">아이러니</a>  </p>
                <p class="s_memo" onclick="location.href='http://www.wenovel.co.kr/bbs/board.php?bo_table=ROMANCE&amp;wr_id=54'">단 한 번의 일탈. 
“당신. 나와 오늘 사고 쳐요.”

그 일탈에 휘말린 남자.
“오늘 당신 상대는 나야. 다른 남자는 안 돼.”

한 번으로 끝날 줄 알았던 인연은
…</p>
                <!--<p class="s_date"><strong><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table="></a></strong></p>-->
            </div>
        </li>
            
            </ul>
</div>
    </div>
    <div style="width:350px;float:left;margin-left:20px">
        <div class="lat_web2">
    <h2><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=SEXSTORY">관능</a></h2>
    <ul>
            <li>
                        <div class="wimg">
                <a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=SEXSTORY&amp;wr_id=74"><img src="http://img01.pnstory.kr/files/contents/img/b/2016/01/29/09/1454027912412FE909DD7900.jpg" alt="" width="60" height="80"></a>
            </div>
                        <div class="wcontent" style="margin-left:72px;min-height:80px">
                <p class="s_subject"><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table=SEXSTORY&amp;wr_id=74">아이러니</a>  </p>
                <p class="s_memo" onclick="location.href='http://www.wenovel.co.kr/bbs/board.php?bo_table=SEXSTORY&amp;wr_id=74'">단 한 번의 일탈. 
“당신. 나와 오늘 사고 쳐요.”

그 일탈에 휘말린 남자.
“오늘 당신 상대는 나야. 다른 남자는 안 돼.”

한 번으로 끝날 줄 알았던 인연은
…</p>
                <!--<p class="s_date"><strong><a href="http://www.wenovel.co.kr/bbs/board.php?bo_table="></a></strong></p>-->
            </div>
        </li>
            
            </ul>
</div>
    </div>
<!-- } 최신글 끝 -->


    </div>
</div>

<!-- } 콘텐츠 끝 -->

<hr>

<!-- 하단 시작 { -->
<div id="ft">
    
<!-- 인기검색어 시작 { -->
<section id="popular">
    <div>
        <h2>인기검색어</h2>
        <ul>
                    <li><a href="http://www.wenovel.co.kr/bbs/search.php?sfl=wr_subject&amp;sop=and&amp;stx=%EC%95%84%EB%82%B4">아내</a></li>
                    <li><a href="http://www.wenovel.co.kr/bbs/search.php?sfl=wr_subject&amp;sop=and&amp;stx=%EB%8D%94">더</a></li>
                    <li><a href="http://www.wenovel.co.kr/bbs/search.php?sfl=wr_subject&amp;sop=and&amp;stx=%ED%99%98%EC%83%9D">환생</a></li>
                    <li><a href="http://www.wenovel.co.kr/bbs/search.php?sfl=wr_subject&amp;sop=and&amp;stx=%EA%B3%A4%EB%A5%9C%EB%AC%B4%EC%8C%8D">곤륜무쌍</a></li>
                    <li><a href="http://www.wenovel.co.kr/bbs/search.php?sfl=wr_subject&amp;sop=and&amp;stx=%EB%AA%A8%EC%9E%90">모자</a></li>
                    <li><a href="http://www.wenovel.co.kr/bbs/search.php?sfl=wr_subject&amp;sop=and&amp;stx=%EC%97%84%EB%A7%88">엄마</a></li>
                    <li><a href="http://www.wenovel.co.kr/bbs/search.php?sfl=wr_subject&amp;sop=and&amp;stx=%EA%B5%AC%EB%A5%B4%EB%AF%B8">구르미</a></li>
                </ul>
    </div>
</section>
<!-- } 인기검색어 끝 -->        <!--<div id="ft_catch"><img src="http://www.wenovel.co.kr/img/ft.png" alt="그누보드5"></div>-->
    <div id="ft_company">
    </div>
    <div id="ft_copy">
        <div>
            <!--<a href="http://www.wenovel.co.kr/bbs/content.php?co_id=company">회사소개</a>
            <a href="http://www.wenovel.co.kr/bbs/content.php?co_id=privacy">개인정보취급방침</a>
            <a href="http://www.wenovel.co.kr/bbs/content.php?co_id=provision">서비스이용약관</a>
            Copyright &copy; <b>소유하신 도메인.</b> All rights reserved.<br>-->
            <br><a href="#hd" id="ft_totop">상단으로</a>
        </div>
    </div>
</div>

<a href="http://www.wenovel.co.kr/index.php?device=mobile" id="device_change">모바일 버전으로 보기</a>
<script>
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-76945372-1', 'auto');
ga('send', 'pageview');

</script>
<!-- } 하단 끝 -->

<script>
$(function() {
    // 폰트 리사이즈 쿠키있으면 실행
    font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));
});
</script>



<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->

</body>
</html>
