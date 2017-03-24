<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <h2>목록</h2>
    	<div id="user_id"></div>
    	<a href="#this" class="btn_ch_1" id="create"> CREATE </a>
    	<a href="#this" class="btn_ch_2" id="login"> LOGIN </a>
    	<a href="#this" class="btn_ch_3" id="logout"> LOGOUT </a>
    	<br /><br /><br />
    <table>
        <thead>
            <tr>
                <a href="#this" class="btn" id="board" >1. 게시판</a>
            </tr>
            </br></br>
            <tr>
            	<a href="#this" class="btn" id="lotto" >2. 로또</a>
            </tr>
            </br></br>
            <tr>
            	<a href="#this" class="btn" id="Choice" >3. Choice VS Chioce</a>
            </tr>
            </br></br>
        </thead>
    </table>
    <br/>
    <div id="testTbody"></div>
    
     
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
		$(document).ready(function(e){
			var user_id = "<c:out value='${user_id}' />";
			
			if(user_id != null){
				
				$("#user_id").append(user_id);
			}
			
			$("#create").on("click",function(e){
				e.preventDefault();
				fn_create();
			});
			
			$("#login").on("click",function(e){
				e.preventDefault();
				fn_login();
			});
			
			$("#logout").on("click",function(e){
				e.preventDefault();
				fn_logout();
			});
			
			$("#board").on("click",function(e){
				e.preventDefault();
				fn_openBoard();
			});
			
			$("#lotto").on("click", function(e){
				e.preventDefault();
				fn_openLotto();
			});
			
			$("#Choice").on("click", function(e){
				e.preventDefault();
				fn_openChoice();
			});
			
			$("#wenovel").on("click", function(e){
				e.preventDefault();
				fn_wenovel();
			});
			
			
		});
		
		// 회원가입
		function fn_create(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/createMember.do' />");
			comSubmit.submit();
		}
		
		// 로그인
		function fn_login(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/loginMember.do' />");
			comSubmit.submit();
		}
		
		// 로그아웃
		function fn_logout(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/logout.do' />");
			comSubmit.submit();
		}
		
		// 게시판
		function fn_openBoard(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openSampleBoardList.do' />");
			comSubmit.submit();
		}
		
		// 로또
		function fn_openLotto(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/lotto/lottoView.do' />");
			comSubmit.submit();
		}
		
		// 선택
		function fn_openChoice(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/choice/openChoiceMain.do' />");
			comSubmit.submit();
		}
		
		// wenovel
		function fn_wenovel(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/wenovel.do' />");
			comSubmit.submit();
		}
		
    </script> 
</body>
</html>