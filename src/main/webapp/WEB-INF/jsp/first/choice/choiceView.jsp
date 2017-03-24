<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>

<body>
    <h2>Choice View</h2>
    
    <div class="titleType">
    	<font size="6" color="#626262" face="Impact">${obj.TITLE}</font>
    </div>
    
    <div class=container_2>
    	<div class="ch_1">
    	<br/>
    		<img src="../images/${IMG_1.STORED_FILE_NAME}" height="250" width="300"/> </br>
    		<font size="5" color="#4374D9" face="Impact"></font> 	
    	
    	</div>
    	
    	<div class="versus">
    	<br/><br/><br/><br/><br/><br/><br/>
    		
    		<select id="age" name="age">
    			<option value="0">- 나이 -</option>
    			<c:forEach begin="0" var="i" end="${2017-1900}" step="1">
    				<c:set var="year" value="${2017-i}"/>
    				<option value="${year}">${year}</option>
    			</c:forEach>
    		</select>
    		
    		<br/><br/>
    		<input type="radio" id="sex_gb" name="sex_gb" value="M" checked />남
    		<input type="radio" id="sex_gb" name="sex_gb" value="G"  />여 
    		
    	<br/><br/><br/><br/><br/>
    		
    		<font size="10" color="#FF0000" face="Impact">VS</font>
    		
    	</div>
		
		
						
    	<div class="ch_2">
    	<br/>
    		<img src="../images/${IMG_2.STORED_FILE_NAME}" height="250" width="300"/> </br>
    		<font size="5" color="#2F9D27" face="Impact"></font>
    	</div>
    	
    	<br/><br/> 
    	
    	<div class="ch_text_1">
    	<br/><br/><br/>
    	<font size="3" color="#868686">${obj.CONTENT_1}</font>  
    	<br/><br/>
    	<a href="#this" class="btn_ch_1" id="choice_1">선택</a>
    	
    	</div>
    	
    	<!-- <div class="versus_chart" >
    	</div> -->
    	
    	<div id="versus_chart" class="versus_chart">
    	</div>
    	
    	<div class="ch_text_2">	
    	<br/><br/><br/> 
    	<font size="3" color="#868686">${obj.CONTENT_2}</font>
    	<br/><br/>
    	<a href="#this" class="btn_ch_2" id="choice_2">선택</a>
    	</div>
    	
    	  <!-- <div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div> -->
	    <div id="sex_chart"class="sex_chart">
	    </div>
	    	
	    <div id="age_chart" class="vote_chart">
	    </div>
    	
    </div>
    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    
  
        
    <form id="frm" name="frm">
    	
    	<textarea rows="3" cols="100" placeholder="댓글" id="CONTENT" name="CONTENT"></textarea>
    	<a href="#this" class="btn_insert" id="btn_insert">등록</a>
    	
    	<table class="choice_view_v">
			<colgroup>
				<col width="80%" />
				<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col" align="left">
					<a href="#this" id="LikeDesc"><font color="#000000">호감순</font></a><font color="#EAEAEA"> | </font><a href="#this" id="DtmDesc" ><font color="#A6A6A6">최신순</font></a>
					
					</th>
					<th scope="col" align="left"></th>
				</tr>
			</thead>
			

			<tbody id="ReplyList">
			</tbody>
		</table>
		
    </form>
    
    <div class="bottom">
    	</br></br></br></br>
    	<center>
    		<p class="copyright">본 콘텐츠의 저작권은 운영자에게 있으며 이를 무단 이용하는 경우 저작권법 등에 따라 법적책임을 질 수 있습니다.</p>
    	</center>
    </div>
   
    
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
    
    $(document).ready(function(){
    	
    	fn_voteCount();  // 투표 카운트
    	fn_voteChart();	  // 투표 차트
    	fn_voteSexChart(); // 성별 차트 
    	fn_ageChart(); // 연령별 차트
    	
    	fn_selectReplyList("LIKE_IDX"); // 댓글 조회
    	
    	
    	
    	$("#choice_1").on("click", function(e){
    		e.preventDefault();
    		fn_voteChoice("choice_1");
    	});
    	
    	$("#choice_2").on("click", function(e){
    		e.preventDefault();
    		fn_voteChoice("choice_2");
    	});
    	
    	$("#btn_insert").on("click", function(e){
    		e.preventDefault();
    		fn_insertReply();
    	});
    	    	   	
    	$("#LikeDesc").on("click", function(e){
    		e.preventDefault();
    		$("#LikeDesc > font").css("color","#000000");	// 클릭 색상변경 처리
    		$("#DtmDesc > font").css("color","#A6A6A6");
    		fn_selectReplyList("LIKE_IDX");
    	});
    	
    	$("#DtmDesc").on("click", function(e){
    		e.preventDefault();
    		$("#LikeDesc > font").css("color","#A6A6A6");
    		$("#DtmDesc > font").css("color","#000000");
    		fn_selectReplyList("IDX");
    	});
    	
    	
    	
    });
    
    
    var board_idx = "<c:out value='${obj.IDX}' />";   // 게시판 번호
    var board_title = "<c:out value='${obj.TITLE}' />"; // 게시판 제목
    
    var sex_gb = $("input[type=radio][name=sex_gb]:checked").val();
    
	// vote 카운트	
	var list = new Array(); 
	<c:forEach items="${voteCount}" var="item1">
	list.push("${item1.VOTE_CNT}");
	</c:forEach>
	
	var voteTotal = list[0];
	var count_1   = list[1];
	var count_2   = list[2];
	
	
    
    	function fn_voteChart(){	
    		
    		Highcharts.chart('versus_chart', {
    		    chart: {
    		        plotBackgroundColor: null,
    		        plotBorderWidth: 0,
    		        plotShadow: false
    		    },
    		    title: {
    		        text: false,
    		        align: 'center',
    		        //verticalAlign: 'middle',
    		        y: 40
    		    },
    		    subtitle: {
    		        text: '선택 비율'
    		    },
    		    tooltip: {
    		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    		    },
    		    plotOptions: {
    		        pie: {
    		            dataLabels: {
    		                enabled: false,
    		                distance: -50,
    		                style: {
    		                    fontWeight: 'bold',
    		                    color: 'white'
    		                }
    		            },
    		            startAngle: -180,
    		            endAngle: 180,
    		            center: ['50%', '75%']
    		        }
    		    },
    		    credits: {
    	            enabled: false
    	        },
    		    series: [{
    		        type: 'pie',
    		        name: '비율',
    		        innerSize: '50%',
    		        data: [
    		        	{
    		                name: false,
    		                y: Number(count_1),
    		                color : '#4374D9',
    		                dataLabels: {
    		                    enabled: false
    		                }
    		        	}
    		        	,
    		            {
    		                name: false,
    		                y: Number(count_2),
    		                color : '#2F9D27',
    		                dataLabels: {
    		                    enabled: false
    		                }
    		            }
    		        ]
    		    }]
    		});
    	}
     
    
    
    	function fn_voteSexChart(){ 	// 성별 차트 
    		
    		 
    		var sex_list = new Array(); 
    		<c:forEach items="${sex_chart}" var="item">
    		sex_list.push("${item.SEX_GB}");
    		</c:forEach>
    	
    		var man_cnt = sex_list[0];
    		var girl_cnt   = sex_list[1];
    		 
    		
    		// Radialize the colors
    		Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
    		    return {
    		        radialGradient: {
    		            cx: 0.5,
    		            cy: 0.3,
    		            r: 0.7
    		        },
    		        stops: [
    		            [5, color],
    		            [6, Highcharts.Color(color).brighten(1.3).get('rgb')] // darken
    		        ]
    		    };
    		});

    		// Build the chart
    		Highcharts.chart('sex_chart', {
    		    chart: {
    		        plotBackgroundColor: null,
    		        plotBorderWidth: null,
    		        plotShadow: false,
    		        type: 'pie'
    		    },
    		    title: {
    		    	text : false
    		    },
    		    subtitle: {
    		        text: '투표에 응답한 비율'
    		    },
    		    tooltip: {
    		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    		    },
    		    plotOptions: {
    		        pie: {
    		            allowPointSelect: true,
    		            cursor: 'pointer',
    		            dataLabels: {
    		                enabled: true,
    		                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
    		                style: {
    		                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
    		                },
    		                connectorColor: 'silver'
    		            }
    		        }
    		    },
    		    credits: {
    	            enabled: false
    	        },
    		    series: [{
    		        name: '비율',
    		        color : ['#FF9655', '#FFF263'],
    		        data: [
    		            { name: '남성',
    		              y: Number(man_cnt), // 남성 수 
    		              color: '#6799FF'
    		            },
    		            {
    		                name: '여성',
    		                y: Number(girl_cnt), // 여성 수 
    		                sliced: true,
    		                selected: true,
    		                color: '#F15F5F'
    		            },
    		        ]
    		    }]
    		});
    	}
    	
    	
    	function fn_ageChart(){ 	// 연령별 차트

    		
    		var age_1 = "<c:out value='${age_1.age_1}' />";
    		var age_10 = "<c:out value='${age_1.age_10}' />";
    		var age_20 = "<c:out value='${age_1.age_20}' />";
    		var age_30 = "<c:out value='${age_1.age_30}' />";
    		var age_40 = "<c:out value='${age_1.age_40}' />";
    		var age_50 = "<c:out value='${age_1.age_50}' />";
    		var age_60 = "<c:out value='${age_1.age_60}' />";
    		var age_70 = "<c:out value='${age_1.age_70}' />";
    		

    		var age2_1 = "<c:out value='${age_2.age_1}' />";
    		var age2_10 = "<c:out value='${age_2.age_10}' />";
    		var age2_20 = "<c:out value='${age_2.age_20}' />";
    		var age2_30 = "<c:out value='${age_2.age_30}' />";
    		var age2_40 = "<c:out value='${age_2.age_40}' />";
    		var age2_50 = "<c:out value='${age_2.age_50}' />";
    		var age2_60 = "<c:out value='${age_2.age_60}' />";
    		var age2_70 = "<c:out value='${age_2.age_70}' />";
    		
    		
    		// Age categories
    		var categories = ['0 - 10', '10 - 20', '20 - 30', '30 - 40', '40 - 50',
    		        '50 - 60', '60 - 70', '70 +' ];
    		$(document).ready(function () {
    		    Highcharts.chart('age_chart', {
    		        chart: {
    		            type: 'bar'
    		        },
    		        title: {
    		            text: false
    		        },
    		        subtitle: {
    		            text: '나이별 통계'
    		        },
    		        xAxis: [{
    		            categories: categories,
    		            reversed: false,
    		            labels: {
    		                step: 1
    		            }
    		        }, { // mirror axis on right side
    		            opposite: true,
    		            reversed: false,
    		            categories: categories,
    		            linkedTo: 0,
    		            labels: {
    		                step: 1
    		            }
    		        }],
    		        yAxis: {
    		            title: {
    		                text: null
    		            },
    		            labels: {
    		                formatter: function () {
    		                    return Math.abs(this.value) + '%';
    		                }
    		            }
    		        },

    		        plotOptions: {
    		            series: {
    		                stacking: 'normal'
    		            }
    		        },

    		        tooltip: {
    		            formatter: function () {
    		                return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
    		                    'Population: ' + Highcharts.numberFormat(Math.abs(this.point.y), 0);
    		            }
    		        },
    		        credits: {
        	            enabled: false
        	        },
    		        series: [{
    		            name: 'CHOICE',
    		            data: [age_1*-1, age_10*-1, age_20*-1, age_30*-1, age_40*-1, age_50*-1, age_60*-1, age_70*-1],
    		            color: '#4374D9'
    		        }, {
    		            name: 'CHOICE',
    		            data: [(age2_1*1),(age2_10*1),(age2_20*1),(age2_30*1),(age2_40*1),(age2_50*1),(age2_60*1),(age2_70*1) ],
    		            color: '#2F9D27'
    		        }]
    		    });
    		});
    			
    	}
     
    	function fn_voteCount(){
    		var result = "<c:out value='${result}' />";
    		
    		
    		if(result == "true"){
    			alert("투표처리 되었습니다.");
    		}
    		else if(result == "false"){
    			alert("투표는 아이디 1개당 한번만 가능합니다.");	
    		}
    	
    		
    		$(".ch_1 > font").text(count_1);
    		$(".ch_2 > font").text(count_2);
    		
    		
    	}
    
    
    	function fn_voteChoice(obj){ // 투표하기 
    		
    		var selectGb = $("select option:selected").val();
    		if(selectGb == 0){
        		alert("나이를 선택해주시기 바랍니다.");
        		$("#age").focus();
    		}
    		else{
    			
    			var comSubmit = new ComSubmit();
    			comSubmit.setUrl("<c:url value='/choice/choiceVote.do' />");
    			comSubmit.addParam("voteType",obj);
        		comSubmit.addParam("BOARD_IDX",board_idx);
        		comSubmit.addParam("SEX_GB",$("input[type=radio][name=sex_gb]:checked").val());
        		comSubmit.addParam("AGE_GB",$("#age").val());
        		comSubmit.addParam("TITLE",board_title);
    			comSubmit.submit();
    		}
    		
    	}
    	
     
    	function fn_selectReplyList(order){
    		var comAjax = new ComAjax();
    		comAjax.setUrl("<c:url value='/choice/choiceReply.do' />");
    		comAjax.setCallback("fn_selectRelyResult");
    		comAjax.addParam("BOARD_IDX",board_idx);		// 게시글 번호 파라미터
    		comAjax.addParam("orderBy",order);			// 정렬 파라미터
    		comAjax.ajax();
    	 
    	}
    
    	
    	function fn_selectRelyResult(data){
    		var total = data.replyCnt;
    		var body = $("#ReplyList");
    		
    		var str = "";
    		body.html(str);	// 초기화
    		
    		if(total == 0){
    			var str = "<tr>" +
								"<td>" +
										"댓글을 작성하세요" +				
								"</td>" +
								"<td>" +
									"↑ | ↓" + 
								"</td>" +
					      "</tr>" ;
    			body.append(str);
    		}
    		else{
    			str = "";
    			$.each(data.replyList, function(key, value){
    				str += "<tr>" +
								"<td>" +
									"<span style='font-weight:bold'>" +
										value.CREA_ID	+
									"</span> <br/><br/>" +
										value.CONTENT + "</br>" +
										"<font size='2' color='#999'>" +value.CREA_DTM + "</font>" +
								"</td>" +
								"<td>" +
									"<a href='#this' name='LIKE_R'>↑</a> ("+value.LIKE_IDX+") | "+"<a href='#this' name='HATE_R'>↓ ("+value.HATE_IDX+")" +
									"<input type='hidden' name='RE_IDX' id='RE_IDX' value="+value.IDX+" />" +
								"</td>" +
						 "</tr>" ;
    			});
    			body.append(str);
    			
    			$(".choice_view_v > thead > tr > th:eq(1)").html("총 ("+total+") 개");
    			
    			$("a[name='LIKE_R'],a[name='HATE_R']").on("click",function(e){
    				e.preventDefault();
    				fn_addCount($(this));
    			});
    		}
    		
    	}
    	
    	
    	function fn_addCount(obj){ // 좋아요 싫어요 기능
    		var comAjax = new ComAjax();
    		comAjax.setUrl("<c:url value='/choice/choiceLikeHate.do' />");
    		comAjax.setCallback("fn_selectReplyList");	
    		comAjax.addParam("IDX",obj.parent().find("#RE_IDX").val());  // 댓글 IDX 값
    		comAjax.addParam("LikeGb",obj.attr("name"));	// 좋아요 / 싫어요 구분 값
    		comAjax.ajax();
    		
    	}
    	
    	function fn_insertReply(){ // 댓글 삽입 기능
    		
    		var idx = "<c:out value='${obj.IDX}'/> ";

    		var comSubmit = new ComSubmit("frm");
    		comSubmit.addParam("IDX", idx);
    		comSubmit.setUrl("<c:url value='/choice/choiceView.do' />");
    		comSubmit.submit();
    	}
    
    	
    	function fn_write(){
    		var comSubmit = new ComSubmit();
    		comSubmit.setUrl("<c:url value='/choice/choiceWrite.do' />");
    		comSubmit.submit();
    	}
        
    	function fn_vote(){
    		var comSubmit = new ComSubmit();
    		comSubmit.setUrl("<c:url value='/choice/choiceView.do' />");
    		comSubmit.submit();
    	}
    	
    </script> 
</body>
</html>