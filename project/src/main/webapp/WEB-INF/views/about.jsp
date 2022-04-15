<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#tbl {width:960px; overflow:hidden; margin:0px auto;}
	.pro {width:200px; float:left; margin-left:25px;}
	#tbl1 {width:960px; overflow:hidden; margin:0px auto; margin-top:30px;}
	.pro1 {width:200px; float:left; margin-left:25px;}
	.pro1 p {text-align: center;}
	.pename, .pkname, .pbrand .plprice {width:150px; font-size:12px; font-weight:bold; padding:5px;}
	.prev{
    margin-top:100px;
    font: bold 30px/1 "arial";
    width: 20px;
    height: 20px;
    border-radius: 50px;
    background-color:transparent;
    border: none;
    float: left;
    color: gray;
    cursor: pointer;
  }
  .next{

	position:relative ; bottom:200px; left:25px;
    font: bold 30px/1 "arial";
    width: 20px;
    height: 20px;
    border-radius: 50px;
    background-color:transparent;
    border: none;
    float: right;
    color: gray;
    cursor: pointer;
   
  }
  
  .title1 {
  	margin-bottom: 20px;
  }
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">  
<div id="tbl1">
	<div>
		<div class="pro1">
			<a href="/product/new">
				<img src="https://dummyimage.com/800x200" width=200 height=50/>
			</a>
			<p>New</p>
		</div>
		<div class="pro1">
			<a href="#">
				<img src="https://dummyimage.com/800x200" width=200 height=50/>
			</a>
			<p>명품</p>
		</div>
		<div class="pro1">
			<a href="#">
				<img src="https://dummyimage.com/800x200" width=200 height=50/>
			</a>
			<p>인기글</p>
		</div>
		<div class="pro1">
			<a href="#">
				<img src="https://dummyimage.com/800x200" width=200 height=50/>
			</a>
			<p>인기브랜드</p>
		</div>
	</div>
</div>      
<div style="padding: 50px 50px; width: 850px; height: 400px; margin:0px auto;">
	<div class="title1">
		<h4>인기상품</h4>
	</div>
	<div id="slider-div"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
		<div class="pro">
			<div><a href=""><img src="/display?fileName={{pimage}}" width=150></a></div>
			<div><p class="ellipsis pename">{{pename}}</p></div>
			<div><p class="ellipsis pkname">{{pkname}}</p></div>
			<div><p class="ellipsis pbrand">{{pbrand}}</p></div>
			<div><p class="ellipsis plprice">{{plprice}}</p></div>
		</div>
		{{/each}}
	</script>
</div>
<div style="padding: 50px 50px; width: 850px; height: 400px; margin:0px auto;">
	<div class="title1">
		<h4>최신상품</h4>
	</div>
	<div id="slider-div1"></div>
	<script id="temp1" type="text/x-handlebars-template">
		{{#each list2}}
		<div class="pro">
			<div><a href=""><img src="/display?fileName={{pimage}}" width=150></a></div>
			<div><p class="ellipsis pename">{{pename}}</p></div>
			<div><p class="ellipsis pkname">{{pkname}}</p></div>
			<div><p class="ellipsis pbrand">{{pbrand}}</p></div>
			<div><p class="ellipsis ssell">{{display ssell}}원</p></div>
		</div>
		{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("display", function(ssell){
		      return ssell.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		   });
	</script>
</div>
<script>

//최신상품슬라이드
	function destroyCarousel() {
	    if ($('#slider-div1').hasClass('slick-initialized')) {
	        $('#slider-div1').slick('unslick');
	    }
	}

    
    $.ajax({
		type:"get",
		dataTtpe:"json",
		url: "/product/list2.json",
		success:function(data){
			var template = Handlebars.compile($("#temp1").html());
			$("#slider-div1").html(template(data));	
			applySlider1();
		}
	});
    
    
    
    function applySlider1(){
        $('#slider-div1').slick({
            slide : 'div',  //슬라이드 되어야 할 태그 ex) div, li 
            infinite : true,  //무한 반복 옵션
            slidesToShow :4,  // 한 화면에 보여질 컨텐츠 개수
            slidesToScroll : 1,  //스크롤 한번에 움직일 컨텐츠 개수
            speed : 500,  // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
            arrows : true,  // 옆으로 이동하는 화살표 표시 여부
            dots : false,  // 스크롤바 아래 점으로 페이지네이션 여부
            autoplay : true,  // 자동 스크롤 사용 여부
            autoplaySpeed : 2000,  // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
            pauseOnHover : true,  // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
            vertical : false,  // 세로 방향 슬라이드 옵션
            prevArrow : "<button type='button' class='prev'>◁</button>",  // 이전 화살표 모양 설정
            nextArrow : "<button type='button' class='next'>▷</button>",  // 다음 화살표 모양 설정
            dotsClass : "slick-dots",  //아래 나오는 페이지네이션(점) css class 지정
            draggable : false,  //드래그 가능 여부 

            // 반응형 웹구현 옵션
            responsive : [
                {
                    breakpoint : 960,  //화면 사이즈 960px
                    settings : { slidesToShow : 3 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                },
                {
                    breakpoint : 768,  //화면 사이즈 768px
                    settings : { slidesToShow : 2 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                }
            ]
        });
    };

	//인기상품 슬라이드
	function destroyCarousel() {
	    if ($('#slider-div').hasClass('slick-initialized')) {
	        $('#slider-div').slick('unslick');
	    }
	}

	    
	    $.ajax({
			type:"get",
			dataTtpe:"json",
			url: "/product/list.json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#slider-div").html(template(data));	
    			applySlider();
			}
		});
	    
	    
	    
	    function applySlider(){
	        $('#slider-div').slick({
	            slide : 'div',  //슬라이드 되어야 할 태그 ex) div, li 
	            infinite : true,  //무한 반복 옵션
	            slidesToShow :4,  // 한 화면에 보여질 컨텐츠 개수
	            slidesToScroll : 1,  //스크롤 한번에 움직일 컨텐츠 개수
	            speed : 500,  // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
	            arrows : true,  // 옆으로 이동하는 화살표 표시 여부
	            dots : false,  // 스크롤바 아래 점으로 페이지네이션 여부
	            autoplay : true,  // 자동 스크롤 사용 여부
	            autoplaySpeed : 2000,  // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
	            pauseOnHover : true,  // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
	            vertical : false,  // 세로 방향 슬라이드 옵션
	            prevArrow : "<button type='button' class='prev'>◁</button>",  // 이전 화살표 모양 설정
	            nextArrow : "<button type='button' class='next'>▷</button>",  // 다음 화살표 모양 설정
	            dotsClass : "slick-dots",  //아래 나오는 페이지네이션(점) css class 지정
	            draggable : false,  //드래그 가능 여부 

	            // 반응형 웹구현 옵션
	            responsive : [
	                {
	                    breakpoint : 960,  //화면 사이즈 960px
	                    settings : { slidesToShow : 3 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                },
	                {
	                    breakpoint : 768,  //화면 사이즈 768px
	                    settings : { slidesToShow : 2 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                }
	            ]
	        });
	    };

</script>