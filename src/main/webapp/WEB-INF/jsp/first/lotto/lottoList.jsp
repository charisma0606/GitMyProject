<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
    <h2>LOTTO</h2>
	<form id="frm" name="frm">
		<table class="lotto_view">
			
			<colgroup>
				<col width="10%" />
			</colgroup>
				
			<thead>
				<tr>
					<th scope="col" colspan="6"><span>가상 로또 추첨</span></th>
					<th scope="col"><font color="#FF8080"><span>BOUNUS</span></font></th>
				</tr>
			</thead>
			
			
			<tbody align="center" id="check">
			
			</tbody>
			
		
		</table>
		
		</br></br></br></br></br>
		<table class="lotto_view">
			<colgroup>
				<col width="10%" />
			</colgroup>
		
			
			<thead>
				<tr>
					<th scope="col">DELETE</th>
					<th scope="col" colspan="6"><span>My Lotto List</span></th>
					<th scope="col"><span>Check</span></th>
					<th scope="col"><span>RANK</span></th>
				</tr>
			</thead>

			<tbody align="center" id="list">
				
			</tbody>
			

		</table>
	</form>
   
    
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    
    	$(document).ready(function(){
    		
    		
    		fn_selectLottoList(1); // My 리스트 
    		
    		fn_checkLottoNum(); // 추첨 번호 
    		
    		    		
    	});
    	
    	
    	function fn_selectLottoList(pageNo){	// 리시트 등록된 로또 호출 
			
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/lotto/lottoList.do' />");
			comAjax.setCallback("fn_selectLottoListCallback");
			comAjax.addParam("PAGE_INDEX",pageNo);
			comAjax.addParam("PAGE_ROW",15);
			comAjax.ajax();
			
		}
		
		function fn_selectLottoListCallback(data){	// 리스트에 등록된 번호 출력 ajax
			var total = data.TOTAL;
			var body = $("#list");
			body.empty();
			if(total == 0){
				var str = "<tr>" +
								"<td colspan='4'><p>저장된 번호가 없습니다</p></td>" +
						  "</tr>" ;
			
				body.append(str);
				
			}else{
				
				
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					recordCount : 15,
					eventName : "fn_selectLottoList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" +
								"<td>" +
									"<input type='button' class='btn' value='OUT' style='cursor:pointer' onClick='fn_UpdateNum("+ value.IDX +");' />" +
								"</td>" +
								"<td id='index_"+key+"_0'><p> " + value.NUM_1 + " </p></td>" +
								"<td id='index_"+key+"_1'><p> " + value.NUM_2 + " </p></td>" +
								"<td id='index_"+key+"_2'><p> " + value.NUM_3 + " </p></td>" +
								"<td id='index_"+key+"_3'><p> " + value.NUM_4 + " </p></td>" +
								"<td id='index_"+key+"_4'><p> " + value.NUM_5 + " </p></td>" +
								"<td id='index_"+key+"_5'><p> " + value.NUM_6 + " </p></td>" +
								"<td><input type='button' class='btn' value='CHECK'	style='cursor:pointer' onClick='fn_CheckNum("+key+");' /> </td>" +
								"<td id='index_"+key+"'> - </td>" +
						   "<tr>";
				});
				
				body.append(str);
			}
		}
		
		
		function fn_UpdateNum(obj){	// 리스트 업데이트 
			
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/lotto/updateNum.do' />");
			comSubmit.addParam("IDX",obj);
			comSubmit.submit();	
			
		}
		 
		
		function fn_checkLottoNum(){	// 당첨번호 조회 

    		var checkBody = $("#check");
    		
    		var str = "";
    		
    		str += "<tr>";
    		
    				for(var i=0; i<=6; i++){
    					str += "<td id='Go_"+i+"'><span><img src='../images/ajax-loader.gif' /></span></td>";
    				} 
    				
    		str += "</tr>";
    		
    		str += "<tr>";
		    		
					for(var i=0; i<=6; i++){
						str += "<td><input type='button' class='btn' value='GO' style='cursor:pointer' onClick='fn_checkView("+i+");' /></td>";
						
					} 
			
			str += "</tr>";
    		
    		checkBody.append(str);
    		
		}
		
		function fn_checkView(go){ // 로또 번호 생성 
			var lottoNum = Math.floor(Math.random() * 45) + 1;
			
			$("#Go_"+go+"").text( lottoNum );
			$("#Go_"+go+"").css({'font-size':'30px','color':'#0100FF'});
			if(go == 6){
				$("#Go_"+go+"").css({'font-size':'30px','color':'#FF0000'});
			}
			 
		}
		
		function fn_CheckNum(obj){ // 당첨번호 check
			
			var lo_Num = $("#index_"+obj+"_1").text();

			/* var lo_NumArray = new Array();
			lo_NumArray = lo_Num.split("|"); */
			
			
			var same_Num = "";
			var count = 0;
			
			for(var i=0; i<=6; i++){
				for(var ii=0; ii<=6; ii++){
					if(Number($("#index_"+obj+"_"+i+"").text()) == Number($("#Go_"+ii).text())){
						$("#index_"+obj+"_"+i+"").css({'font-weight':'bold','font-size':'20px','color':'#FF0000'});
						same_Num = "Y";
						count += 1;
						if(count == 3){
							$("#index_"+obj+"").text("5등!!!").css({'font-weight':'bold','font-size':'20px','color':'#0100FF'});
						}else if(count == 4){
							$("#index_"+obj+"").text("4등!!!").css({'font-weight':'bold','font-size':'20px','color':'#0100FF'});
						}else if(count == 5){
							$("#index_"+obj+"").text("3등!!!").css({'font-weight':'bold','font-size':'20px','color':'#0100FF'});
						}else if(count == 6){
							$("#index_"+obj+"").text("1등!!!").css({'font-weight':'bold','font-size':'20px','color':'#0100FF'});
						}
						
					}
				}
			}
			
			if(same_Num == ""){
				$("#index_"+obj+"").text("꽝").css({'font-weight':'bold','font-size':'20px','color':'#0100FF'});
			}
		
		}
		
		
		
        
    </script> 
</body>
