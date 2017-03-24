<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <h2>Choice vs Choice</h2>
    
    <div class="titleType">
    
    </div>
    
    <div class="container">
    	<div class="ch_1">
    	<br/>
    		
    	</div>
    	
    	<div class="versus">
    	<br/><br/>
    	<img src="../images/issue.PNG" height="100" width="100"/>
    			<font size="10" color="#FF0000" face="Impact">VS</font>
    	<br/><br/><br/>
    		<a href="#this" class='btn' id="fn_write_Top">	투표하기</a>
    	</div>
		
						
    	<div class="ch_2">
    	<br/>
    	</div>
    </div>
	    
    <form id="frm" name="frm">
    	<table class="choice_view">
			<colgroup>
				<col width="5%" />
				<col width="60%" />
				<col width="5%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">게시물번호</th>
					<th scope="col">제목</th>
					<th scope="col">조회수</th>
					<th scope="col">게시일</th>
				</tr>
			</thead>
			

			<tbody id="ChoiceList">
			</tbody>

		</table>
    </form>
    
    <input type='button' class='btn' value='등록하기' onClick='fn_write();'/>
    
   
    <div id="PAGE_NAVI"></div>
   <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    
    	$(document).ready(function(){
    		
    		
    		fn_selectChoiceList(1); // select 구문 호출
    		e.preventDefault();
    		
    	
    		
    	});
    	
    	
    	
    	function fn_selectChoiceList(pageNo){ // 리스트 호출을 위한 Ajax
    		
    		var comAjax = new ComAjax();
    		comAjax.setUrl("<c:url value='/choice/choiceMain.do' />");
    		comAjax.setCallback("fn_selectChoiceListCallback");
    		comAjax.addParam("PAGE_INDEX",pageNo);
    		comAjax.addParam("PAGE_ROW", 15);
    		comAjax.ajax();
    		
    	}
    	
    	function fn_selectChoiceListCallback(data){ // Ajax 의 callback 함수
    		var total = data.TOTAL;
    		var body = $("table > tbody");
    		body.empty();
    		
    		// HitCnt Top 제목 띄우기
    		$(".titleType").append("<span>"+data.obj.TITLE+"</span>");
    		// HitCnt Top 이미지 띄우기
    		$(".ch_1").append("<img src='../images/"+data.IMG_1.STORED_FILE_NAME+"' height='250' width='300'/>");
    		$(".ch_2").append("<img src='../images/"+data.IMG_2.STORED_FILE_NAME+"' height='250' width='300'/>");
    		
    		
    		if(total == 0){
    			var str ="<tr>"+
    						"<td colspan='4'>조회된 결과가 없습니다.</td>" +
    					 "</tr>";
    			body.append(str);
    		}
    		else{
    			
    			var params = {
    					divId : "PAGE_NAVI",
    					pageIndex : "PAGE_INDEX",
    					totalCount : total,
    					recordCount : 15,
    					eventName : "fn_selectChoiceList"
    			};
    			gfn_renderPaging(params);
    			
    			var str = "";
    			$.each(data.list, function(key, value){
    				str += "<tr>" +
    							"<td>" + value.IDX + "</td>" +
    							"<td algin='center' style='font-weight:bold'>" + 
    								"<a href='#this' name='title'>" + value.TITLE + "</a>" +
    								"<input type='hidden' name='IDX' id='IDX' value=" + value.IDX +">" +
    							"</td>" +
    							"<td>" + value.HIT_CNT + "</td>" +
    							"<td>" + value.CREA_DTM + "</td>" +
    						"</tr>";
    			});
    			
    			body.append(str);
    			
    			$("a[name='title']").on("click", function(e){ // 게시물 투표하기
    				e.preventDefault();
    				fn_vote($(this));
    			});
    			
    			$("#fn_write_Top").on("click",function (e){ // TOP 투표하기
        			e.preventDefault();
        			fn_vote(data.obj.IDX,"TOP");
        		});
        		
    			
    			
    		
    		}
    		
    	}
    	
    	function fn_write(){
    		var comSubmit = new ComSubmit();
    		comSubmit.setUrl("<c:url value='/choice/choiceWrite.do' />");
    		comSubmit.submit();
    	}
        
    	function fn_vote(obj,gubn){
    		
    		var comSubmit = new ComSubmit();
    		comSubmit.setUrl("<c:url value='/choice/choiceView.do' />");
    		if(gubn == "TOP"){
    			comSubmit.addParam("IDX",obj);
    		}else{
    			comSubmit.addParam("IDX",obj.parent().find("#IDX").val());	
    		}
    		comSubmit.submit();
    	}
    	
    </script> 
</body>
</html>