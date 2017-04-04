<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <h2>TEXT</h2>
   	<table class="board_list">
   		<colgroup>
   			<col width="10%"/>
   			<col width="30%"/>
   			<col width="10%"/>
   		</colgroup>
   		<thead>
	   		<tr>
	   			<th scope="col"> <a href="#this" class="btn" id="">적금</a> </th>
	   			<th scope="col"> <font>계산</font> </th>
	   			<th scope="col"> <a href="#this" class="btn" id="">대출</a> </th>
	   		</tr>
	   	</thead>
	   	<tbody>
	   		<tr>
	   			<td></td>
	   			<td>
	   				<a href="#this" >월적립액</a> <input type="text" id="money" style="height:20px; text-align: right; color:#A6A6A6; ime-mode:disabled;" value=" 원" />
	   				</br>
	   				<a href="#this" id="money_set" style="font-size:13px; color:#A6A6A6;"></a>
	   			</td>
	   			<td></td>
	   		</tr>
	   		<tr>
	   			<td></td>
	   			<td>
	   				<a href="#this" >적금기간</a> 
	   				<a href="#this" class="btn" id="year">년</a> <a href="#this" class="btn" id="month">개월</a>
	   				<input type="text" size="4" id="state_ym" style="height:20px; text-align: right; color:#A6A6A6;" value="년" />
	   			</td>
	   			<td></td>
	   		</tr>
	   		<tr>
	   			<td></td>
	   			<td>
	   				<a href="#this" >월이자율</a> <input type="text" style="height:20px; text-align: right; color:#A6A6A6;" value=" %" />
	   			</td>
	   			<td></td>
	   		</tr>
	   		<tr>
	   			<td></td>
	   			<td>
	   				<a href="" class="btn" >초기화</a> <a href="" class="btn" >계산하기</a>
	   			</td>
	   			<td></td>
	   		</tr>
	   		
	   	</tbody>
   	</table>
   	
    
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    	
    	$(document).ready(function(){
    		
    		// 년도 이벤트
    		$("#year").on("click", function(e){
    			e.preventDefault();
    			$("#state_ym").val("년");
    		});
    		
    		// 개월 이벤트
    		$("#month").on("click", function(e){
    			e.preventDefault();
    			$("#state_ym").val("개월");
    		});
    		
    		// 금액 숫자만 받기
    		$("#money").keypress(function (e){
    			if(e.which && (e.which <= 47 || e.which >= 58) && e.which != 8){
    				e.preventDefault();
    			}
    		});		
    		

    		// 금액 이벤트처리
    		$("#money").on("keyup", function(e){
    			e.preventDefault();
    			$("#money").css('color','#000000');
    			fn_moneySet($("#money").val());
    		});
    		
    	});
    	
    	// 입력 값 튜닝
    	function fn_moneySet(obj){
    		
    		var money_state = "";
    		var ten_thou = "";
    		var hun_thou = "";
    		
    		if(obj.length == 7){
    			money_state = "만";
    			if(ten_thou = obj.substring(1,5) != "0000"){
    				ten_thou = obj.substring(1,5) +"원";
    			}else{
    				ten_thou = "원";
    			}
    			obj = obj.substring(0,1);
    		}
    		console.log("obj == "+ obj + " ///  길이 = " +obj.length +" // 천단위 == "+ten_thou);
    		$("#money_set").text(obj+money_state+ten_thou);
    	}
    	
    
    </script> 
</body>
</html>