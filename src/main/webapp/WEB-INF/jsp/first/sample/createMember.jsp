<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <h2>CREATE MEMBER</h2>
   <form id="frm" name="frm">
   		<table class="choice_view_v">
   			<colgroup>
				<col width="10%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col" align="left">
					ID
					</th>
					<th scope="col" align="left">
					PAASSWORD
					</th>
					
				</tr>
				<tr>
					<td>
						<input type="text" id="user_id" name="user_id"/>
					</td>
					<td>
						<input type="password" id="user_pw" name="user_pw"/>
					</td>
				</tr>
			</thead>
   		</table>
   		<br/>
   			<a href="#this" id="create_mem" class="btn_ch_1" >가입하기</a>
   </form>
    
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#create_mem").on("click",function(e){
    			e.preventDefault();
    			fn_insertMember();
    		});
    	});
    	
    	
    	// 회원가입
    	function fn_insertMember(){
    		var comSubmit = new ComSubmit("frm");
    		comSubmit.setUrl("<c:url value='/sample/insertMember.do' />");
    		comSubmit.submit();
    	}
    	
    	
    </script> 
</body>
</html>