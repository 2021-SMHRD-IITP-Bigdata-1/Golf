    


    $(document).ready(function(){
        $('#golfInfoBox').load("information.html");
    });



    $(function(){

        // 로그인 모달 열기
        $('#login').on("click", function(){
            $('#modalbox').fadeIn();
            $('#loginModalcontent').fadeIn();
        });	

        // 회원가입 모달 열기
        $('#join').on("click", function(){
            $('#modalbox').fadeIn();
            $('#joinModalcontent').fadeIn();
        });	

        // 마이페이지 모달 열기
        $('#mypage').on("click", function(){
            $('#modalbox').fadeIn();
            $('#mypageModalcontent').fadeIn();
        });	

         // 찜 모달 열기
         $('#jjim').on("click", function(){
            $('#modalbox').fadeIn();
            $('#jjimModalcontent').fadeIn();
        });	
       
        // golfmember 모달 열기 (골프장관리자)
        $('#golfmember').on("click", function(){
            $('#modalbox').fadeIn();
            $('#golfmemberModalcontent').fadeIn();
        });	        

        // 로그인, 회원가입, 마이페이지, 찜, 골프멤버(골프장관리자) 창 닫기
        $('#modalbox, #loginX, #joinX, #mypageX, #golfmemberX, #jjimX').on("click", function(){
            $('#modalbox').fadeOut();
            $('#joinModalcontent').fadeOut();           
            $('#mypageModalcontent').fadeOut();           
            $('#jjimModalcontent').fadeOut();           
            $('#golfmemberModalcontent').fadeOut();           
            $('#loginModalcontent').css('display', 'none');
        });	

        // 체크박스_체크리스트 열기
        $('#checkTitleList').on("click",function(){
            $('#checkMenuList').slideDown();
        });
        $('#checkboxUp').on("click",function(){
            $('#checkMenuList').slideUp();
        });

// 골프장 정보 _ 사이드 리스트 박스 _ slide나타나기 (외부 전체박스)-----------------------------------------
        $('#list').click(function(){
            $('#slideSidebox').css('left' , '70px');
            $('#joinsidePageContain').css('display','none');
            $('#joinslideSidebox').css('left','-400px');        
        });

        // 골프장 정보 _ 사이드 내부 상세페이지 박스_나타내기
         $('.golfList').on("click",function(){
             $('#sidePageContain').css('display','block');
         });

        // 골프장 정보 _ 사이드 상세페이지만 닫기
        $('#sidePageContainClose').on("click",function(){
            $('#sidePageContain').css('display','none');           
        });

        // 골프장 정보 _ 사이드 박스 전체 닫기
        $('#sideContainClose').on("click",function(){
            $('#sidePageContain').css('display','none');
            $('#slideSidebox').css('left','-400px');
        });

        // 골프장 정보 _ 상세페이지_ 골프장 정보, 리뷰, 명소조회
        $('#information').on("click",function(){
            $('#golfInfoBox').load("information.html");
            $('#information, #review, #serch').css('background-color','rgba(1, 56, 132, 0)');
            $('#information, #review, #serch').css('color','black');
            $('#information').css('background-color','rgba(1, 56, 132, 0.9)');
            $('#information').css('color','whitesmoke');
        });

        

        $('#serch').on("click",function(){
            $('#golfInfoBox').load("serch.html");
            $('#information, #review, #serch').css('background-color','rgba(1, 56, 132, 0)');
            $('#information, #review, #serch').css('color','black');
            $('#serch').css('background-color','rgba(1, 56, 132, 0.9)');
            $('#serch').css('color','whitesmoke');
        });
// 조인게시판 _ 사이드 리스트 박스 _ slide나타나기 (외부 전체박스)-----------------------------------------
        $('#comm').click(function(){
            $('#joinslideSidebox').css('left' , '70px');
            $('#sidePageContain').css('display','none');
            $('#slideSidebox').css('left','-400px');
        });

        // 조인게시판 _사이드 내부 상세페이지 박스_나타내기
        $('.joinBoardList, #writeBT').on("click",function(){
            $('#joinsidePageContain').css('display','block');
        });

        // 조인게시판 _사이드 상세페이지만 닫기
        $('#joinsidePageContainClose').on("click",function(){
            $('#joinsidePageContain').css('display','none');           
        });

        // 조인게시판 _사이드 박스 전체 닫기
        $('#joinsideContainClose').on("click",function(){
            $('#joinsidePageContain').css('display','none');
            $('#joinslideSidebox').css('left','-400px');
        });

        // 조인게시판 _상세페이지_ 조인게시물 열기
        $('.joinBoardList').on("click",function(){
            $('#joininfoPage').load("joinBoardText.html");
        });

        //조인게시판 _상세페이지_ 글쓰기 열기
        $('#writeBT').on("click",function(){
            $('#joininfoPage').load("joinBoardNew.html");
        });

    });	


    // $(document).ready(function(){
    //     $('#golfInfoBox').load("golfInfo.html");
    // });




    
