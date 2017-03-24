<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<h2>Write</h2>
	<form id="frm" name="frm" enctype="multipart/form-data" runat="server">
		<table class="choice_write">
			<colgroup>
				<col width="5%">
				<col width="15%">
				<col width="10%">
				<col width="15"/>
			</colgroup>
			<caption><span>게시글 작성</span></caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3"><input type="text" id="TITLE" name="TITLE" class="wdp_90"></td>	
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="5" cols="30" title="내용" id="CONTENT_1" name="CONTENT_1" placeholder="text"></textarea>
					</td>
					<td class="view_text">
						VS
					</td>
					<td colspan="2" class="view_text">
						<textarea rows="5" cols="30" title="내용" id="CONTENT_2" name="CONTENT_2" placeholder="text"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="file" name="imgInp_1" id="imgInp_1">
					<img id="blah_1" src="#" alt="" width="280" height="200" />	
					</td>
					<td >VS</td>
					<td colspan="2">
					<input type="file" name="imgInp_2" id="imgInp_2">
					<img id="blah_2" src="#" alt="" width="280" height="200" />
					</td>
				</tr>
			</tbody>
		</table>
		
        
        <br/><br/>
		<a href="#this" class="btn" id="write">작성하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</form>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
	<script type="text/javascript">
		
		var gfv_count = 1;
	
		$(document).ready(function(){
		    $("#list").on("click", function(e){ //목록으로 버튼
		        e.preventDefault();
		        fn_openChoiceMain();
		    });
		     
		    $("#write").on("click", function(e){ //작성하기 버튼
		        e.preventDefault();
		        fn_insertChoice();
		    });
		 
		 // 이미지 파일첨부시 미리보기
		    $("#imgInp_1").on('change',function(){
	    		readURL(this,"imgInp_1");
	    	});
		 
		 	$("#imgInp_2").on('change',function(){
		 		readURL(this,"imgInp_2");
		 	});
		    
		});
		
		function fn_openChoiceMain(){
		    var comSubmit = new ComSubmit();
		    comSubmit.setUrl("<c:url value='/choice/openChoiceMain.do' />");
		    comSubmit.submit();
		}
		 
		function fn_insertChoice(){
		    var comSubmit = new ComSubmit("frm");
		    comSubmit.setUrl("<c:url value='/choice/insertChoice.do' />");
		    comSubmit.submit();
		}
		
		// 이미지 URL 미리보기 이벤트 
		function readURL(input,Url){
			if(input.files && input.files[0]){
				var reader = new FileReader();
				
				reader.onload = function (e) {
					if(Url == "imgInp_1"){
						$('#blah_1').attr('src', e.target.result);	
					}else{
						$('#blah_2').attr('src', e.target.result);
					}
					
				}
				
				reader.readAsDataURL(input.files[0]);
				
			}
		}
		
		   
	     
		
	</script>
</body>
</html>